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

outlets = 4;
setoutletassist(0, "Outputs last triggered action");
setoutletassist(1, "Connect to umenu to list stored presets");
setoutletassist(2, "Connect to textedit to edit preset name");
setoutletassist(3, "Connect to toggle to show active presets lock state")

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// LOOK
var slot_size = 20;
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

// FEEL
var layout = 1;
var display_interp = 1;     // Enable/disable the UI feedback when interpolating between presets
var ignore_slot_zero = 1;   // Makes previous_active_slot and interpolation display to ignore slot 0. Can be usefull when using slot 0 as a temporary step for interpolation.
var auto_writeagain = 0;    // When enabled, will send a "writeagain" to pattrstorage any time a preset is stored/deleted/moved/renamed/(un)locked
var menu_number_only = 0;   // Populates the umenu connected to 2nd outlet with stored preset number only, instead of number and name
var scrollable = 1;         // Defines weither the object can be scrolled or not
var min_rows = 50;          // Minimum number of rows to display is scrollable is enabled

// (WORK)
var pattrstorage_name, pattrstorage_obj = null;

var columns, rows = 0;
var slots = [];                 // Stores on screen box, name, lock and interpolation state for all slots
var slots_highest = 0;          // Highest filled preset slot number
var slots_count_display = 0;    // Number of slots to be displayed
var filled_slots = [];          // List of stored slots

var active_slot = 0;            //Last recalled slot
var previous_active_slot = 0;   //Previously recalled slot
var previous_target = 0;

var ui_width = box.rect[2] - box.rect[0];
var ui_height = box.rect[3] - box.rect[1];
var bg_width, bg_height = 0;

var mg = new MGraphics(ui_width, ui_height);
var base_drawing;
var is_painting_base = 0;

var half_slot_size, half_margin, half_spacing;
var last_x, last_y, last_hovered = -1;
var y_offset = 0; // handle scrolling
var shift_hold, option_hold = 0;
var is_interpolating = 0;
var is_dragging = 0;    // Drag flag
var drag_slot = -1;     // Stores the slot that's being dragged

if (jsarguments.length>1) {
    pattrstorage_name = jsarguments[1];
}

function loadbang() {
    outlet(2, "set");
    find_pattrstorage(pattrstorage_name);    
	calc_rows_columns();
}

// loadbang();

function calc_rows_columns() {
    half_margin = margin / 2;
	half_spacing = spacing / 2;
	half_slot_size = slot_size / 2;

    slots[0] = [0, 0, 0, 0, "(tmp)", 0, -1]; // Slot 0 is valid, but not represented in the GUI (and never saved by pattrstorage)

    if (layout == 0) {
        columns = Math.floor((ui_width - margin + spacing) / (slot_size + spacing));
        rows = Math.floor((ui_height - margin + spacing) / (slot_size + spacing));
        slots_count_display = columns * rows;
    } else {
        columns = 1;
        rows = Math.floor((ui_height - margin + spacing) / (slot_size + spacing));
        if (scrollable) {
            rows = Math.max(rows, Math.max(min_rows, slots_highest));
        }
        slots_count_display = columns * rows;
    }
        
    for (var i = 0; i < rows; i++) {
        var top = margin + i * (spacing+slot_size);
        var bottom = top + slot_size;
        for (var j = 0; j < columns; j++) {
            var left = margin + j * (spacing+slot_size);
            var right = left + slot_size;
            var cur = 1 + i * columns + j;
            var prev_name = null;
            var prev_lock = 0;
            var prev_interp = -1;
            if (typeof slots[cur] !== 'undefined') {
                prev_name = slots[cur][4];
                prev_lock = slots[cur][5];
                prev_interp = slots[cur][6];
            }
            slots[cur] = [left, top, right, bottom, prev_name, prev_lock, prev_interp];
            //0: left position
            //1: top position
            //2: right position
            //3: bottom position
            //4: name, null if nothing stored on that slot
            //5: lock state
            //6: is being interpolated (0 or 1)
        }

    }
	

    if (slots_count_display < slots_highest) {
        for (var i = slots_count_display + 1; i <= slots_highest; i++) {
            slots[i] = [0, 0, 0, 0, null, 0, -1];
        }
    }
	// outlet(0, "init");
	paint_base(); 
}
calc_rows_columns.local = 1;

function draw_slot(id, scale, cont) {
    scale = typeof cont !== 'undefined' ? scale : 1;        // Sets scale to 1 by default if not passed as argument
    cont = typeof cont !== 'undefined' ? cont : mgraphics;  // Sets drawing context to mgraphics by default if not passed as argument

    var offset = slot_size * (1 - scale);


    if(is_painting_base) {
        draw_slot_bubble(slots[id][0] * scale, slots[id][1] *scale, slot_size * scale, slot_size * scale, cont);

    } else {
        draw_slot_bubble(slots[id][0] + offset, slots[id][1] + offset, slot_size * scale, slot_size * scale, cont);
    }
    cont.fill();

    if (layout == 1) {
        // slot text background
        var bg_txt_pos_x = margin + slot_size + spacing;
        var bg_txt_pos_y = slots[id][1];
        var bg_txt_dim_w = ui_width - (2*margin + slot_size + spacing);
        var bg_txt_dim_h = slot_size;

        if (slots[id][4] != null) {
            cont.set_source_rgba(stored_slot_color);
        } else {
            cont.set_source_rgba(empty_slot_color);
        }

          // slot name
        cont.set_font_size(font_size*scale);
        var text = format_slot_name(id);

        if (is_painting_base) {
            draw_text_bubble(bg_txt_pos_x * scale, bg_txt_pos_y * scale, bg_txt_dim_w * scale, bg_txt_dim_h * scale, text, cont);

        } else {
            draw_text_bubble(bg_txt_pos_x + offset, bg_txt_pos_y + offset, bg_txt_dim_w * scale, bg_txt_dim_h * scale, text, cont);
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

function format_slot_name(id) {
    var text = id;
    // If slot is locked, add brackets around its number
    if (slots[id][5] == 1) {
        text = '[' + text + ']';
    }
    // If slot has a name, append it to the preset name
    if (slots[id][4] != null) {
        text += ': ' + slots[id][4];
    }
    text = text.toString();
    return text;
}
format_slot_name.local = 1;

function paint_base() {
    // We draw all slots (empty and stored ones) so we don't have to for every redraw
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
        for (var i = 1; i <= slots_count_display; i++) {
            if (i != drag_slot) { //We mask the slot that is currently dragged as it is drawn at the mouse position already
                if (slots[i][4] != null) {
                    set_source_rgba(stored_slot_color);
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
			draw_slot_bubble(slots[active_slot][0], slots[active_slot][1], slot_size, slot_size);
			fill();
		}

        // Previous active slot
		if (is_dragging == 0 && previous_active_slot > 0 && previous_active_slot <= slots_count_display) {
			set_source_rgba(active_slot_color);
			draw_slot_bubble(slots[previous_active_slot][0], slots[previous_active_slot][1], slot_size, slot_size);
			stroke();
		}

		// Interpolated slots
        if (is_dragging == 0 && display_interp && is_interpolating) {
            
            for (var i = 1; i <= slots_count_display; i++) {
                var interp = slots[i][6];
                if (interp >= 0) {
                    set_source_rgba(interp_slot_color);
                    draw_slot_bubble(slots[i][0], slots[i][1], slot_size, slot_size);
                    stroke();
                    draw_slot_bubble(slots[i][0], slots[i][1] + slot_size * (1-interp), slot_size, slot_size * interp);
                    fill();
                }
            }
        }

		// Hovered slot
		if (last_hovered > -1) {
			if (shift_hold) {
				if (option_hold) {
					// About to delete
					set_source_rgba(empty_slot_color[0], empty_slot_color[1], empty_slot_color[2], 0.8);
					draw_slot_bubble(slots[last_hovered][0] + 1, slots[last_hovered][1] + 1, slot_size-2, slot_size-2);
					fill();
				} else {
					// About to store
					set_source_rgba(active_slot_color[0], active_slot_color[1], active_slot_color[2], 0.7);
					draw_slot_bubble(slots[last_hovered][0] + 1, slots[last_hovered][1] + 1, slot_size-2, slot_size-2);
					fill();
				}
			}
            // Slot border
			set_source_rgba(1, 1, 1, 0.8);
			draw_slot_bubble(slots[last_hovered][0], slots[last_hovered][1], slot_size, slot_size);
			stroke();

            if (layout == 0) {
                //Text (slot number and name)
                var text = format_slot_name(last_hovered);
                var text_dim = text_measure(text);
                // If the text is too big or a slot is being dragged, display the text on top of the next slot.
                // Otherwise, it gets displayed on the hovered slot.

                var bg_txt_dim_w = text_dim[0] > slot_size ? text_dim[0] + 4 : slot_size + 4;
                var bg_txt_dim_h = text_dim[1] > slot_size ? text_dim[1] + 4 : slot_size + 4;
                var bg_txt_pos_x = text_dim[0] > slot_size || is_dragging ? slots[last_hovered][0] + slot_size + 2: slots[last_hovered][0] - 2;
                var bg_txt_pos_y = text_dim[1] > slot_size || is_dragging ? slots[last_hovered][1] - 2 : slots[last_hovered][1] - 2;
                

                // If there is not enough place, text is displayed on the left
                if (bg_txt_pos_x + bg_txt_dim_w > ui_width) {
                    bg_txt_pos_x = slots[last_hovered][0] - half_spacing - bg_txt_dim_w;
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
paint.local = 1;

function anything() {
    // Here just to avoid error messages in case pattrstorage sends unhandled message, like when  using getstoredvalue, getsubscriptionlist, getalias, etc.

    // Handle the "delete" messages here because we can't declare a "function delete" (it is a reserved word in js and cannot be used as a function name.
    if (messagename == "delete") {
        var v = arrayfromargs(arguments)[0];
            v = Math.floor(v);
        if (v >= 0) {
            if (slots[v][5] > 0) {
                error('cannot delete locked slot ' + v + '\n');
            } else {
                slots[v][4] = null;
                slots[v][6] = -1;
                if (active_slot == v) {
                    active_slot = 0;
                }
                
                // to_pattrstorage("getslotname", v);
                to_pattrstorage("delete", v);
                to_pattrstorage("getslotlist");
                paint_base();
                set_active_slot(active_slot);
                if (!is_dragging) {
                    outlet(0, "delete", v);
                }
                trigger_writeagain();
            }
        }
    }
}

function bang()
{
    to_pattrstorage("recall", active_slot);
}

function msg_int(v) {
    to_pattrstorage("recall", v);
}

function msg_float(v)
{
    var s = Math.floor(v);
    var i = v % 1;
    to_pattrstorage("recall", s, s+1, i);
}

function pattrstorage(v){
    find_pattrstorage(v);
    paint_base();
}

function slotlist() {
    filled_slots = arrayfromargs(arguments);
    if (filled_slots.length) {

        // If the highest numbered preset is above the maximum number of displayed presets, we need to extend slots[]
        slots_highest = filled_slots[filled_slots.length - 1];
        if (slots_count_display < slots_highest) {
            for (var i = slots_count_display + 1; i <= slots_highest; i++) {
                slots[i] = [0, 0, 0, 0, null, 0, -1];
            }
        }
        for (var i = 0; i < filled_slots.length; i++) {
            to_pattrstorage("getslotname", filled_slots[i]);
        }
    }
    // paint_base(); 
}

function slotname() {
	var args = arrayfromargs(arguments);
    if (args[0] > 0 && args[1] != "(undefined)") {

		slots[args[0]][4] = args[1];

	}
	
}

function setslotname() {
    // Because [pattrstorage] doesn't output anything when renaming presets with "slotname", we use a custom "setslotname" instead, that will rename the active preset
    if (active_slot > 0) {
        var sname = arrayfromargs(arguments).join(' ');
        slotname(active_slot, sname);
        to_pattrstorage("slotname", active_slot, sname);
        update_umenu();
        set_active_slot(active_slot);
        trigger_writeagain();
        if (layout == 1) {
            paint_base();
        }
    }
}

function text() {
    setslotname(arrayfromargs(arguments).join(' '));
}

function recall() {
	var args = arrayfromargs(arguments);
	if (args.length == 1) {
        previous_active_slot = active_slot;
        is_interpolating = 0;
        set_active_slot(args[0]);
        outlet(0, 'recall', args[0]);
	} else {
		var src_slot = args[0];
		var trg_slot = args[1];

        for (var i = 0; i < filled_slots.length; i++) {
            slots[filled_slots[i]][6] = -1;
        }

        if (slots[src_slot][4] != null && slots[trg_slot][4] != null) {

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
            var interp = Math.min( 1, Math.max(0, args[2]));
            if (interp == 0.0) {
                slots[src_slot][6] = -1;
                slots[trg_slot][6] = -1;
                is_interpolating = 0;
                if (previous_target != active_slot) {
                    previous_active_slot = active_slot;
                } else if (args[0] != 0) {
                    previous_active_slot = args[0];
                } else {
                    previous_active_slot = previous_target;
                }
                
                set_active_slot(src_slot);
            } else if (interp == 1.0) {
                slots[src_slot][6] = -1;
                slots[trg_slot][6] = -1;
                is_interpolating = 0;
                previous_target = trg_slot;
                set_active_slot(trg_slot);
                
            } else {
                slots[src_slot][6] = 1 - interp;
                slots[trg_slot][6] = interp;
                is_interpolating = 1;
                active_slot = 0;
                // set_active_slot(0);
            }

            outlet(0, "recall", src_slot, trg_slot, interp);
        }
        
	}
	
	mgraphics.redraw();
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
        if (slots[nb][4] != null) {
            interp_slots[i][1] /= summed_weight;
        }  else {
            interp_slots[i][1] = -1;
        }
        slots[nb][6] = interp_slots[i][1]
    }

    is_interpolating = 1;
    mgraphics.redraw();

    outlet(0, "recallmulti", args);

}

function store(v) {
    v = Math.floor(v);
    if (v >= 0) {
        if (slots[v][5] > 0) {
            error('cannot overwrite locked slot ' + v + '\n');
        } else {
            var recalc_rows_flag = scrollable && v > slots_highest;

            to_pattrstorage("store", v);
            to_pattrstorage("getslotlist");

            if (recalc_rows_flag) {
                calc_rows_columns();
            } else {
                paint_base();
            }
            
            if (!(ignore_slot_zero && v == 0)) {
                set_active_slot(v);
            }
            
            outlet(0, "store", v);
            if (v != 0) {
                trigger_writeagain();
            }
        }
    }
}

function setlock(v) {
    lock(active_slot, v);
}

function lock() {
    var args = arrayfromargs(arguments);
    if (args.length == 2) {
        to_pattrstorage("lock", args[0], args[1]);
        to_pattrstorage("getlockedslots");
        outlet(0, "lock", args[0], args[1]);
        trigger_writeagain();
        if (layout == 1) {
            paint_base();
        }
    }
}

function lockedslots() {
    var locked_slots = arrayfromargs(arguments);
    for (var i = 1; i < slots.length; i++) {
        slots[i][5] = 0;
    }
    if (locked_slots.length) {
        for (var i = 0; i < locked_slots.length; i++) {
            slots[locked_slots[i]][5] = 1;
        } 
    }
}

function write() {
    var args = arrayfromargs(arguments);
    var filename = args[0];
    var state = args[1];
    if (state) {
        post(pattrstorage_name + ' pattrstorage: ' + filename + ' updated\n');
    } else {
        error(pattrstorage_name + ': error while writing ' + filename + '\n');
    }
}

function read() {
    var args = arrayfromargs(arguments);
    var state = args[1];
    if (state) {
        pattrstorage(pattrstorage_name);
    }
}

function resync() {
    calc_rows_columns();
}

function find_pattrstorage(name) {
    active_slot = 0;
    pattrstorage_obj = this.patcher.getnamed(name);
    if (pattrstorage_obj !== null) {
        pattrstorage_name = name;
        slots_clear();
        // this.patcher.hiddenconnect(pattrstorage_obj, 0, this.box, 0);
        to_pattrstorage("getslotlist");
        to_pattrstorage("getlockedslots");
    } else {
        pattrstorage_name = null;
        slots_clear();
        // error("Pattrstorage", name, "doesn't exist.\n");
    }
}
find_pattrstorage.local = 1;

function to_pattrstorage() {
    if (pattrstorage_obj !== null) {
        pattrstorage_obj.message(arrayfromargs(arguments));
    }
}

function slots_clear() {
    slots[0] = [0, 0, 0, 0, "(tmp)", 0, -1];
	for (var i = 1; i < slots.length; i++) {
		slots[i][4] = null;
        slots[i][5] = 0;
        slots[i][6] = -1;
	}
}
slots_clear.local = 1;

function get_slot_index(x, y) {
    // Returns which slot is hovered by the mouse
	for (var i = 1; i <= slots_count_display; i++) {
		if (y > (slots[i][1] - half_spacing) && y < (slots[i][3] + half_spacing) && x > (slots[i][0] - half_spacing) && x < (slots[i][2] + half_spacing)) {
			return i;
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
    if (menu_number_only) {
        outlet(1, "setsymbol", active_slot);
    } else {
        outlet(1, "setsymbol", active_slot + ' ' + slots[active_slot][4]);
    }
    if (active_slot != 0) {
        outlet(2, "set", slots[active_slot][4]);
    } else  {
        outlet(2, "set");
    }
    outlet(3, "set", slots[active_slot][5]);
}
set_active_slot.local = 1;

function update_umenu() {
    if (pattrstorage_obj !== null) {
        outlet(1, "clear");
        
        for (var i=0; i < filled_slots.length; i++) {
            var txt = filled_slots[i].toString();
            if (!menu_number_only) {
                txt += ' ' + slots[filled_slots[i]][4];
            }
            outlet(1, "append", txt);
        }
    }
}
update_umenu.local = 1;

function trigger_writeagain() {
    if (auto_writeagain && !is_dragging) {
        to_pattrstorage("writeagain");

    }
}
trigger_writeagain.local = 1;

// MOUSE EVENTS
function onidle(x,y,but,cmd,shift,capslock,option,ctrl)
{
	if (last_x != x || last_y != y - y_offset|| shift_hold != shift || option_hold != option) {
		last_x = x;
		last_y = y - y_offset;
		shift_hold = shift;
		option_hold = option;
		var cur = get_slot_index(x, y - y_offset);
		if (cur != last_hovered) {
			last_hovered = cur;
		}
        mgraphics.redraw();
	}
}
onidle.local = 1;

function onidleout()
{
	last_hovered = -1;
	mgraphics.redraw();
}
onidleout.local = 1;

function onclick(x,y,but,cmd,shift,capslock,option,ctrl)
{
	if (last_hovered > -1 && pattrstorage_name != null) {
		var output = "recall";
		if (shift) {
			output = "store";
			if (option) {
				output = "delete";
			}
		} else if (slots[last_hovered][4] == null) {
			return;
		}
        if (output == "store") {
            store(last_hovered);
        } else {
            to_pattrstorage(output, last_hovered);
        }
	}
	
	last_x = x;
	last_y = y - y_offset;
}
onclick.local = 1;


function ondrag(x,y,but,cmd,shift,capslock,option,ctrl)
{
    if (pattrstorage_name != null) {
        y -=  y_offset;
        if (is_dragging == 0 && last_hovered > 0 && slots[last_hovered][4] !== null) {
            var dist_from_start = Math.sqrt((x-last_x)*(x-last_x)+(y-last_y)*(y-last_y));
            if (dist_from_start > 10) {
                is_dragging = 1;
                drag_slot = last_hovered;
                paint_base();
            }

        } else if (is_dragging == 1) {
            last_hovered = get_slot_index(x, y);
            last_x = x;
            last_y = y;
            if (!but) {
                // Wehen to button is released, the dragging ceases
                if (last_hovered > 0 && last_hovered != drag_slot) {
                    var cur_active_slot = active_slot;
                    var offset = ((last_hovered <= drag_slot) && slots[last_hovered][4] != null) ? 1 : 0;
                    var drag_slot_lock = slots[drag_slot][5];
                    // If the slot we wan to drag is locked, we need to temporarily unlock it.
                    if (drag_slot_lock) {
                        lock(drag_slot, 0);
                    }
                    // If new slot is empty we just move the drag preset here. If it's not, we move al next slots to the right
                    if (slots[last_hovered][4] !== null) {
                        to_pattrstorage("insert", last_hovered);
                    }
                    
                    to_pattrstorage("copy", drag_slot + offset, last_hovered);
                    to_pattrstorage("delete", drag_slot + offset);
                    
                    slots_clear();
                    to_pattrstorage("getslotlist");
                    
                    to_pattrstorage("getlockedslots");
                    if (cur_active_slot == drag_slot) {
                        active_slot = last_hovered;
                    } 
                    // If the dragged slot was locked, relock it.
                    if (drag_slot_lock) {
                        lock(last_hovered, 1);
                    }
                    outlet(0, "drag", drag_slot, last_hovered, offset);
                    is_dragging = 0;
                    drag_slot = -1;
                    paint_base();
                    set_active_slot(last_hovered);
                    
                    trigger_writeagain();

                } else { // Drag released but not somewhere we can throw a slot in
                    is_dragging = 0;
                    drag_slot = -1;
                    paint_base();
                    // mgraphics.redraw();
                }
                
            } else {
                mgraphics.redraw();
            }
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

function onresize(w,h)
{
    ui_width = w;
    ui_height = h;
	calc_rows_columns();
    // loadbang();
    to_pattrstorage("getslotlist");
	paint_base();
}
onresize.local = 1;

// function ondblclick(x,y,but,cmd,shift,capslock,option,ctrl)
// {
// 	last_x = x;
// 	last_y = y;
// }
// ondblclick.local = 1;

// ATTRIBUTES DECLARATION
declareattribute("bubblesize", "getslotsize", "setslotsize", 1);
function getslotsize() {
	return slot_size;
}
function setslotsize(v){
	slot_size = Math.max(2, v);
	calc_rows_columns();
}

declareattribute("slot_round", "getslotround", "setslotround", 1);
function getslotround() {
	return slot_round;
}
function setslotround(v){
	slot_round = Math.max(0, Math.min(slot_size, v));
    slot_round_ratio = slot_round / slot_size;
	calc_rows_columns();
}

declareattribute("margin", "getmargin", "setmargin", 1);
function getmargin() {
	return margin;
}
function setmargin(v){
	margin = Math.max(0, v);
	calc_rows_columns();
}

declareattribute("spacing", "getspacing", "setspacing", 1);
function getspacing() {
	return spacing;
}
function setspacing(v){
	spacing = Math.max(1, v);
	calc_rows_columns();
}

declareattribute("bgcolor", "getbgcolor", "setbgcolor", 1);
function getbgcolor() {
	return background_color;
}
function setbgcolor(){
	background_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	paint_base();
}

declareattribute("empty_slot_color", "getemptycolor", "setemptycolor", 1);
function getemptycolor() {
	return empty_slot_color;
}
function setemptycolor(){
	empty_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	paint_base();
}

declareattribute("active_slot_color", "getactiveslotcolor", "setactiveslotcolor", 1);
function getactiveslotcolor() {
	return active_slot_color;
}
function setactiveslotcolor(){
	active_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	mgraphics.redraw();
}

declareattribute("stored_slot_color", "getstoredslotcolor", "setstoredslotcolor", 1);
function getstoredslotcolor() {
	return stored_slot_color;
}
function setstoredslotcolor(){
	stored_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	paint_base();
}

declareattribute("interp_slot_color", "getinterpslotcolor", "setinterpslotcolor", 1);
function getinterpslotcolor() {
	return interp_slot_color;
}
function setinterpslotcolor(){
	interp_slot_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	mgraphics.redraw();
}

declareattribute("text_bg_color", "gettextbgcolor", "settextbgcolor", 1);
function gettextbgcolor() {
	return text_bg_color;
}
function settextbgcolor(){
	text_bg_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	mgraphics.redraw();
}

declareattribute("text_color", "gettextcolor", "settextcolor", 1);
function gettextcolor() {
	return text_color;
}
function settextcolor(){
	text_color = [arguments[0], arguments[1], arguments[2], arguments[3]];
	mgraphics.redraw();
}

declareattribute("fontsize", "getfontsize", "setfontsize", 1);
function getfontsize() {
	return font_size;
}
function setfontsize(v){
	font_size = Math.max(2, v);
	if (layout == 1) {
        paint_base();
    } else {
        mgraphics.redraw();
    }
}

declareattribute("fontname", "getfontname", "setfontname", 1);
function getfontname() {
	return font_name;
}
function setfontname(v){
	var fontlist = mgraphics.getfontlist();
	if (fontlist.indexOf(v) > -1) {
		font_name = v.toString();
        if (layout == 1) {
            paint_base();
        } else {
            mgraphics.redraw();
        }
	} else {
		error("Font not found.\n");
	}	
}

declareattribute("autowriteagain", "getautowriteagain", "setautowriteagain", 1);
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

declareattribute("ignoreslotzero", "getignoreslotzero", "setignoreslotzero", 1);
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

declareattribute("displayinterp", "getdisplayinterp", "setdisplayinterp", 1);
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

declareattribute("layout", "getlayout", "setlayout", 1);
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

declareattribute("scrollable", "getscrollable", "setscrollable", 1);
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

declareattribute("min_rows", "getmin_rows", "setmin_rows", 1);
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
