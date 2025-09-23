/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
This js file is meant to be used in Cycling'74 Max for the [jsui] object.
It is designed to mimic [preset], but better. 

Copyright (C) 2024 Théophile Clet <contact@tflcl.xyz> - https://tflcl.xyz.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/gpl-3.0.txt>.
*/

autowatch = 0;
// When developping, autowatch = 1 isn't enough. You also need to manually call the loadbang function, and then re-binding the pattrstorage.
// A "loadbang, pattrstorage test" message does the trick.

inlets = 1
setinletassist(0, "Connect to the linked pattrstorage");

outlets = 5;
setoutletassist(0, "Outputs last triggered action");
setoutletassist(1, "Connect to umenu to list stored presets");
setoutletassist(2, "Connect to textedit to edit preset name");
setoutletassist(3, "Connect to toggle to show active presets lock state");
setoutletassist(4, "Dictionary out");


mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// LOOK
var slot_size = 14;
var slot_round = 0;
var slot_round_ratio = 0;

var margin = 4;
var spacing = 4;

var font_size = 14;
var font_name = "Arial";

var background_color = [0.2, 0.2, 0.2, 1];
var empty_slot_color = [0.349, 0.349, 0.349, 1];
var active_slot_color = [0.808, 0.898, 0.910, 1];
var stored_slot_color = [0.502, 0.502, 0.502, 1];
var interp_slot_color = [1.0, 1.0, 1.0, 0.8];
var text_bg_color = [1,1,1, 0.5];
var text_color = [0.129, 0.129, 0.129, 1];
var edited_color = [1, 0.49, 0.263, 1];

var color_1 = [0.743, 0.41, 0.501, 1]; // Color set for the filled slots. I don't like how this is declared. More info in color_wheel() declaration
var color_2 = [0.679, 0.405, 0.669,1];
var color_3 = [0.527, 0.459, 0.756, 1];
var color_4 = [0.367, 0.542, 0.712, 1];
var color_5 = [0.283, 0.606, 0.559, 1];
var color_6 = [0.316, 0.616, 0.377, 1];
var color_wheel_default = [color_1, color_2, color_3, color_4, color_5, color_6];
var color_wheel_custom = color_wheel_default.slice();
var color_wheel_size = 6;

// FEEL
var layout = 0;             // 0: grid mode (same as [preset]). 1: list mode
var display_interp = 1;     // Enable/disable the UI feedback when interpolating between presets
var ignore_slot_zero = 1;   // Makes previous_active_slot and interpolation display to ignore slot 0. Can be usefull when using slot 0 as a temporary step for interpolation.
var auto_writeagain = 0;    // When enabled, will send a "writeagain" to pattrstorage any time a preset is stored/deleted/moved/renamed/(un)locked
var menu_mode = 0;          // Populates the umenu connected to 2nd outlet with preset number and name (0), preset number only (1), or name only (2)
var scrollable = 0;         // Defines weither the object can be scrolled or not
var min_rows = 10;          // Minimum number of rows to display if scrollable is enabled
var color_mode = 0;         // Change the way the filled slots (stored presets) color is handeld. 0: stored_slot_color. 1: looping through color_1 to color_6. 2: Freely assign colors 1 to 6. 3: Set any color to any preset
var select_mode = 0;        // 0: single click to select and recall the slot. 1: single click to select the slot, double click to recall it.
var send_name = "none";     // The global name to send presets dict name to (received by the [receive] object)
var unique_names = false;   // When enabled, force names to be unique when renaming slots by appending "bis" to them. Gets applied only to subsequently renamed presets.
var use_uid = 0;            // Generating UID for each presets when enabled. Requires a [pattr preset_metadata]
var recall_passthrough = true;  // By default (true), clicking a slot sends a recall message directly to [pattrstorage], and the jsui left outlet outputs a recall message once the recall is done. When disabled, clicking a slot will send a recall message straight from the jsui left outlet, so it's up to the user to forward the message to pattrstorage. It can be usefull for triggering interpolations with custom logic.
var ui_rename = false;       // Use the attached textedit, if any, to edit slot names directly in the JSUI frame when clicking a slot while holding the control key. When disabled, the textedit remains untouched but gets focused when clicking a slot while holding the control key.
var poll_edited = 0;        // If >0, check if current preset is edited every X seconds defined by the variable value.
var nbslot_edit = true;     // If nbslot_edit and scrollable are enabled, the last two visible slots are replaced by buttons to add or remove lines of slot.

// (WORK)
var pattrstorage_name, pattrstorage_obj = null;

var columns, rows = 0;
var slots = [];                 // Stores on screen box, name, lock and interpolation state for all slots
var slots_highest = 0;          // Highest filled preset slot number
var slots_count_display = 0;    // Number of slots to be displayed
var true_slots_count_display = 0; // Number of slots to be displayed, including 2 extra slots for nbslot_edit buttons used as buttons instead of preset slots
var filled_slots = [];          // List of stored slots
var filled_slots_dict = new Dict();

var active_slot = 0;            //Last recalled slot
var active_slot_edited = false; //Active slot edited state flag. See run_edited_poll_task()
var previous_active_slot = 0;   //Previously recalled slot
var previous_target = 0;        //Here to deal with ongoing interpolations
var selected_slot = 0;          //Last selected slot. Relevant especially when select_mode = 1. Otherwise it is the same as active_slot

var mess_with_presets = ['insert', 'lockall', 'read', 'readagain', 'remove', 'renumber']; // Received messages that can mess with presets and thus requiring a resync
var to_ignore = ['active', 'alias', 'current', 'dump', 'edited', 'interp', 'priority', 'subscription', 'resolvealias']; // Messages that can come from psto and should be ignored to avoid feedback loops
var to_passthrough = ['clear', 'client_close', 'client_window', 'fade', 'fillempty', 'getactive', 'getalias', 'getclientlist', 'getcurrent', 'getedited', 'getinterp', 'getlockedslots', 'getpriority', 'getslotlist', 'getslotnamelist', 'getstoredvalue', 'getsubscriptionlist', 'grab', 'locate', 'purge', 'readagain', 'setall', 'setstoredvalue', 'storage_close', 'storagewindow', 'storeagain', 'subscribe', 'unsubscribe', 'writeagain', 'writejson', 'writexml']; // Messages that can be passed to psto 

var ui_width = box.rect[2] - box.rect[0];
var ui_height = box.rect[3] - box.rect[1];
var bg_width, bg_height = 0;

var mg = new MGraphics(ui_width, ui_height);
var base_drawing;
var is_painting_base = 0;

var half_slot_size, half_margin, half_spacing;
var last_x, last_y, last_hovered = -1;
var last_hovered_is_preset_slot = false;
var y_offset = 0; // handle scrolling
var drag_scroll = 0; // handle scrolling when dragging outside of boundaries
var shift_hold, option_hold = 0;
var is_interpolating = 0;
var is_dragging = 0;    // Drag flag
var drag_slot = -1;     // Stores the slot that's being dragged
var is_writing = 0;

// Keeping track of various variables for dealing with color modes
var requested_slot = -1; // Which slot we're waiting a value for (used in get_all_presets_metadata)
var color_mode_candidate = 0; // Which color mode we're aiming
var is_listening_to_subscriptionlist = 0; //Filters out received subscriptionlist messages when not updating slot color values
var is_listening_to_clientlist = 0; //Filters out received clientlist messages when not updating slot color values
var metadata_pattr;
var metadata_pattr_address;
var metadata_updated = false; // Flag to write presets file after filling possible empty preset_metadata

var textedit_obj = null;
var textedit_initstate = {};
var is_typing_name = false;

var poll_edited_task = new Task(do_poll_edited, this);

var has_loaded = false;

if (jsarguments.length>1) { // Depreciated, use "pattrstorage" attribute instead of jsarguments.
    pattrstorage_name = jsarguments[1];
}

// FUNCTIONS
function slot(left, top, right, bottom, name, lock, interp, color_index, color_custom, uid) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
    this.name = name;
    this.lock = lock;
    this.interp = interp;
    this.color_index = color_index;
    this.color_custom = color_custom;
    this.uid = uid;

    this.init = function() {
        this.left = 0;
        this.top = 0;
        this.right = 0;
        this.bottom = 0;
        this.name = null;
        this.lock = 0;
        this.interp = -1;
        this.init_color();
        this.uid = 0;
    }

    this.init_color = function() {
        this.color_index = 0;
        this.color_custom = stored_slot_color;
    }

    this.clear = function() {
        this.name = null;
        this.lock = 0;
        this.interp = -1;
        this.color_index = 0;
        this.color_custom = stored_slot_color;
        this.uid = 0;
    }
}

function loadbang() {
    // post("loadbang\n");
    has_loaded = true;
    find_pattrstorage(pattrstorage_name);    
	calc_rows_columns();

    find_textedit();
}

function calc_rows_columns() {
    half_margin = margin / 2;
	half_spacing = spacing / 2;
	half_slot_size = slot_size / 2;

    slots[0] = new slot(0, 0, 0, 0, "(tmp)", 0, -1, 0, stored_slot_color); // Slot 0 is valid, but not represented in the GUI (and never saved by pattrstorage)

    var minus_slots_carry = 0;
    if (layout == 0) {
        columns = Math.floor((ui_width - margin + spacing) / (slot_size + spacing));
        rows = Math.floor((ui_height - margin + spacing) / (slot_size + spacing));
        if (scrollable) {
            rows = Math.max(rows, Math.max(min_rows, Math.ceil(slots_highest/columns)));
            min_rows = Math.max(rows, min_rows);
            if (nbslot_edit) {
                rows += columns >= 2 ? 1 : 2;
                if (columns > 2) {
                    minus_slots_carry = columns - 2;
                }
            }
        }
    } else {
        columns = 1;
        rows = Math.floor((ui_height - margin + spacing) / (slot_size + spacing));
        min_rows = Math.max(rows, min_rows);
        if (scrollable) {
            rows = Math.max(rows, Math.max(min_rows, slots_highest));
            if (nbslot_edit) {
                rows += 2;
            }
        }
    }
    if (scrollable && nbslot_edit) {
        
    }
    true_slots_count_display = columns * rows - minus_slots_carry;
    slots_count_display = scrollable && nbslot_edit ? true_slots_count_display - 2 : true_slots_count_display;
        
    for (var i = 0; i < rows; i++) {
        var top = margin + i * (spacing+slot_size);
        var bottom = top + slot_size;
        for (var j = 0; j < columns; j++) {
            var left = margin + j * (spacing+slot_size);
            var right = left + slot_size;
            var cur = 1 + i * columns + j;

            var prev_state = new slot();
            prev_state.init();
            if (typeof slots[cur] !== 'undefined') {
                prev_state = slots[cur];
            }
            slots[cur] = new slot(left, top, right, bottom, prev_state.name, prev_state.lock, prev_state.interp, prev_state.color_index, prev_state.color_custom, prev_state.uid);
        }
    }
	
    if (slots_count_display < slots_highest) {
        for (var i = slots_count_display + 1; i <= slots_highest; i++) {
            slots[i] = new slot();
            slots[i].init();
        }
    }
	paint_base(); 
}
calc_rows_columns.local = 1;

function draw_slot(id, scale, cont) {
    scale = typeof cont !== 'undefined' ? scale : 1;        // Sets scale to 1 by default if not passed as argument
    cont = typeof cont !== 'undefined' ? cont : mgraphics;  // Sets drawing context to mgraphics by default if not passed as argument

    var offset = slot_size * (1 - scale);


    if(is_painting_base) {
        draw_slot_bubble(slots[id].left * scale, slots[id].top *scale, slot_size * scale, slot_size * scale, cont);

    } else {
        draw_slot_bubble(slots[id].left + offset, slots[id].top + offset, slot_size * scale, slot_size * scale, cont);
    }
    cont.fill();

    if (layout == 1) {
        // slot text background
        var bg_txt_pos_x = margin + slot_size + spacing;
        var bg_txt_pos_y = slots[id].top;
        var bg_txt_dim_w = ui_width - (2*margin + slot_size + spacing);
        var bg_txt_dim_h = slot_size;

        if (slots[id].name != null) {
            cont.set_source_rgba(stored_slot_color);
        } else {
            cont.set_source_rgba(empty_slot_color);
        }

          // slot name
        cont.set_font_size(font_size*scale);
        var text;
        if (scrollable && nbslot_edit && (id > (true_slots_count_display - 2))) {
            if (id == true_slots_count_display - 1) {
                text = "remove slot";
            } else {
                text = "add slot";
            }
        } else {
            text = format_slot_name(id);
        }

        if (is_painting_base) {
            draw_text_bubble(bg_txt_pos_x * scale, bg_txt_pos_y * scale, bg_txt_dim_w * scale, bg_txt_dim_h * scale, text, cont);

        } else {
            draw_text_bubble(bg_txt_pos_x + offset, bg_txt_pos_y + offset, bg_txt_dim_w * scale, bg_txt_dim_h * scale, text, cont);
        }
    }

    if (scrollable && nbslot_edit) {
        cont.set_line_width(Math.floor(slot_size * 0.3));
        if (id > true_slots_count_display - 2) {
            cont.set_source_rgba(stored_slot_color);
            cont.move_to((slots[id].left + slot_size * 0.1) * scale, (slots[id].top  + half_slot_size) * scale);
            cont.rel_line_to(slot_size * 0.8 * scale, 0);
            cont.stroke();
        }
        if (id > true_slots_count_display - 1) {
            cont.move_to((slots[id].left + half_slot_size) * scale, (slots[id].top + slot_size * 0.1) * scale);
            cont.rel_line_to(0, slot_size * 0.8 * scale);
            cont.stroke();
        }
    }
}
draw_slot.local = 1;

function draw_slot_bubble(x, y, w, h, cont) {
    cont = typeof cont !== 'undefined' ? cont : mgraphics;

    // I assume rectange is faster to draw than rectangle_rounded. Btw rectangle_rounded is wacky when showing interpolation. Maybe *interp on  the first slot_round could solve this?
    if (slot_round) {
        cont.rectangle_rounded(x, y, w, h, slot_round_ratio * w, slot_round_ratio * h);
    } else {
        cont.rectangle(x, y, w, h);
    }
}
draw_slot_bubble.local = 1;

function draw_text_bubble(x, y, w, h, text, cont) {
    cont = typeof cont !== 'undefined' ? cont : mgraphics;
    // slot text background
    cont.rectangle_rounded(x, y, w, h, 4, 4);
    cont.fill();

    var text_dim = cont.text_measure(text);

    var txt_pos_x = x + spacing;
    var txt_pos_y = y + (text_dim[1] + h)/2 - text_dim[1]*0.18;

    cont.set_source_rgba(text_color);
    cont.move_to(txt_pos_x, txt_pos_y);
    cont.show_text(text.toString());
}
draw_text_bubble.local = 1;

function format_slot_name(id) {
    var text = id;
    // If slot is locked, add brackets around its number
    if (slots[id].lock == 1) {
        text = '[' + text + ']';
    }
    // If slot has a name, append it to the preset name
    if (slots[id].name != null) {
        text += ': ' + slots[id].name;
    }
    text = text.toString();
    return text;
}
format_slot_name.local = 1;

function paint_base() {
    // We draw all slots (empty and stored ones) so we don't have to for every redraw
    // post("paint_base\n");
    is_painting_base = 1;

    // Background
    bg_width = layout == 0 ? columns * (slot_size + spacing) - spacing + 2 * margin : ui_width;
    bg_height = rows * (slot_size + spacing) - spacing + 2 * margin;
	mg = new MGraphics(ui_width*2, bg_height*2);
	with(mg) {
		set_source_rgba(background_color);
		rectangle(0, 0, bg_width*2, bg_height*2);
		fill();

        select_font_face(font_name);
        set_font_size(font_size);

		// All slots
        for (var i = 1; i <= true_slots_count_display; i++) {
            if (i != drag_slot) { //We mask the slot that is currently dragged as it is drawn at the mouse position already
                if (slots[i].name != null) {
                    if (color_mode == 1) {
                        set_source_rgba(color_wheel_custom[i % color_wheel_size]);
                    } else if (color_mode == 2) {
                        set_source_rgba(color_wheel_custom[Math.abs(slots[i].color_index) % color_wheel_size]);
                    } else if (color_mode == 3) {
                        set_source_rgba(slots[i].color_custom);
                    } else {
                        set_source_rgba(stored_slot_color);
                    }
                } else {
                    set_source_rgba(empty_slot_color);
                }
                draw_slot(i, 2, mg);
            }
        }
	}
    is_painting_base = 0;
    update_umenu();
	base_drawing = new Image(mg);
	mgraphics.redraw();
}
paint_base.local = 1;

function paint()
{
    // Handling Presentation mode enable/disable
    var cur_size = mgraphics.size;
    if (cur_size[0] != ui_width || cur_size[1] != ui_height) {
        onresize(cur_size[0], cur_size[1]);
    } else {
        // post("redraw\n");
        with (mgraphics) {
            select_font_face(font_name);
            set_font_size(font_size);
            translate(0, y_offset);
            // Draw the base, which includes empty and filled slots
            // It is first rendered at twice the size in order to make texts look nice and cripsy on hidpi discplays
            // So we need to scale it down here
            scale(0.5, 0.5);
            image_surface_draw(base_drawing);
            scale(2, 2);
            
            set_line_width(1);
            
            // Active slot
            if (is_dragging == 0 && active_slot > 0 && active_slot <= slots_count_display) {
                set_source_rgba(active_slot_color);
                if (color_mode) {
                    draw_slot_bubble(slots[active_slot].left+1.5, slots[active_slot].top+1.5, slot_size-3, slot_size-3);
                    set_line_width(3);
                    stroke();
                } else {
                    draw_slot_bubble(slots[active_slot].left, slots[active_slot].top, slot_size, slot_size);
                    fill();
                }
            }

            // Previous active slot
            if (is_dragging == 0 && previous_active_slot > 0 && previous_active_slot <= slots_count_display) {
                set_source_rgba(active_slot_color[0], active_slot_color[1], active_slot_color[2], active_slot_color[3] * 0.5);
                if (color_mode) {
                    draw_slot_bubble(slots[previous_active_slot].left+1.5, slots[previous_active_slot].top+1.5, slot_size-3, slot_size-3);
                    set_line_width(3);
                    stroke();
                } else {
                    draw_slot_bubble(slots[previous_active_slot].left, slots[previous_active_slot].top, slot_size, slot_size);
                    fill();
                }
            }

             //Hide dragged slot
            if (is_dragging) {
                set_source_rgba(empty_slot_color);
                draw_slot_bubble(slots[drag_slot].left, slots[drag_slot].top, slot_size, slot_size);
                fill();
            }

            // Selected slot
            if (selected_slot > 0 && selected_slot <= slots_count_display) {
                set_source_rgba(active_slot_color);
                set_line_width(1);
                draw_slot_bubble(slots[selected_slot].left - 0.5, slots[selected_slot].top - 0.5, slot_size + 1, slot_size + 1);
                stroke();
            }

            // Interpolated slots
            if (is_dragging == 0 && display_interp && is_interpolating) {
                
                for (var i = 1; i <= slots_count_display; i++) {
                    var interp = slots[i].interp;
                    if (interp >= 0) {
                        set_source_rgba(interp_slot_color);
                        draw_slot_bubble(slots[i].left, slots[i].top, slot_size, slot_size);
                        stroke();
                        draw_slot_bubble(slots[i].left, slots[i].top + slot_size * (1-interp), slot_size, slot_size * interp);
                        fill();
                    }
                }
            }

            //Edited dot
            if (active_slot_edited && active_slot > 0 && selected_slot <= slots_count_display) {
                set_source_rgba(edited_color);
                ellipse(slots[active_slot].left + 1, slots[active_slot].top + 1, slot_size/3, slot_size/3);
                fill();
            }

            // Hovered slot
            if (last_hovered > -1) {
                if (shift_hold && last_hovered_is_preset_slot) {
                    if (option_hold) {
                        // About to delete
                        set_source_rgba(empty_slot_color[0], empty_slot_color[1], empty_slot_color[2], 0.8);
                        draw_slot_bubble(slots[last_hovered].left + 1, slots[last_hovered].top + 1, slot_size-2, slot_size-2);
                        fill();
                    } else {
                        // About to store
                        set_source_rgba(active_slot_color[0], active_slot_color[1], active_slot_color[2], 0.7);
                        draw_slot_bubble(slots[last_hovered].left + 1, slots[last_hovered].top + 1, slot_size-2, slot_size-2);
                        fill();
                    }
                }

                // Slot border
                set_source_rgba(1, 1, 1, 0.8);
                draw_slot_bubble(slots[last_hovered].left, slots[last_hovered].top, slot_size, slot_size);
                stroke();

                if (layout == 0) {
                    //Text (slot number and name)
                    var text = null;
                    if (scrollable && nbslot_edit && (last_hovered > (true_slots_count_display - 2))) {
                        if (last_hovered == true_slots_count_display - 1) {
                            text = "remove slot row";
                        } else {
                            text = "add slot row";
                        }
                    } else {
                        text = format_slot_name(last_hovered);
                    }
                    var text_dim = text_measure(text);
                    // If the text is too big or a slot is being dragged, display the text on top of the next slot.
                    // Otherwise, it gets displayed on the hovered slot.

                    var bg_txt_dim_w = text_dim[0] > slot_size ? text_dim[0] + 4 : slot_size + 4;
                    var bg_txt_dim_h = text_dim[1] > slot_size ? text_dim[1] + 4 : slot_size + 4;
                    var bg_txt_pos_x = text_dim[0] > slot_size || is_dragging ? slots[last_hovered].left + slot_size + 2: slots[last_hovered].left - 2;
                    var bg_txt_pos_y = text_dim[1] > slot_size || is_dragging ? slots[last_hovered].top - 2 : slots[last_hovered].top - 2;
                    

                    // If there is not enough place on the right and if there is more available place on the left, text is displayed on the left
                    if (bg_txt_pos_x + bg_txt_dim_w > ui_width && slots[last_hovered].left - half_spacing > ui_width - slots[last_hovered].right) {
                        bg_txt_pos_x = slots[last_hovered].left - half_spacing - bg_txt_dim_w;
                    }

                    var txt_pos_x = text_dim[0] > slot_size ? bg_txt_pos_x + half_spacing : bg_txt_pos_x + (bg_txt_dim_w / 2) - (text_dim[0]/2);
                    var txt_pos_y = bg_txt_pos_y + (bg_txt_dim_h + text_dim[1]) / 2 - text_dim[1]*0.18;

                    // Bubble background
                    set_source_rgba(text_bg_color);
                    rectangle_rounded(bg_txt_pos_x, bg_txt_pos_y, bg_txt_dim_w, bg_txt_dim_h, 4, 4);
                    fill();

                    // Buble text
                    set_source_rgba(text_color);
                    move_to(txt_pos_x, txt_pos_y);
                    show_text(text.toString());
                }
                
            }

            // Drag slot
            if (is_dragging) {
                if (layout == 0) {
                    translate(last_x, last_y );
                    rotate(0.15);
                    scale(1.1, 1.1);

                    // Slot shadow
                    set_source_rgba(0, 0, 0, 0.15);
                    for (var i = 0; i<4; i++) {
                        draw_slot_bubble( i*0.4 + 1-slot_size/2, i*0.4 + 1-slot_size/2, slot_size + i*0.8, slot_size+i*0.8);
                        fill();
                    }
                    draw_slot_bubble( 2-slot_size/2, 2-slot_size/2, slot_size, slot_size);
                    fill();

                    //Flying slot
                    set_source_rgba(active_slot_color);
                    draw_slot_bubble( -slot_size/2, -slot_size/2, slot_size, slot_size);
                    fill();
                } else {
                    translate(last_x, last_y );
                    // rotate(0.15);
                    set_source_rgba(active_slot_color);
                    
                    draw_slot_bubble( -slot_size/2, -slot_size/2, slot_size, slot_size);
                    fill();
                    // slot name
                    var text = format_slot_name(drag_slot);
                    var bg_txt_pos_x = slot_size/2+ spacing;
                    var bg_txt_pos_y = -slot_size/2;
                    var bg_txt_dim_w = ui_width - (2*margin + slot_size + spacing);
                    var bg_txt_dim_h = slot_size;
                    set_source_rgba(stored_slot_color);
                    draw_text_bubble(bg_txt_pos_x, bg_txt_pos_y, bg_txt_dim_w, bg_txt_dim_h, text);

                }
                
            }

        }
    }
}
paint.local = 0;

function color_wheel() {
    // Rather than using an array of colors, each color has its own variable, so they can be declared as attributes and saved with the patch
    // But that makes the code sooo ugly...
    var args = arrayfromargs(arguments);
    if (args.length == 0) {
        // Reset to default
        color_wheel_custom = [];
        color_wheel_custom = color_wheel_default.slice();
        color_1 = color_wheel_default[0];
        color_2 = color_wheel_default[1];
        color_3 = color_wheel_default[2];
        color_4 = color_wheel_default[3];
        color_5 = color_wheel_default[4];
        color_6 = color_wheel_default[5];
    } else if (args.length == 5) {
        // Set color
        var n = args[0];
        var col = [args[1], args[2], args[3], args[4]]
        if (n > 0 && n < 7) {
            switch (n) {
                case 1:
                    color_1 = col;
                    break;
                case 2:
                    color_2 = col;
                    break;
                case 3:
                    color_3 = col;
                    break;
                case 4:
                    color_4 = col;
                    break;
                case 5:
                    color_5 = col;
                    break;
                case 6:
                    color_6 = col;
                    break;
            }
            color_wheel_custom[n - 1] = col;
        } else {
            error('color_wheel: index out of range\n');
        }
    }
    paint_base();
}

function setcolor() {
    if (metadata_pattr != undefined) {
        var args = arrayfromargs(arguments);
        var nb_args = args.length;
        var slot_nb = selected_slot;
        if (nb_args < 1 && nb_args > 5) {
            error("color: wrong number of arguments.");
        } else  {
            if (nb_args == 0) {
                // Reset colors of selected slot to default values
                slots[selected_slot].init_color();
            } else if (nb_args == 1) {
                // Set the color index of the currently selected slot (for when color_mode is 2)
                slots[selected_slot].color_index = Math.floor(args);
            } else if (nb_args == 2) {
                // Set the color index to the 2nd argument for the slot number defined by the 1st argument
                slot_nb = Math.floor(args[0]);
                slots[slot_nb].color_index = Math.floor(args[1]);
            } else if (nb_args == 4) {
                // Set the custom color of the currently selected slot (for when color_mode is 3)
                slots[selected_slot].color_custom = [args[0], args[1], args[2], args[3]];
            } else if (nb_args == 5) {
                // Set the custom color for the slot number defined by the 1st argument to the color defined by following arguments in rgba format.
                slot_nb = Math.floor(args[0]);
                slots[slot_nb].color_custom = [args[1], args[2], args[3], args[4]];
            }
            update_preset_metadata_pattr(slot_nb);
            update_filled_slots_dict();
            paint_base();
            trigger_writeagain();
        }
    }
}

function connect_to_metadata_pattr() {
    var obj = this.patcher.getnamed("preset_metadata");
    if (!obj) {
        error("preset_metadata pattr not found.\n");
        metadata_pattr = 0;
        return false;
    } else if (obj.maxclass != "pattr"){
        error("preset_metadata named object is not a pattr object.\n");
        metadata_pattr = 0;
        return false;
    } else if (obj.getattr('invisible') == 1) {
        error("preset_metadata has been found but has invisible attribute set to 1\n");
        metadata_pattr = 0;
        return false;
    } else {
        metadata_pattr = obj;
        get_metadata_pattr_address();
        return true;
    }
}
connect_to_metadata_pattr.local = 1;

function get_metadata_pattr_address() {
    is_listening_to_clientlist = is_listening_to_clientlist == 2 ? 2 : 1; // 2 if setting color mode, 1 otherwise
    to_pattrstorage("getclientlist");
}
get_metadata_pattr_address.local = 1;

function update_preset_metadata_pattr(s) {
    var cstm = slots[s].color_custom;
    var color_val = [slots[s].color_index, cstm[0], cstm[1], cstm[2], cstm[3]];
    to_pattrstorage("setstoredvalue", "preset_metadata", s, JSON.stringify({color: color_val, uid: slots[s].uid}));
}
update_preset_metadata_pattr.local = 1;

function get_all_presets_metadata() {
    if (metadata_pattr) {
            metadata_updated = false;
        if (filled_slots.length) {
            for (var i = 0; i < filled_slots.length; i++) {
                get_preset_metadata(filled_slots[i]);
            }
            requested_slot = -1;
        }
        if (metadata_updated) {
            trigger_writeagain();
        }
    }
}
get_all_presets_metadata.local = 1;

function get_preset_metadata(s) {
    requested_slot = s;
    // Using 'getstoredvalue' doesn't return anything if the storage for a given client in a given preset is empty.
    // Which is a problem when we want to know if the value is empty or not
    // So instead we set the client to a known value, we recall the value for a given preset, and check f the value has changed.
    metadata_pattr.message(0);
    to_pattrstorage('recall', 'preset_metadata', s);

    var metadata_val = metadata_pattr.getvalueof();
    if (metadata_val == 0) {
        if (use_uid) {
            var uid = generateUID();
            slots[s].uid = uid;
        }
        update_preset_metadata_pattr(s);
        metadata_updated = true;
    } else {
        preset_metadata(metadata_val);
    }
}
get_preset_metadata.local = 1;

function preset_metadata(v) {
    var meta_dict = {};
    if (requested_slot > -1 && v) {
        meta_dict = JSON.parse(v);
        if (meta_dict.hasOwnProperty('color')) {
            var args = meta_dict.color;
            if (args.length == 5) {
                var col = Math.max(0, Math.floor(args[0])) % color_wheel_size;
                slots[requested_slot].color_index = col;
                slots[requested_slot].color_custom = [args[1], args[2], args[3], args[4]];
            } else if (args.length == 4) {
                slots[requested_slot].color_index = 0;
                slots[requested_slot].color_custom = args;
            } else if (args.length == 1) {
                var col = Math.max(0, Math.floor(args)) % color_wheel_size;
                slots[requested_slot].color_index = col;
                slots[requested_slot].color_custom = stored_slot_color;
            }
        }
        if (use_uid && meta_dict.hasOwnProperty('uid') && meta_dict.uid) {
            slots[requested_slot].uid = meta_dict.uid;
        } 
    }
}

function anything() {
    // Here just to avoid error messages in case pattrstorage sends unhandled message, like when  using getstoredvalue, getsubscriptionlist, getalias, etc.

    // Handle the "delete" messages here because we can't declare a "function delete" (it is a reserved word in js and cannot be used as a function name.
    if (messagename == "delete") {
        var v = arrayfromargs(arguments)[0];
            v = Math.floor(v);
        if (v >= 0) {
            if (slots[v].lock > 0) {
                error('cannot delete locked slot ' + v + '\n');
            } else {
                slots[v].name = null;
                slots[v].interp = -1;
                if (active_slot == v) {
                    active_slot = 0;
                } else if (previous_active_slot == v) {
                    previous_active_slot = 0;
                }
                                
                if (is_dragging == 0) {
                    to_pattrstorage("delete", v);
                    to_pattrstorage("getslotlist");
                    paint_base();
                    set_active_slot(active_slot);
                    if (!is_dragging) {
                        outlet(0, "delete", v);
                        if (selected_slot == v) {
                            selected_slot == 0
                            outlet(2, 'set');
                            outlet(3, 'set', 0);
                        }
                    }
                    trigger_writeagain();
                }
                
            }
        }
    } else if (to_ignore.indexOf(messagename) > -1) {
        // should be ignored by tc.preset (and sent to psto when applicable)
        // active, alias, clientlist, current, edited, interp, priority, slotname, subscription, read, resolvealias, write
        return
    } else if (mess_with_presets.indexOf(messagename) > -1 ) {
        // If the called function messes with presets, we resync the jsui
        var args = arrayfromargs(arguments);
        args.unshift(messagename);
        to_pattrstorage.apply(null, args);
        resync();
    } else if (to_passthrough.indexOf(messagename) > -1) {
        //Can be passed through without resync:
        // clear, client_close, client_window, dump (require to ignore client value messages), fade, fillempty, getactive, getalias, getclientlist, getcurrent, getedited, getinterp, getlockedslots, getpriority, getslotlist, getslotnamelist, getstoredvalue, getsubscriptionlist, grab, locate, purge, readagain (will trigger resync by sending the read notif), setall, setstoredvalue, storage_close, storagewindow, storeagain, subscribe, unsubscribe, writeagain, writejson, writexml
        var args = arrayfromargs(arguments);
        args.unshift(messagename);
        to_pattrstorage.apply(null, args);
    }
}

function bang() {
    to_pattrstorage("recall", active_slot);
}

function msg_int(v) {
    to_pattrstorage("recall", v);
}

function msg_float(v) {
    var s = Math.floor(v);
    var i = v % 1;
    to_pattrstorage("recall", s, s+1, i);
}

function pattrstorage(v) {
    find_pattrstorage(v);
    paint_base();
}

function slotlist() {
    filled_slots = arrayfromargs(arguments);
    // post('get filled slots list for', pattrstorage_name, ' : ', filled_slots, '\n');
    if (filled_slots.length) {

        // If the highest numbered preset is above the maximum number of displayed presets, we need to extend slots[]
        slots_highest = filled_slots[filled_slots.length - 1];
        if (slots_count_display < slots_highest) {
            for (var i = slots_count_display + 1; i <= slots_highest; i++) {
                slots[i] = new slot();
                slots[i].init();
            }
        }
        for (var i = 0; i < filled_slots.length; i++) {
            to_pattrstorage("getslotname", filled_slots[i]);
        }
        get_all_presets_metadata();
        update_filled_slots_dict();
    }
}

function slotname() {
	var args = arrayfromargs(arguments);
    if (args[0] > 0 && args[1] != "(undefined)") {
		slots[args[0]].name = args[1];
	}
}

function setslotname() {
    // Because [pattrstorage] doesn't output anything when renaming presets with "slotname", we use a custom "setslotname" instead, that will rename the active preset
    if (selected_slot > 0) {
        if (slots[selected_slot].lock == 0) {
            var sname = format_slotname(arrayfromargs(arguments).join(' '));
            if (sname != slots[selected_slot].name) {
                slotname(selected_slot, sname);
                to_pattrstorage("slotname", selected_slot, sname);
                update_umenu();
                update_filled_slots_dict();
                select(selected_slot);
                trigger_writeagain();
                if (layout == 1) {
                    paint_base();
                }
            }
        } else {
            error('Cannot set name of locked slot\n');
        }
    }
}

function format_slotname(name) {
    return unique_names ? make_slotname_unique(name) : name;
}
format_slotname.local = 1;

function make_slotname_unique(name) {
    // Leftover from before using an uid. Found the bis bis bis presets funny (rather than bunch of (undefined) so I left this here
    var current_name = name;
    for (var i = 0; i < filled_slots.length; i++) {
        if (slots[filled_slots[i]].name == current_name && filled_slots[i] != selected_slot) {
            return make_slotname_unique(name + ' bis');
        }
    }
    return current_name
}
make_slotname_unique.local = 1;

function text() {
    var input = arrayfromargs(arguments).join(' ');
    if (is_typing_name && input != slots[selected_slot].name) {
        restore_textedit();
    }
    setslotname(input);
}

function recall() {
	var args = arrayfromargs(arguments);
    var val, src_slot, trg_slot, interp;
    if (args.length == 1) {
        val = Math.abs(args[0]);
        src_slot = Math.floor(val);
        interp = val % 1;
        trg_slot = interp == 0 ? src_slot : src_slot + 1;
    } else if (args.length == 3) {
        src_slot = Math.abs(args[0]);
        trg_slot = Math.abs(args[1]);
        interp = Math.min( 1, Math.max(0, args[2]));
    }

    if ((src_slot == 0 || (filled_slots.indexOf(src_slot) > -1 && slots[src_slot].name != null)) && (trg_slot == 0 || (filled_slots.indexOf(trg_slot) > -1 && slots[trg_slot].name != null))) {
        for (var i = 0; i < filled_slots.length; i++) {
            slots[filled_slots[i]].interp = -1;
        }
        if (ignore_slot_zero == 1 && src_slot == 0) {
            // Set src_slot as if we were interpolating from the last recalled preset different than 0
            // This way we can monitor which preset we come from even if we used preset 0 as intermediary preset
            if (previous_target != active_slot) {
                // If the last target preset was through interpollation or direct recall
                src_slot = previous_active_slot;
            } else {
                src_slot = active_slot;
            }
        }
        if (interp == 0.0) {
            slots[src_slot].interp = -1;
            slots[trg_slot].interp = -1;
            is_interpolating = 0;
            if (previous_target != active_slot) {
                previous_active_slot = active_slot;
            } else if (src_slot != 0) {
                previous_active_slot = src_slot;
            } else {
                previous_active_slot = previous_target;
            }
            set_active_slot(src_slot);
            active_slot_edited = 0;
            run_edited_poll_task();
        } else if (interp == 1.0) {
            slots[src_slot].interp = -1;
            slots[trg_slot].interp = -1;
            is_interpolating = 0;
            previous_target = trg_slot;
            set_active_slot(trg_slot);
            active_slot_edited = 0;
            run_edited_poll_task();
        } else {
            slots[src_slot].interp = 1 - interp;
            slots[trg_slot].interp = interp;
            is_interpolating = 1;
            active_slot = 0;
            // if (src_slot != trg_slot) {
            //     active_slot_edited = 1;
            //     cancel_edited_poll_task();
            // }
        }
        if (recall_passthrough) {
            outlet(0, "recall", src_slot, trg_slot, interp);
        }
	}
	
	mgraphics.redraw();
}

function recall_filled() {
    // Recalling preset by its number in the filled_slots list. Useful when used menu_mode 2
    var args = arrayfromargs(arguments);
    var index = args[0];
	if (index < filled_slots.length) {
        to_pattrstorage('recall', filled_slots[args[0]]);
    }
}

function recallmulti() {
    var args = arrayfromargs(arguments);
    var interp_slots = [];
    var summed_weight = 0;
    
    for (var i = 0; i < args.length; i++) {
        var weight = args[i] % 1.;
        if (weight == 0) weight = 1;
        summed_weight += weight;
        interp_slots.push([Math.floor(args[i]), weight]);
    }

    for (var i = 0; i < interp_slots.length; i++) {
        var nb = interp_slots[i][0];
        if (slots[nb].name != null) {
            interp_slots[i][1] /= summed_weight;
        }  else {
            interp_slots[i][1] = -1;
        }
        slots[nb].interp = interp_slots[i][1]
    }

    is_interpolating = 1;
    active_slot_edited = 0;
    run_edited_poll_task();
    mgraphics.redraw();

    outlet(0, "recallmulti", args);

}

function store(v) {
    v = Math.floor(v);
    if (v >= 0) {
        if (slots[v] && slots[v].lock > 0) {
            error('cannot overwrite locked slot ' + v + '\n');
        } else {
            var recalc_rows_flag = scrollable && v > slots_highest;

            if (metadata_pattr) {
                if (filled_slots.indexOf(v) == -1) {
                    // If storing preset in empty slot
                    // Generating name and uid
                    if (use_uid) {
                        slots[v].uid = generateUID();
                    }
                    slots[v].init_color();
    
                    var preset_name = format_slotname('Preset ' + v);
                    slotname(v, preset_name);
                    to_pattrstorage("slotname", v, preset_name);
                }

                // Updating metadata in pattr object before storing in pattrstorage
                var cstm = slots[v].color_custom;
                var color_val = [slots[v].color_index, cstm[0], cstm[1], cstm[2], cstm[3]];
                var meta_dict = {color: color_val, uid: slots[v].uid};
                metadata_pattr.message(JSON.stringify(meta_dict));
            }

            to_pattrstorage("store", v);
            to_pattrstorage("getslotlist");

            active_slot_edited = 0;
            run_edited_poll_task();

            if (recalc_rows_flag) {
                calc_rows_columns();
            } else {
                paint_base();
            }
            
            if (!(ignore_slot_zero && v == 0)) {
                set_active_slot(v);
            }
            
            outlet(0, "store", v);
            if (v) {
                // We writagain only if stored preset is > 0
                trigger_writeagain();
            }
        }
    }
}

function setlock(v) {
    lock(selected_slot, v);
}

function lock() {
    var args = arrayfromargs(arguments);
    if (args.length == 2) {
        to_pattrstorage("lock", args[0], args[1]);
        to_pattrstorage("getlockedslots");
        outlet(0, "lock", args[0], args[1]);
        update_filled_slots_dict();
        trigger_writeagain();
        if (layout == 1) {
            paint_base();
        } else if (layout == 0) {
            mgraphics.redraw();
        }
    }
}

function lockedslots() {
    var locked_slots = arrayfromargs(arguments);
    for (var i = 1; i < slots.length; i++) {
        slots[i].lock = 0;
    }
    if (locked_slots.length) {
        for (var i = 0; i < locked_slots.length; i++) {
            slots[locked_slots[i]].lock = 1;
            if (locked_slots[i] == selected_slot) {
                select(selected_slot);
            }
        } 
    }
}

function write() {
    var args = arrayfromargs(arguments);
    if (is_writing) {
        is_writing = 0;
        var filename = args[0];
        var state = args[1];
        if (state) {
            post(pattrstorage_name + ' pattrstorage: ' + filename + ' updated\n');
        } else {
            error(pattrstorage_name + ': error while writing ' + filename + '\n');
        }
    } else {
        if (args.length < 2) {
            error("Send your write messages directly to the pattrstorage instead.\n");
        }
    }
}

function read() {
    var args = arrayfromargs(arguments);
    var state = args[1];
    if (state) {
        pattrstorage(pattrstorage_name);
    }
}

// Given that v8ui has a new read method that cannot be overriden, we need to use [substitute read readfile] between [pattrstorage] and [tc.prest]
function readfile(f, s) {
    read(f, s);
}

function clientlist() {
    var client = arrayfromargs(arguments)[0];
    if (is_listening_to_clientlist > 0) {
        var target = 'preset_metadata';
        // Here we look for a 'preset_metadata' client, which is can be in a sublevel of the pattr hierarchy...
        if (client.indexOf(target, client.length - target.length) !== -1) { //...hence checking the end of the client address (same as endsWith())
            metadata_pattr_address = target;
            if (is_listening_to_clientlist == 1) {
                // Define an alias for preset_metadata in case it is not in the root pattrstorage level
                to_pattrstorage('alias', client, 'preset_metadata');
            }
            if (is_listening_to_clientlist == 2) {
                // post("preset_metadata pattr object found and client to bound pattrstorage. Switching to color mode", color_mode_candidate, '\n');
                color_mode = color_mode_candidate;
            }
            is_listening_to_clientlist = 0;
            
            paint_base();
        } else if (client == "done") {
            error("A [pattr preset_metadata] object has been found but seems to be invisible to the pattrstorage.\n")
            is_listening_to_clientlist = 0;
        }
    }
}

function resync() {
    set_active_slot(0);
    slots_clear();
    to_pattrstorage("getslotlist");
    to_pattrstorage("getlockedslots");
    calc_rows_columns();

}

function find_pattrstorage(name) {
    active_slot = 0;
    pattrstorage_obj = this.patcher.getnamed(name);
    if (pattrstorage_obj == null) {
        var parent_patcher = this.patcher.parentpatcher;
        pattrstorage_obj = parent_patcher == undefined ? null : this.patcher.parentpatcher.getnamed(name);
    }

    if (pattrstorage_obj != null) {
        pattrstorage_name = name;
        filled_slots_dict.name = pattrstorage_name + '_presets_dict';
        slots_clear();
        // this.patcher.hiddenconnect(pattrstorage_obj, 0, this.box, 0);
        // post('lets find presets_metata pattr for', name, '\n');
        if (use_uid || color_mode > 1) connect_to_metadata_pattr();
        to_pattrstorage("getslotlist");
        to_pattrstorage("getlockedslots");
    } else {
        pattrstorage_name = null;
        active_slot = 0;
        previous_active_slot = 0;
        selected_slot = 0;
        slots_clear();
        if (name != undefined) {
            error("Pattrstorage", name, "doesn't exist.\n");
        }
    }
}
find_pattrstorage.local = 1;

function to_pattrstorage() {
    if (pattrstorage_obj && pattrstorage_obj.maxclass === 'pattrstorage') {
        // post('sending to pattrstorage: ', arrayfromargs(arguments), '\n');
        pattrstorage_obj.message(arrayfromargs(arguments));
    }
}

function select(v) {
    if (filled_slots.indexOf(v) > -1) {
        selected_slot = v;
        set_umenu(selected_slot);
        if (selected_slot != 0) {
            outlet(2, "set", slots[selected_slot].name);
        } else  {
            outlet(2, "set");
        }
        outlet(3, "set", slots[selected_slot].lock);
    }
}

function slots_clear() {
    slots[0].init();
    slots[0].name = "(tmp)";
	for (var i = 1; i < slots.length; i++) {
		slots[i].clear();
	}
}
slots_clear.local = 1;

function get_slot_index(x, y) {
    // Returns which slot is hovered by the mouse
	for (var i = 1; i <= true_slots_count_display; i++) {
        if (layout === 0) {
            if (y > (slots[i].top - half_spacing) && y < (slots[i].bottom + half_spacing) && x > (slots[i].left - half_spacing) && x < (slots[i].right + half_spacing)) {
                return i;
            }
        } else if (layout === 1) {
            if (y > (slots[i].top - half_spacing) && y < (slots[i].bottom + half_spacing)) {
                return i;
            }
        }
	
	}
	return -1;
}
get_slot_index.local = 1;

function set_active_slot(int) {
    if (int < 0) {
        active_slot = 0;
    } else {
        active_slot = int;
    }
    // outlet(0, "previous", previous_active_slot);
    select(active_slot);
}
set_active_slot.local = 1;

function update_umenu() {
    if (pattrstorage_obj !== null) {
        outlet(1, "clear");
        outlet(1, "setcheck", 8226);
        
        for (var i=0; i < filled_slots.length; i++) {
            var nb = filled_slots[i];
            var txt = slots[filled_slots[i]].name;
            switch(menu_mode){
                case 0:
                    outlet(1, "append", nb, txt);
                    break;
                case 1:
                    outlet(1, "append", nb);
                    break;
                case 2:
                    outlet(1, "append", txt);
                    break;
            }
        }

        if (layout == 1) {
            set_umenu(selected_slot);
        }
    }
}
update_umenu.local = 1;

function update_filled_slots_dict() {
    // Creates a dict containing slot id, uid, name, lock, color index and color_custom for all existing presets
    // And sends the dict name to a receive.
    // Best would be to allow for single slot updates, but for that we need to be able to know which at index of filled_slot is a slot id.
    filled_slots_dict.clear();
    var by_slot = {};
    var by_uid = {};
    for (var i = 0; i < filled_slots.length; i++) {
        var slot_index = filled_slots[i];
        var tmp_dict = {
            index: slot_index,                                      // Preset slot number (unique, non-persistent)
            name: slots[slot_index].name,                           // Preset name (non unique, non-persistent)
            uid: slots[slot_index].uid,                             // Preset uid (unique and persistent across preset renaming, overwriting and moving) Useful for keeping track of preset across changes
            u_name: slot_index + ' | ' + slots[slot_index].name,    // '3 | Third preset': (unique, non-persistent) Useful for easy preset listing and retrieving
            lock: slots[slot_index].lock,                           // Preset lock state
            color_index: slots[slot_index].color_index,             // Preset color index (when color_mode = 2)
            color_custom: slots[slot_index].color_custom,            // Preset color (when color_mode = 3)
        };
        // post('updating by_uid', slots[slot_index].uid, '\n');
        by_slot[slot_index] = tmp_dict;
        if (use_uid) by_uid[slots[slot_index].uid] = tmp_dict;
    }
    filled_slots_dict.setparse('by_slot', JSON.stringify(by_slot));
    if (use_uid) filled_slots_dict.setparse('by_uid', JSON.stringify(by_uid));

    var tmp_send_name = send_name == "none" ? pattrstorage_name + '_presets_dict' : send_name;
    outlet(4, 'dictionary', filled_slots_dict.name);
    messnamed(tmp_send_name, 'dictionary', filled_slots_dict.name);

}
update_filled_slots_dict.local = 1;

function set_umenu(v) {
    outlet(1, "clearchecks");
    var item = filled_slots.indexOf(v);
    outlet(1, "checkitem", item);
    outlet(1, "set", item);
}

function trigger_writeagain() {
    if (auto_writeagain && !is_dragging) {
        is_writing = 1;
        to_pattrstorage("writeagain");

    }
}
trigger_writeagain.local = 1;

function find_textedit() {
    var cords = this.box.patchcords;
    for (var c = 0; c < cords.outputs.length; c++) {
        if (cords.outputs[c].srcoutlet == 2 && cords.outputs[c].dstobject.maxclass == "textedit") {
            textedit_obj = cords.outputs[c].dstobject;
            textedit_obj.setattr('keymode', 1);
            textedit_obj.setattr('lines', 1);
            break;
        }
    }
}
find_textedit.local = 1;

function set_textedit(s) {
    // Store initial textedit state
    if (slots[s].lock == false && textedit_obj != null) {
        if (ui_rename) {
            textedit_initstate.presentation = textedit_obj.getattr('presentation');
            textedit_initstate.hidden = textedit_obj.getattr('hidden');
            textedit_initstate.patching_rect = textedit_obj.getattr('patching_rect');
            textedit_initstate.presentation_rect = textedit_obj.getattr('presentation_rect');
            textedit_initstate.bgcolor = textedit_obj.getattr('bgcolor');
            textedit_initstate.bordercolor = textedit_obj.getattr('bordercolor');
            textedit_initstate.textcolor = textedit_obj.getattr('textcolor');
            textedit_initstate.fontname = textedit_obj.getattr('fontname');
            textedit_initstate.fontsize = textedit_obj.getattr('fontsize');
            textedit_initstate.fontface = textedit_obj.getattr('fontface');
            textedit_initstate.textjustification = textedit_obj.getattr('textjustification');

            // Apply new textedit state
            var pos = this.patcher.getattr("presentation") ? this.box.getattr('presentation_rect') : this.box.getattr('patching_rect');
            textedit_obj.setattr('bgcolor', stored_slot_color);
            textedit_obj.setattr('bordercolor', [0,0,0,0]);
            textedit_obj.setattr('textcolor', text_color);
            textedit_obj.setattr('fontname', font_name);
            textedit_obj.setattr('fontsize', font_size-1);
            textedit_obj.setattr('fontface', 0);
            textedit_obj.setattr('textjustification', 0);

            if (layout == 0) {
                textedit_obj.message('position', pos[0] + margin, pos[1] + slots[s].top + y_offset);
                textedit_obj.message('size', ui_width - (2*margin), slot_size + 1);
                // Only works in v8ui
                // textedit_obj.position = [pos[0] + margin, pos[1] + slots[s].top + y_offset];
                // textedit_obj.size = [ui_width - (2*margin), slot_size + 1];
            } else if (layout == 1) {
                textedit_obj.message('position', pos[0] + margin + slot_size + spacing, pos[1] + slots[s].top + y_offset);
                textedit_obj.message('size', ui_width - (2*margin + slot_size + spacing), slot_size + 1);
                // Only works in v8ui
                // textedit_obj.position = [pos[0] + margin + slot_size + spacing, pos[1] + slots[s].top + y_offset];
                // textedit_obj.size = [ui_width - (2*margin + slot_size + spacing), slot_size + 1];
            }
            textedit_obj.setattr('presentation', this.patcher.getattr("presentation"));
            textedit_obj.setattr('hidden', 0);
        }
        textedit_obj.message("select");
        is_typing_name = s;
    }
}

function restore_textedit() {
    // Restore [textedit] to initial state
    if (textedit_obj != null) {
        if (ui_rename) {
            textedit_obj.setattr('bgcolor', textedit_initstate.bgcolor);
            textedit_obj.setattr('bordercolor', textedit_initstate.bordercolor);
            textedit_obj.setattr('textcolor', textedit_initstate.textcolor);
            textedit_obj.setattr('fontname', textedit_initstate.fontname);
            textedit_obj.setattr('fontsize', textedit_initstate.fontsize);
            textedit_obj.setattr('fontface', textedit_initstate.fontface);
            textedit_obj.setattr('textjustification', textedit_initstate.textjustification);
            textedit_obj.setattr('presentation', textedit_initstate.presentation);
            textedit_obj.setattr('hidden', textedit_initstate.hidden);
            textedit_obj.setattr('patching_rect', textedit_initstate.patching_rect);
            textedit_obj.setattr('presentation_rect', textedit_initstate.presentation_rect);
            textedit_obj.message('set', slots[is_typing_name].name);
        }
        is_typing_name = false;
    }
}
restore_textedit.local = 1;

// MOUSE EVENTS
function onidle(x,y,but,cmd,shift,capslock,option,ctrl)
{
    var redraw_flag = false;
    if (last_x != x || last_y != y - y_offset) {
        last_x = x;
		last_y = y - y_offset;
        var cur = get_slot_index(x, y - y_offset);
		if (cur != last_hovered) {
			last_hovered = cur;
            redraw_flag = true;
		}
    }
    if (shift_hold != shift || option_hold != option) {
        shift_hold = shift;
		option_hold = option;
        redraw_flag = true;
    }
    last_hovered_is_preset_slot = scrollable && nbslot_edit && last_hovered > (true_slots_count_display - 2) ? false : true;
    if (redraw_flag) {
        mgraphics.redraw();
    }
}
onidle.local = 1;

function onidleout(x, y)
{
    if (is_typing_name) {
        if (x <= 0 || y <= 0 || x >= ui_width || y >= ui_height) {
            restore_textedit();
        }
    }
	last_hovered = -1;
	mgraphics.redraw();
}
onidleout.local = 1;

function onclick(x,y,but,cmd,shift,capslock,option,ctrl)
{
    if (scrollable && nbslot_edit) {
        // Click "-"
        if (last_hovered == true_slots_count_display - 1) {
            var tmp_min_rows = min_rows;
            setmin_rows(min_rows-1);
            y_offset = -1 * (bg_height - ui_height);
            if (tmp_min_rows != min_rows) {
                if (layout == 0) {
                    last_hovered = last_hovered - columns;
                } else {
                    last_hovered = last_hovered - 1;
                }
            }
            mgraphics.redraw();
            return
        // Click "+"
        } else if (last_hovered == true_slots_count_display) {
            var tmp_min_rows = min_rows;
            setmin_rows(min_rows+1);
            y_offset = -1 * (bg_height - ui_height);
            if (tmp_min_rows != min_rows) {
                if (layout == 0) {
                    last_hovered = last_hovered + columns;
                } else {
                    last_hovered = last_hovered + 1;
                }
            }
            mgraphics.redraw();
            return
        }
    }
    if (is_typing_name) {
        restore_textedit();
    }
	if (last_hovered > -1 && pattrstorage_name != null && last_hovered_is_preset_slot) {
		var output = "recall";
        if (select_mode) {
            output = "select";
        }
		if (shift) {
			output = "store";
			if (option) {
				output = "delete";
			}
            if (ctrl) {
                output = "lock";
            }
		} else if (ctrl && filled_slots.indexOf(last_hovered) > -1) {
            output = "rename";
        } else if (slots[last_hovered].name == null) {
			return;
		}
        if (output == "recall" && recall_passthrough == false) {
            // if recall_passthrough == true, send the recall message to pattrstorage directly
            outlet(0, 'recall', last_hovered);
        } else if (output == "store") {
            store(last_hovered);
        } else if (output == "select") {
            select(last_hovered);
            // mgraphics.redraw();
        } else if (output == "lock") {
            lock(last_hovered, 1 - slots[last_hovered].lock);
            if (selected_slot == last_hovered) {
                outlet(3, "set", slots[last_hovered].lock);
            }
        } else if (output == "rename") {
            select(last_hovered);
            set_textedit(last_hovered);
        } else {
            to_pattrstorage(output, last_hovered);
        }
	}
	
	last_x = x;
	last_y = y - y_offset;
}
onclick.local = 1;

function ondblclick(x,y,but,cmd,shift,capslock,option,ctrl)
{
	if (select_mode && last_hovered > -1 && pattrstorage_name != null && filled_slots.indexOf(last_hovered) > -1) {
        if (recall_passthrough) {
            to_pattrstorage("recall", last_hovered);
        } else {
            outlet(0, 'recall', last_hovered);
        }
	}
	
	last_x = x;
	last_y = y - y_offset;
}
ondblclick.local = 1;

function ondrag(x,y,but,cmd,shift,capslock,option,ctrl)
{
    if (pattrstorage_name != null) {
        y -=  y_offset;
        if (is_dragging == 0 && last_hovered > 0 && slots[last_hovered].name !== null) {
            // To prevent mistakes, is_dragging is set to 1 only when dragging for more than 10 pixels
            var dist_from_start = Math.sqrt((x-last_x)*(x-last_x)+(y-last_y)*(y-last_y));
            if (dist_from_start > 10) {
                is_dragging = 1;
                drag_slot = last_hovered;
            }

        } else if (is_dragging == 1) {
            last_hovered = get_slot_index(x, y);
            last_hovered_is_preset_slot = scrollable && nbslot_edit && last_hovered > (true_slots_count_display - 2) ? false : true;
            if (!last_hovered_is_preset_slot) {
                last_hovered = 0;
            }
            if (!but) {
                // When the button is released, the dragging ceases
                if (last_hovered > 0 && last_hovered != drag_slot && last_hovered_is_preset_slot) {
                    var cur_active_slot = active_slot;
                    var cur_prev_active_slot = previous_active_slot;
                    var offset = ((last_hovered <= drag_slot) && slots[last_hovered].name != null) ? 1 : 0;
                    var offset_others = slots[last_hovered].name != null ? 1 : 0;
                    var drag_slot_lock = slots[drag_slot].lock;
                    var recalc_rows_flag = 0
                    // If the slot we wan to drag is locked, we need to temporarily unlock it.
                    if (drag_slot_lock) {
                        lock(drag_slot, 0);
                    }
                    // If new slot is empty we just move the drag preset here. If it's not, we move al next slots to the right
                    if (slots[last_hovered].name !== null) {
                        if (slots_highest == slots_count_display) {
                            // If there's a stored preset in the last displayed slot, it will be pushed to a new row at insert, so we need to add a new row at redraw
                            recalc_rows_flag = 1;
                        }
                        to_pattrstorage("insert", last_hovered);
                    }
                    
                    to_pattrstorage("copy", drag_slot + offset, last_hovered);
                    to_pattrstorage("delete", drag_slot + offset);
                    
                    slots_clear();
                    to_pattrstorage("getslotlist");
                    to_pattrstorage("getlockedslots");

                    // All this just to keep trace of the active and previous active slots
                    if (cur_active_slot == drag_slot) {
                        active_slot = last_hovered;
                    } else if (last_hovered == cur_active_slot) {
                        active_slot = cur_active_slot + 1;
                    } else if (cur_active_slot > last_hovered) {
                        active_slot += offset_others;
                    }
                    if (cur_prev_active_slot == drag_slot) {
                        previous_active_slot = last_hovered;
                    } else if (cur_prev_active_slot == last_hovered){
                        previous_active_slot = cur_prev_active_slot + 1;
                    } else if (cur_prev_active_slot > last_hovered) {
                        previous_active_slot += offset_others;
                    }

                    // If the dragged slot was locked, relock it.
                    if (drag_slot_lock) {
                        lock(last_hovered, 1);
                    }
                    outlet(0, "drag", drag_slot, last_hovered, offset);
                    is_dragging = 0;
                    drag_slot = -1;

                    select(last_hovered);

                    if (recalc_rows_flag) {
                        calc_rows_columns();
                    } else {
                        paint_base();
                    }
                    
                    trigger_writeagain();

                } else {
                    // Drag released but not somewhere we can throw a slot in
                    is_dragging = 0;
                    drag_slot = -1;
                    paint_base();
                }
            } else {
                // Click still hold, we keep dragging
                if (scrollable) {
                    // Auto-scroll if mouse out of bounds
                    if (y+y_offset < 0 && y-(last_y-drag_scroll) < 0) {
                        drag_scroll = 2;
                    } else if (y+y_offset > ui_height && y-(last_y-drag_scroll) > 0) {
                        drag_scroll = -2;
                    } else {
                        drag_scroll = 0;
                    }
                    y_offset += drag_scroll;
                    y_offset = Math.min(y_offset, 0);
                    y_offset = Math.max(y_offset, -1 * (bg_height - ui_height));
                }
                
                mgraphics.redraw();
            }
            last_x = x;
            last_y = y;
        }
    }
}
ondrag.local = 1;

function onwheel(x, y, wheel_inc_x, wheel_inc_y, cmd, shift, caps, opt, ctrl)
{
    if (scrollable) {
        y_offset += wheel_inc_y * 100.0;
        y_offset = Math.min(y_offset, 0);
        y_offset = Math.max(y_offset, -1 * (bg_height - ui_height));
        mgraphics.redraw();
    }
}
onwheel.local = 1;

// RESIZING
function onresize(w,h)
{
    ui_width = w;
    ui_height = h;
	calc_rows_columns();
    to_pattrstorage("getslotlist");
	paint_base();
}
onresize.local = 1;

// 64x64 is the default jsui size. We use that to know if the object has just been created,
// in which case we resize it to a more convenient size to start with.
if (ui_width == 64 && ui_height == 64) {
    box.setboxattr("patching_rect", box.rect[0], box.rect[1], 130, 58);
}
// Allows for dynamic resizing even in presentation mode (addressing the limitation of onresize())
var pres_rect = new MaxobjListener(this.box,"presentation_rect",get_prect);
function get_prect(prect) {
    // post(this.patcher.wind.assoc.getattr("globalpatchername") == max.frontpatcher.wind.assoc.getattr("globalpatchername") ? 1 : 0, "\n")
    onresize(prect.value[2], prect.value[3])
}
get_prect.local = 1;

function notifydeleted(){
    poll_edited_task.freepeer();
}

// ATTRIBUTES DECLARATION
// If loaded in JSUI, only the first 4 arguments passed in declareattribute() will be used (no attribute styling). V8UI will also use the latest object argument.
declareattribute("pattrstorage", "getpattrstorage","setpattrstorage", 1, {type: "symbol", label: "Pattrstorage"});
function getpattrstorage() {
    if (pattrstorage_name == null) {
        return 
    } else {
	    return pattrstorage_name;
    }
}
function setpattrstorage(v){
    // This method is called for the first time when the patch is loading, before the loadbang (not all objects are instanciated yet)
    // With v being the value stored whithin the patcher
    if (v == null || v == 0 || v.lastIndexOf('#') === 0) {
        pattrstorage_name = null;
        pattrstorage_obj = null;
    } else  {
        pattrstorage_name = arrayfromargs(arguments)[0];
    }
    // post('set_pattrstorage', pattrstorage_name, '\n');

    // If the loadbang already occured once, we need to retrigger here
    if (has_loaded) {
        loadbang();
    } else {
        // Otherwise, we have no way to know how we're here in the code
        // (was it just an attribute change? or maybe the object got copy-pasted with already set attribute, or it is being instantiated at patch load with saved attributes)
        // So we have to delay the loadbang to make sure it will work in any case
        // and won't be triggered before this or other objects are being instantiated completely.
        var init_tsk = new Task(delayed_init);
        init_tsk.schedule(200);
    }
}

function delayed_init() {
    loadbang();
    arguments.callee.task.freepeer();
}
delayed_init.local = 1;

declareattribute("bubblesize", "getslotsize", "setslotsize", 1, {type: "long", default: 14, label: "Slot Size", category: "Appearance"});
function getslotsize() {
	return slot_size;
}
function setslotsize(v){
    if (arguments.length) {
        slot_size = Math.max(2, v);
    } else {
        slot_size = 14;
    }
	calc_rows_columns();
}

declareattribute("slot_round", "getslotround", "setslotround", 1, {type: "long", default: 0, label: "Slot Round", category: "Appearance"});
function getslotround() {
	return slot_round;
}
function setslotround(v){
    if (arguments.length) {
        slot_round = Math.max(0, Math.min(slot_size, v));
    } else {
        slot_round = 0;
    }
    slot_round_ratio = slot_round / slot_size;
	calc_rows_columns();
}

declareattribute("margin", "getmargin", "setmargin", 1, {type: "long", default: 4, label: "Margin", category: "Appearance"});
function getmargin() {
	return margin;
}
function setmargin(v){
    if (arguments.length) {
        margin = Math.max(0, v);
    } else {
        margin = 4;
    }
	calc_rows_columns();
}

declareattribute("spacing", "getspacing", "setspacing", 1, {type: "long", default: 4, label: "Spacing", category: "Appearance"});
function getspacing() {
	return spacing;
}
function setspacing(v){
    if (arguments.length) {
        spacing = Math.max(1, v);
    } else {
        spacing = 4;
    }
	calc_rows_columns();
}

declareattribute("bgcolor", "getbgcolor", "setbgcolor", 1, {style: "rgba", label: "Background Color", category: "Appearance"});
function getbgcolor() {
	return background_color;
}
function setbgcolor(){
    if (arguments.length == 4) {
        background_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        background_color = [0.2, 0.2, 0.2, 1];
    } else {
        error('bgcolor: wrong number of arguments\n');
    }
	paint_base();
}

declareattribute("empty_slot_color", "getemptycolor", "setemptycolor", 1, {style: "rgba", label: "Empty Slot Color", category: "Appearance"});
function getemptycolor() {
	return empty_slot_color;
}
function setemptycolor(){
    if (arguments.length == 4) {
        empty_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        empty_slot_color = [0.349, 0.349, 0.349, 1];
    } else {
        error('empty_slot_color: wrong number of arguments\n');
    }
	paint_base();
}

declareattribute("active_slot_color", "getactiveslotcolor", "setactiveslotcolor", 1, {style: "rgba", label: "Active Slot Color", category: "Appearance"});
function getactiveslotcolor() {
	return active_slot_color;
}
function setactiveslotcolor(){
    if (arguments.length == 4) {
        active_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        active_slot_color = [0.808, 0.898, 0.910, 1];
    } else {
        error('active_slot_color: wrong number of arguments\n');
    }
	mgraphics.redraw();
}

declareattribute("stored_slot_color", "getstoredslotcolor", "setstoredslotcolor", 1, {style: "rgba", label: "Stored Slot Color", category: "Appearance"});
function getstoredslotcolor() {
	return stored_slot_color;
}
function setstoredslotcolor(){
    if (arguments.length == 4) {
        stored_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        stored_slot_color = [0.502, 0.502, 0.502, 1];
    } else {
        error('stored_slot_color: wrong number of arguments\n');
    }
	paint_base();
}

declareattribute("interp_slot_color", "getinterpslotcolor", "setinterpslotcolor", 1, {style: "rgba", label: "Interpolating slot color", category: "Appearance"});
function getinterpslotcolor() {
	return interp_slot_color;
}
function setinterpslotcolor(){
    if (arguments.length == 4) {
        interp_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        interp_slot_color = [1.0, 1.0, 1.0, 0.8];
    } else {
        error('interp_slot_color: wrong number of arguments\n');
    }
	mgraphics.redraw();
}

declareattribute("text_bg_color", "gettextbgcolor", "settextbgcolor", 1, {style: "rgba", label: "Text Background Color", category: "Appearance"});
function gettextbgcolor() {
	return text_bg_color;
}
function settextbgcolor(){
    if (arguments.length == 4) {
        text_bg_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        text_bg_color = [1,1,1, 0.5];
    } else {
        error('text_bg_color: wrong number of arguments\n');
    }
	mgraphics.redraw();
}

declareattribute("text_color", "gettextcolor", "settextcolor", 1, {style: "rgba", label: "Text Color", category: "Appearance"});
function gettextcolor() {
	return text_color;
}
function settextcolor(){
    if (arguments.length == 4) {
        text_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        text_color = [0.129, 0.129, 0.129, 1];
    } else {
        error('text_color: wrong number of arguments\n');
    }
	mgraphics.redraw();
}

declareattribute("fontsize", "getfontsize", "setfontsize", 1, {type: "float", label: "Font Size", category: "Appearance"});
function getfontsize() {
	return font_size;
}
function setfontsize(v){
    if (arguments.length) {
        font_size = Math.max(2, v);
    } else {
        font_size = 14;
    }
	if (layout == 1) {
        paint_base();
    } else {
        mgraphics.redraw();
    }
}

declareattribute("fontname", "getfontname", "setfontname", 1, {type: "symbol", label: "Font Name", category: "Appearance"});
function getfontname() {
	return font_name;
}
function setfontname(v){
    if (arguments.length) {
        var fontlist = mgraphics.getfontlist();
        if (fontlist.indexOf(v) > -1) {
            font_name = v.toString();
        } else {
            error("Font not found.\n");
        }
    } else {
        font_name = 'Arial';
    }
    if (layout == 1) {
        paint_base();
    } else {
        mgraphics.redraw();
    }
}

declareattribute("menu_mode", "getmenu_mode", "setmenu_mode", 1, {style: "enumindex", enumvals: ["Preset number + name", "Preset number", "Preset name"], label: "Menu Mode"});
function getmenu_mode() {
	return menu_mode;
}
function setmenu_mode(v){
    if (arguments.length == 1) {
        menu_mode = Math.min(Math.max(0, parseInt(v)), 2);
        update_umenu();
    }
}

declareattribute("autowriteagain", "getautowriteagain", "setautowriteagain", 1, {style: "onoff", label: "Auto writeagain"});
function getautowriteagain() {
	return auto_writeagain;
}
function setautowriteagain(v){
	if (v == 0) {
        auto_writeagain = 0;
    } else {
        auto_writeagain = 1;
    }
}

declareattribute("ignoreslotzero", "getignoreslotzero", "setignoreslotzero", 1, {style: "onoff", label: "Ignore Slot 0", category: "Appearance"});
function getignoreslotzero() {
	return ignore_slot_zero;
}
function setignoreslotzero(v){
	if (v == 0) {
        ignore_slot_zero = 0;
    } else {
        ignore_slot_zero = 1;
    }
}

declareattribute("display_interp", "getdisplayinterp", "setdisplayinterp", 1, {style: "onoff", label: "Display Interpolations", category: "Appearance"});
function getdisplayinterp() {
	return display_interp;
}
function setdisplayinterp(v){
	if (v == 0) {
        display_interp = 0;
    } else {
        display_interp = 1;
    }
}

declareattribute("layout", "getlayout", "setlayout", 1, {style: "enumindex", enumvals: ["Grid", "List"], label: "Layout", category: "Appearance"});
function getlayout() {
	return layout;
}
function setlayout(v){
	if (v == 0) {
        layout = 0;
    } else {
        layout = 1;
    }
    y_offset = 0;
    calc_rows_columns();
}

declareattribute("scrollable", "getscrollable", "setscrollable", 1, {style: "onoff", label: "Scrollable"});
function getscrollable() {
	return scrollable;
}
function setscrollable(v){
	if (v == 0) {
        scrollable = 0;
    } else {
        scrollable = 1;
    }
    y_offset = 0;
    calc_rows_columns();
}

declareattribute("min_rows", "getmin_rows", "setmin_rows", 1, {type: "long", min: 1, label: "Minimum Rows"});
function getmin_rows() {
	return min_rows;
}
function setmin_rows(v){
	if (v > 0) {
        min_rows = v;
    }
    if (scrollable) {
        calc_rows_columns();   
    }
}

declareattribute("select_mode", "getselect_mode", "setselect_mode", 1, {style: "onoff", label: "Select Mode"});
function getselect_mode() {
	return select_mode;
}
function setselect_mode(v){
	if (v == 1) {
        select_mode = 1;
    } else {
        select_mode = 0;
    }
    mgraphics.redraw();
}

declareattribute("color_mode", "getcolor_mode", "setcolor_mode", 1, {type: "long", min: 0, max: 3, style: "enumindex", enumvals: ["Same color", "Six colors cycling", "Six colors free", "Custom colors"], label: "Color Mode", category: "Appearance"});
function getcolor_mode() {
	return color_mode;
}
function setcolor_mode(v){
    v = Math.floor(v);
    v = Math.max(0, Math.min(3, v));
    // For color modes 2 and 3 (select and custom),
    // we need to ensure there's a [pattr preset_metadata] somewhere to store the preset color
    if (v >= 2 ) {
        if (metadata_pattr == undefined) {
            is_listening_to_clientlist = 2;
            color_mode_candidate = v;
            connect_to_metadata_pattr();
        } else {
            v = 0;
            color_mode = v;
            paint_base();
        }
    } else {
        color_mode = v;
        paint_base();
    }
}

declareattribute("color_1", "getcolor1", "setcolor1", 1, {style: "rgba", label: "Color 1", category: "Appearance"});
function getcolor1() {
	return color_1;
}
function setcolor1(){
    if (arguments.length == 4) {
        color_wheel(1, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(1, 0.743, 0.41, 0.501, 1);
    } else {
        error('color_1: wrong number of arguments\n');
    }
}

declareattribute("color_2", "getcolor2", "setcolor2", 1, {style: "rgba", label: "Color 2", category: "Appearance"});
function getcolor2() {
	return color_2;
}
function setcolor2(){
    if (arguments.length == 4) {
        color_wheel(2, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(0.679, 0.405, 0.669,1);
    } else {
        error('color_2: wrong number of arguments\n');
    }
}

declareattribute("color_3", "getcolor3", "setcolor3", 1, {style: "rgba", label: "Color 3", category: "Appearance"});
function getcolor3() {
	return color_3;
}
function setcolor3(){
    if (arguments.length == 4) {
        color_wheel(3, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(3, 0.527, 0.459, 0.756, 1);
    } else {
        error('color_3: wrong number of arguments\n');
    }
}

declareattribute("color_4", "getcolor4", "setcolor4", 1, {style: "rgba", label: "Color 4", category: "Appearance"});
function getcolor4() {
	return color_4;
}
function setcolor4(){
    if (arguments.length == 4) {
        color_wheel(4, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(4, 0.367, 0.542, 0.712, 1);
    } else {
        error('color_4: wrong number of arguments\n');
    }
}

declareattribute("color_5", "getcolor5", "setcolor5", 1, {style: "rgba", label: "Color 5", category: "Appearance"});
function getcolor5() {
	return color_5;
}
function setcolor5(){
    if (arguments.length == 4) {
        color_wheel(5, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(5, 0.283, 0.606, 0.559, 1);
    } else {
        error('color_5: wrong number of arguments\n');
    }
}

declareattribute("color_6", "getcolor6", "setcolor6", 1, {style: "rgba", label: "Color 6", category: "Appearance"});
function getcolor6() {
	return color_6;
}
function setcolor6(){
    if (arguments.length == 4) {
        color_wheel(6, arguments[0], arguments[1], arguments[2], arguments[3]);
    } else if (arguments.length == 0) {
        color_wheel(6, 0.316, 0.616, 0.377, 1);
    } else {
        error('color_6: wrong number of arguments\n');
    }
}

declareattribute("send_name", "getsendname", "setsendname", 1, {type: "symbol", label: "Send Dictionary To"});
function getsendname() {
	return send_name;
}
function setsendname(){
    if (arguments.length > 0) {
        send_name = arguments[0];
    } else {
       send_name = "none";
    }
}

declareattribute("unique_names", "getunique_names", "setunique_names", 1, {style: "onoff", label: "Force Unique Names"});
function getunique_names() {
	return unique_names;
}
function setunique_names(v){
    unique_names = v > 0;
}

declareattribute("use_uid", "getuse_uid", "setuse_uid", 1, {style: "onoff", label: "Use UID"});
function getuse_uid() {
	return use_uid;
}
function setuse_uid(v){
    var new_val = v == 1 ? 1 : 0;
    if (new_val != use_uid && new_val == 1) {
        use_uid = 1;
        connect_to_metadata_pattr();
        to_pattrstorage("getslotlist");
    }
    use_uid = new_val;
}

declareattribute("recall_passthrough", "getrecall_passthrough", "setrecall_passthrough", 1, {style: "onoff", label: "Recall Passthrough"});
function getrecall_passthrough() {
	return recall_passthrough;
}
function setrecall_passthrough(v){
    recall_passthrough = v > 0;
}

declareattribute("ui_rename", "getui_rename", "setui_rename", 1, {style: "onoff", label: "Rename In UI"});
function getui_rename() {
	return ui_rename;
}
function setui_rename(v){
    ui_rename = v > 0;
    if (ui_rename) {
        find_textedit();
    }
}

declareattribute("poll_edited", "getpoll_edited", "setpoll_edited", 1, {type: "float", min: 0, label: "Poll Edited State"});
function getpoll_edited() {
	return poll_edited;
}
function setpoll_edited(v){
    poll_edited = v == 0 ? 0 : Math.max(0.1, Math.abs(v));
    if (poll_edited > 0) {
        run_edited_poll_task();
    } else {
        cancel_edited_poll_task();
    }
}

function run_edited_poll_task() {
    if (poll_edited_task.valid && !poll_edited_task.running && poll_edited > 0 && active_slot > 0) {
        poll_edited_task.interval = poll_edited * 1000;
        poll_edited_task.repeat();
    }
}
run_edited_poll_task.local = 1;

function cancel_edited_poll_task() {
    poll_edited_task.cancel();
}
cancel_edited_poll_task.local = 1;

function do_poll_edited() {
    if (pattrstorage_obj != null) {
        to_pattrstorage("getedited");
    }
}
do_poll_edited.local = 1;

declareattribute("edited_color", "getedited_color", "setedited_color", 1, {style: "rgba", label: "Edited Dot Color", category: "Appearance"});
function getedited_color() {
	return edited_color;
}
function setedited_color(){
    if (arguments.length == 4) {
        edited_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
    } else if (arguments.length == 0) {
        edited_color = [1, 0.49, 0.263, 1];
    } else {
        error('edited_color: wrong number of arguments\n');
    }
}

function edited(v) {
    active_slot_edited = v;
    if (v == 1) {
        cancel_edited_poll_task();
        mgraphics.redraw();
    }
}

declareattribute("nbslot_edit", "getnbslot_edit", "setnbslot_edit", 1, {style: "onoff", label: "Add/remove rows of presets"});
function getnbslot_edit() {
	return nbslot_edit;
}
function setnbslot_edit(v){
    nbslot_edit = v > 0;
    y_offset = 0;
    calc_rows_columns();
}

// UTILITY
function post_keys(obj) {
    post('Keys of obj: ', obj, '\n');
    post(Object.keys(obj));
    post('\n');
}

// Generating (fast but not compliant but more than enough for us) UID without crypto.randomUUID()
// https://stackoverflow.com/a/21963136
var lut = new Array(256);
for (var i=0; i<256; i++) { lut[i] = (i<16?'0':'')+(i).toString(16); }
function generateUID()
{
    var d0 = Math.random()*0xffffffff>>>0;
    var d1 = Math.random()*0xffffffff>>>0;
    var d2 = Math.random()*0xffffffff>>>0;
    var d3 = Math.random()*0xffffffff>>>0;
    return lut[d0&0xff]+lut[d0>>8&0xff]+lut[d0>>16&0xff]+lut[d0>>24&0xff]+'-'+
    lut[d1&0xff]+lut[d1>>8&0xff]+'-'+lut[d1>>16&0x0f|0x40]+lut[d1>>24&0xff]+'-'+
    lut[d2&0x3f|0x80]+lut[d2>>8&0xff]+'-'+lut[d2>>16&0xff]+lut[d2>>24&0xff]+
    lut[d3&0xff]+lut[d3>>8&0xff]+lut[d3>>16&0xff]+lut[d3>>24&0xff];
}
generateUID.local = 1;