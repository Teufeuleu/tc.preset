{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 371.0, 273.0, 483.0, 443.0 ],
        "toolbarvisible": 0,
        "lefttoolbarpinned": 2,
        "toptoolbarpinned": 2,
        "righttoolbarpinned": 2,
        "bottomtoolbarpinned": 2,
        "toolbars_unpinned_last_save": 15,
        "enablehscroll": 0,
        "enablevscroll": 0,
        "boxes": [
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-17",
                    "linecount": 5,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 9.0, 354.0, 144.0, 76.0 ],
                    "text": ";\rmax launchbrowser https://www.paypal.com/donate/?hosted_button_id=AVGJ5JLTP76K8"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 155.0, 374.0, 173.0, 47.0 ],
                    "text": "GPL 3.0\n© Théophile Clet, 2024-2026\nClick here to support",
                    "textcolor": [ 0.0, 0.0, 0.0, 0.5 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 82.0, 81.0, 319.0, 24.0 ],
                    "text": "A jsui/v8ui replacement for the preset object"
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [ "bgcolor", 0.125, 0.125, 0.125, 1.0 ],
                        [ "fontsize", 13 ],
                        [ "menu_mode", 0 ],
                        [ "autowriteagain", 0 ],
                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                        [ "empty_slot_color", 0.221327066888467, 0.221327006361825, 0.221327022178404, 1.0 ],
                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                        [ "fontname", "Arial" ],
                        [ "select_mode", 0 ],
                        [ "spacing", 4 ],
                        [ "ui_rename", 0 ],
                        [ "layout", 1 ],
                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                        [ "display_interp", 1 ],
                        [ "poll_edited", 0 ],
                        [ "scrollable", 0 ],
                        [ "use_uid", 0 ],
                        [ "stored_slot_color", 0.458595350062755, 0.458595237564901, 0.458595266962388, 1.0 ],
                        [ "color_mode", 0 ],
                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                        [ "min_rows", 10 ],
                        [ "bubblesize", 14 ],
                        [ "margin", 4 ],
                        [ "text_color", 0.85, 0.85, 0.85, 1.0 ],
                        [ "active_slot_color", 0.618934978328545, 0.744701397656435, 0.953750108255376, 1.0 ],
                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                        [ "send_name", "none" ],
                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                        [ "recall_passthrough", 1 ],
                        [ "ignoreslotzero", 1 ],
                        [ "unique_names", 0 ],
                        [ "pattrstorage", "" ],
                        [ "slot_round", 0 ],
                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                        [ "nbslot_edit", 1 ]
                    ],
                    "filename": "tc.preset",
                    "id": "obj-8",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 254.0, 153.0, 130.0, 58.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 9.0, 301.0, 51.0, 22.0 ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 9.0, 274.0, 165.0, 22.0 ],
                    "text": "loadunique tc.preset.maxhelp"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-4",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 162.0, 282.0, 159.0, 41.0 ],
                    "text": "Open helper file"
                }
            },
            {
                "box": {
                    "border": 0,
                    "embedstate": [
                        [ "bgcolor", 0.125, 0.125, 0.125, 1.0 ],
                        [ "fontsize", 13 ],
                        [ "menu_mode", 0 ],
                        [ "autowriteagain", 0 ],
                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                        [ "empty_slot_color", 0.221327066888467, 0.221327006361825, 0.221327022178404, 1.0 ],
                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                        [ "fontname", "Arial" ],
                        [ "select_mode", 0 ],
                        [ "spacing", 4 ],
                        [ "ui_rename", 0 ],
                        [ "layout", 0 ],
                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                        [ "display_interp", 1 ],
                        [ "poll_edited", 0 ],
                        [ "scrollable", 0 ],
                        [ "use_uid", 0 ],
                        [ "stored_slot_color", 0.458595350062755, 0.458595237564901, 0.458595266962388, 1.0 ],
                        [ "color_mode", 0 ],
                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                        [ "min_rows", 10 ],
                        [ "bubblesize", 14 ],
                        [ "margin", 4 ],
                        [ "text_color", 0.85, 0.85, 0.85, 1.0 ],
                        [ "active_slot_color", 0.618934978328545, 0.744701397656435, 0.953750108255376, 1.0 ],
                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                        [ "send_name", "none" ],
                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                        [ "recall_passthrough", 1 ],
                        [ "ignoreslotzero", 1 ],
                        [ "unique_names", 0 ],
                        [ "pattrstorage", "" ],
                        [ "slot_round", 0 ],
                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                        [ "nbslot_edit", 1 ]
                    ],
                    "filename": "tc.preset",
                    "id": "obj-3",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 99.0, 153.0, 130.0, 58.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 48.0,
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 137.0, 16.0, 209.0, 60.0 ],
                    "text": "tc.preset",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "fontsize": 20.0,
                    "id": "obj-15",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 155.0, 374.0, 173.0, 47.0 ],
                    "text": "Open helper file",
                    "textoncolor": [ 0.807843137254902, 0.898039215686275, 0.909803921568627, 0.0 ],
                    "textovercolor": [ 0.929411764705882, 0.929411764705882, 0.352941176470588, 0.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "hidden": 1,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "hidden": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "hidden": 1,
                    "source": [ "obj-6", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}