{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 100.0, 100.0, 899.0, 646.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 756.0, 25.7999267578125, 50.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 431.0, 262.0, 138.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "helpstarter.js",
                        "parameter_enable": 0
                    },
                    "text": "js helpstarter.js tc.preset"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-12",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 473.0, 388.0, 278.0, 33.0 ],
                                    "text": "Move an existing preset to another slot\n(same action as dragging a preset with the mouse)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 403.0, 394.0, 65.0, 22.0 ],
                                    "text": "move 4 10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-32",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 473.0, 367.0, 365.0, 20.0 ],
                                    "text": "Recall the nth (0-based) filled preset, regardless of its slot number"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 389.0, 366.0, 79.0, 22.0 ],
                                    "text": "recall_filled 4"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "obj-28",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 390.0, 335.0, 168.0, 20.0 ],
                                    "text": "tc.preset specific messages"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 447.0, 473.0, 225.0, 20.0 ],
                                    "text": "Sets the lock state of the selected preset"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 380.0, 442.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 380.0, 472.0, 63.0, 22.0 ],
                                    "text": "setlock $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-31",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 473.0, 423.0, 285.0, 33.0 ],
                                    "text": "Select a preset. Doesn't recall it, but updates the umenu, textedit and lock toggle underneath the jsui."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 418.0, 429.0, 50.0, 22.0 ],
                                    "text": "select 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 447.0, 499.0, 198.0, 20.0 ],
                                    "text": "Set the name of the selected preset"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 320.0, 498.0, 123.0, 22.0 ],
                                    "text": "setslotname myname"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 447.0, 522.0, 171.0, 33.0 ],
                                    "text": "A fail-safe message to resync the jsui to the pattrstorage"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 399.0, 527.0, 44.0, 22.0 ],
                                    "text": "resync"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 636.0, 16.0, 40.0, 22.0 ],
                                    "restore": [ -0.714285714285714, -0.714285714285714, -0.6, -0.542857142857143, -0.457142857142857, -0.342857142857143, -0.171428571428571, -0.028571428571429, 0.028571428571428, 0.142857142857143, 0.228571428571429, 0.371428571428571, 0.485714285714286, 0.571428571428571, 0.714285714285714, 0.8 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr",
                                    "varname": "u099005226"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "multislider",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 647.0, 43.0, 136.0, 78.0 ],
                                    "size": 16,
                                    "varname": "multislider"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 680.0, 17.0, 118.0, 20.0 ],
                                    "text": "Some data to store"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 464.0, 249.0, 42.0, 22.0 ],
                                    "text": "lockall"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 618.0, 249.0, 60.0, 22.0 ],
                                    "text": "renumber"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "linecount": 7,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 405.0, 146.0, 308.0, 100.0 ],
                                    "text": "Lots of pattrstorage methods modify presets but don't trigger any output from the pattrstorage object. If you need timing accuracy, send these messages to the pattrstorage first, then send a 'resync' to tc.preset. Otherwise, you can send them directly to tc.preset, which will act as a passthrough and trigger its resync method automatically."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 685.0, 249.0, 59.0, 22.0 ],
                                    "text": "remove 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 564.0, 249.0, 48.0, 22.0 ],
                                    "text": "insert 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 750.0, 249.0, 35.0, 22.0 ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-54",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 120.0, 181.0, 47.0 ],
                                    "text": "\"recallmulti\" and \"slotname\" should be sent to the pattrstorage first then to the jsui"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 199.0, 120.0, 163.0, 47.0 ],
                                    "text": "Recall and delete messages should be sent to the pattrstorage only"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 253.0, 172.0, 84.0, 22.0 ],
                                    "text": "recall 1 3 0.75"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 199.0, 172.0, 47.0, 22.0 ],
                                    "text": "recall 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 42.0, 201.0, 94.0, 22.0 ],
                                    "text": "slotname 3 third"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 10.0, 233.0, 38.0, 22.0 ],
                                    "text": "t l l"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-43",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 172.0, 123.0, 22.0 ],
                                    "text": "recallmulti 1.6 2.1 3.3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.0, 202.0, 51.0, 22.0 ],
                                    "text": "delete 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 408.0, 249.0, 50.0, 22.0 ],
                                    "text": "lock 3 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 242.5, 506.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "keymode": 1,
                                    "lines": 1,
                                    "maxclass": "textedit",
                                    "nosymquotes": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 129.0, 506.0, 102.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "items": [ 1, "up", ",", 2, "down", ",", 3, "sine", ",", 4, "random", ",", 7, "W" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 507.0, 115.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 13.0,
                                    "id": "obj-8",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 65.0, 489.0, 36.0 ],
                                    "text": "The pattrstorage object doesn't provide an output for all of its available methods.\nTo keep tc.preset in sync, some messages need to be addressed in a specific way."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 513.0, 249.0, 45.0, 22.0 ],
                                    "text": "store 3"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-4",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "tc.preset" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 188.2880096435547, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "embedstate": [
                                        [ "poll_edited", 0 ],
                                        [ "autowriteagain", 0 ],
                                        [ "send_name", "none" ],
                                        [ "slot_round", 0 ],
                                        [ "display_interp", 1 ],
                                        [ "margin", 4 ],
                                        [ "menu_mode", 0 ],
                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                        [ "fontsize", 14 ],
                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                        [ "unique_names", 0 ],
                                        [ "fontname", "Arial" ],
                                        [ "pattrstorage", "tcpreset_help" ],
                                        [ "bubblesize", 14 ],
                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                        [ "nbslot_edit", 1 ],
                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                        [ "use_uid", 0 ],
                                        [ "scrollable", 0 ],
                                        [ "min_rows", 10 ],
                                        [ "ui_rename", 0 ],
                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                        [ "layout", 0 ],
                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                        [ "spacing", 4 ],
                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                        [ "color_mode", 0 ],
                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                        [ "select_mode", 0 ],
                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                        [ "ignoreslotzero", 1 ],
                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                        [ "recall_passthrough", 1 ]
                                    ],
                                    "filename": "tc.preset.js",
                                    "id": "obj-10",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 378.0, 257.0, 112.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 29.0, 303.0, 229.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 100, 172, 596, 755 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 365, 44, 816, 172 ]
                                    },
                                    "text": "pattrstorage tcpreset_help @savemode 0",
                                    "varname": "tcpreset_help"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-10", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-10", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-44", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-50", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 311.0, 27.7999267578125, 73.0, 22.0 ],
                    "text": "p messages",
                    "varname": "messages"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-11",
                                    "linecount": 8,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 567.0, 75.0, 309.0, 114.0 ],
                                    "text": "By default, clicking a stored preset in tc.preset recalls it immediately, the recall message being sent remotely to pattrstorage.\nWhen recall_passthrough is disabled, the recall mesage is first sent out of tc.preset leftmost outlet and it's up to the user to pass it to pattrstorage, potentially with some custom logic, like for triggering interpolations (see the red patch cord)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 59.0, 107.0, 640.0, 480.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 52.5, 109.0, 68.0, 22.0 ],
                                                    "text": "route recall"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 159.16666666666669, 276.0, 45.0, 22.0 ],
                                                    "text": "store 0"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-5",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "bang", "int", "bang" ],
                                                    "patching_rect": [ 52.5, 170.0, 125.66666666666669, 22.0 ],
                                                    "text": "t b i b"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 52.5, 239.0, 29.5, 22.0 ],
                                                    "text": "i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 218.0, 170.0, 90.0, 22.0 ],
                                                    "text": "loadmess 1000"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-31",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "bang", "float" ],
                                                    "patching_rect": [ 52.5, 334.0, 29.5, 22.0 ],
                                                    "text": "t b f"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-29",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "bang" ],
                                                    "patching_rect": [ 52.5, 307.0, 41.0, 22.0 ],
                                                    "text": "line 0."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-25",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 52.5, 276.0, 52.0, 22.0 ],
                                                    "text": "0., 1. $1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-14",
                                                    "maxclass": "newobj",
                                                    "numinlets": 4,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 52.5, 383.0, 99.0, 22.0 ],
                                                    "text": "pack recall 0 0 0."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-32",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 52.5, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-33",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 52.5, 444.0, 30.0, 30.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 1 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-14", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-2", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-29", 0 ],
                                                    "source": [ "obj-25", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-31", 0 ],
                                                    "source": [ "obj-29", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-3", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 3 ],
                                                    "source": [ "obj-31", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 0 ],
                                                    "source": [ "obj-31", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-32", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-25", 0 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 2 ],
                                                    "source": [ "obj-5", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-3", 0 ],
                                                    "source": [ "obj-5", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 10.0, 506.0, 52.0, 22.0 ],
                                    "text": "p interp"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 293.0, 378.0, 40.0, 22.0 ],
                                    "restore": [ 0.873015873015873, 0.714285714285714, 0.587301587301587, 0.46031746031746, 0.301587301587302, 0.174603174603175, 0.015873015873016, -0.111111111111111, -0.238095238095238, -0.333333333333333, -0.428571428571429, -0.523809523809524, -0.587301587301587, -0.682539682539683, -0.777777777777778, -0.873015873015873 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr",
                                    "varname": "u099005226"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "multislider",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 304.0, 405.0, 136.0, 78.0 ],
                                    "size": 16,
                                    "varname": "multislider"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 337.0, 379.0, 118.0, 20.0 ],
                                    "text": "Some data to store"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "linecount": 16,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 567.0, 262.0, 303.0, 221.0 ],
                                    "text": "The value of poll_edited defines the period at which tc.preset polls pattrstorage with the `getedited' message to know if the data in the currently active preset has been edited. If so, a colored dot appears on top of the preset. This can be used as a reminder to re-save the preset after some changes. At 0., the feature is disabled.\n\nRecall a preset by double-clicking it, and draw a shape in the multislider below to see this feature in action.\n\nThis 'edited' state is very sensitive and doesn't necessarily means that the value of a parameter has changed. If a pattrized object receives the same value it is currently at, pattrstorage will report the current preset as 'edited' even though no value has changed."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "linecount": 6,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 441.0, 527.0, 261.0, 87.0 ],
                                    "text": "Make the preset menu to be populated by the preset number and/or their name.\nIn modes 0 and 2, use the leftmost outlet of umenu prepended by the recall_filled message to recall the correct preset. In mode 1, you can use the umenu's middle outlet directly."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 69.5, 592.0, 85.0, 22.0 ],
                                    "text": "recall_filled $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 293.0, 145.0, 242.0, 60.0 ],
                                    "text": "Forces preset names to be unique when by appending \"bis\" to them. Gets applied only to presets subsequently renamed through tc.preset."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "linecount": 6,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 293.0, 246.0, 240.0, 87.0 ],
                                    "text": "Use the attached textedit, if any, to edit slot names directly in the JSUI frame when clicking a slot while holding the control key. When disabled, the textedit remains untouched but gets focused when clicking a slot while holding the control key."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 248.0, 505.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-27",
                                    "keymode": 1,
                                    "lines": 1,
                                    "maxclass": "textedit",
                                    "nosymquotes": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 129.0, 505.0, 102.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "items": [ 1, "up", ",", 2, "down", ",", 3, "sine", ",", 4, "random", ",", 7, "W" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 69.5, 563.0, 115.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "embedstate": [
                                        [ "poll_edited", 1 ],
                                        [ "autowriteagain", 0 ],
                                        [ "send_name", "none" ],
                                        [ "slot_round", 0 ],
                                        [ "display_interp", 1 ],
                                        [ "margin", 4 ],
                                        [ "menu_mode", 0 ],
                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                        [ "fontsize", 14 ],
                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                        [ "unique_names", 0 ],
                                        [ "fontname", "Arial" ],
                                        [ "pattrstorage", "tcpreset_help" ],
                                        [ "bubblesize", 14 ],
                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                        [ "nbslot_edit", 1 ],
                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                        [ "use_uid", 0 ],
                                        [ "scrollable", 0 ],
                                        [ "min_rows", 10 ],
                                        [ "ui_rename", 1 ],
                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                        [ "layout", 0 ],
                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                        [ "spacing", 4 ],
                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                        [ "color_mode", 0 ],
                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                        [ "select_mode", 1 ],
                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                        [ "ignoreslotzero", 1 ],
                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                        [ "recall_passthrough", 0 ]
                                    ],
                                    "filename": "tc.preset.js",
                                    "id": "obj-10",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 378.0, 257.0, 112.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 309.0, 229.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 100, 172, 596, 755 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 365, 44, 816, 172 ]
                                    },
                                    "text": "pattrstorage tcpreset_help @savemode 0",
                                    "varname": "tcpreset_help"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-4",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "tc.preset" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 188.2880096435547, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-115",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 101.0, 247.0, 74.0 ],
                                    "text": "When select mode is enabled, a single click selects a stored preset without recalling it. A double click recalls the preset. It allows to drag it, set its name and lock state while keeping the last recalled preset active."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 293.0, 46.0, 249.0, 60.0 ],
                                    "text": "Makes displayed previous active slot and interpolation status to ignore slot 0.  Can be convenient when using slot 0 as a temporary step for interpolation. It is enabled by default."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-90",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 218.0, 241.0, 60.0 ],
                                    "text": "When enabled, sends writeagain to pattrstrage when a preset has been stored/renamed/deleted/moved/(un)locked, keeping the json file always up to date."
                                }
                            },
                            {
                                "box": {
                                    "attr": "autowriteagain",
                                    "id": "obj-40",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 194.0, 123.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "ignoreslotzero",
                                    "id": "obj-46",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 293.0, 22.0, 124.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "select_mode",
                                    "id": "obj-127",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 77.0, 123.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "unique_names",
                                    "id": "obj-6",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 293.0, 121.0, 124.0, 22.0 ],
                                    "text_width": 101.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "ui_rename",
                                    "id": "obj-8",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 293.0, 222.0, 101.0, 22.0 ],
                                    "text_width": 78.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "menu_mode",
                                    "id": "obj-15",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 197.0, 563.0, 242.0, 22.0 ],
                                    "text_width": 87.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "edited_color",
                                    "id": "obj-21",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 567.0, 237.0, 187.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "poll_edited",
                                    "id": "obj-22",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 567.0, 213.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "recall_passthrough",
                                    "id": "obj-5",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 567.0, 49.0, 145.0, 22.0 ],
                                    "text_width": 122.0
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "color": [ 0.839172840118408, 0.0, 0.0, 1.0 ],
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-10", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-10", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-127", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "midpoints": [ 79.0, 617.3515625, 3.55078125, 617.3515625, 3.55078125, 375.0, 19.5, 375.0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "color": [ 0.839172840118408, 0.0, 0.0, 1.0 ],
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 19.5, 531.0, 7.359375, 531.0, 7.359375, 303.64453125, 19.5, 303.64453125 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "midpoints": [ 138.5, 540.0, 3.4296875, 540.0, 3.4296875, 375.0, 19.5, 375.0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 393.0, 26.7999267578125, 65.0, 22.0 ],
                    "text": "p behavior",
                    "varname": "behavior"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "bgcolor": [ 0.56078431372549, 0.796078431372549, 0.474509803921569, 1.0 ],
                                    "bgmode": 2,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "embed": 1,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-23",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 59.0, 119.0, 1000.0, 755.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "fontface": 1,
                                                    "fontsize": 16.0,
                                                    "id": "obj-4",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 159.0, 13.0, 107.0, 24.0 ],
                                                    "text": "tc.preset_list"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-27",
                                                    "keymode": 1,
                                                    "lines": 1,
                                                    "maxclass": "textedit",
                                                    "nosymquotes": 1,
                                                    "numinlets": 1,
                                                    "numoutlets": 4,
                                                    "outlettype": [ "", "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 156.5, 110.0, 100.0, 23.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "items": "<empty>",
                                                    "maxclass": "umenu",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 156.5, 74.0, 112.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "border": 0,
                                                    "embedstate": [
                                                        [ "poll_edited", 0 ],
                                                        [ "autowriteagain", 0 ],
                                                        [ "send_name", "none" ],
                                                        [ "slot_round", 0 ],
                                                        [ "display_interp", 1 ],
                                                        [ "margin", 4 ],
                                                        [ "menu_mode", 0 ],
                                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                                        [ "fontsize", 14 ],
                                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                                        [ "unique_names", 0 ],
                                                        [ "fontname", "Arial" ],
                                                        [ "pattrstorage", "mypat" ],
                                                        [ "bubblesize", 14 ],
                                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                                        [ "nbslot_edit", 1 ],
                                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                                        [ "use_uid", 0 ],
                                                        [ "scrollable", 1 ],
                                                        [ "min_rows", 10 ],
                                                        [ "ui_rename", 1 ],
                                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                                        [ "layout", 1 ],
                                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                                        [ "spacing", 4 ],
                                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                                        [ "color_mode", 0 ],
                                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                                        [ "select_mode", 0 ],
                                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                                        [ "ignoreslotzero", 1 ],
                                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                                        [ "recall_passthrough", 1 ]
                                                    ],
                                                    "filename": "tc.preset.js",
                                                    "id": "obj-10",
                                                    "maxclass": "jsui",
                                                    "numinlets": 1,
                                                    "numoutlets": 5,
                                                    "outlettype": [ "", "", "", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 16.0, 74.0, 130.0, 95.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 16.0, 34.0, 109.0, 22.0 ],
                                                    "saved_object_attributes": {
                                                        "client_rect": [ 100, 172, 596, 755 ],
                                                        "parameter_enable": 0,
                                                        "parameter_mappable": 0,
                                                        "storage_rect": [ 365, 44, 816, 172 ]
                                                    },
                                                    "text": "pattrstorage mypat",
                                                    "varname": "mypat"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-27", 0 ],
                                                    "source": [ "obj-10", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-8", 0 ],
                                                    "source": [ "obj-10", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-27", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 75.0, 366.0, 287.0, 194.0 ],
                                    "varname": "bpatcher[1]",
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.486274509803922, 0.741176470588235, 0.705882352941177, 1.0 ],
                                    "bgmode": 2,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "embed": 1,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-22",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 59.0, 119.0, 584.0, 605.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "items": [ "Classic", ",", "Cycle", ",", "Select", ",", "Custom" ],
                                                    "maxclass": "umenu",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 171.0, 2.0, 100.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "embedstate": [
                                                        [ "poll_edited", 0 ],
                                                        [ "autowriteagain", 0 ],
                                                        [ "send_name", "none" ],
                                                        [ "slot_round", 0 ],
                                                        [ "display_interp", 1 ],
                                                        [ "margin", 4 ],
                                                        [ "menu_mode", 0 ],
                                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                                        [ "fontsize", 14 ],
                                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                                        [ "unique_names", 0 ],
                                                        [ "fontname", "Arial" ],
                                                        [ "pattrstorage", "mypat" ],
                                                        [ "bubblesize", 14 ],
                                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                                        [ "nbslot_edit", 1 ],
                                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                                        [ "use_uid", 0 ],
                                                        [ "scrollable", 0 ],
                                                        [ "min_rows", 10 ],
                                                        [ "ui_rename", 0 ],
                                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                                        [ "layout", 0 ],
                                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                                        [ "spacing", 4 ],
                                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                                        [ "color_mode", 0 ],
                                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                                        [ "select_mode", 0 ],
                                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                                        [ "ignoreslotzero", 1 ],
                                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                                        [ "recall_passthrough", 1 ]
                                                    ],
                                                    "filename": "tc.preset.js",
                                                    "id": "obj-2",
                                                    "maxclass": "jsui",
                                                    "numinlets": 1,
                                                    "numoutlets": 5,
                                                    "outlettype": [ "", "", "", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 20.0, 115.0, 130.0, 58.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "fontface": 1,
                                                    "fontsize": 16.0,
                                                    "id": "obj-4",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 20.0, 17.0, 123.0, 24.0 ],
                                                    "text": "tc.preset_color"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "button": 1,
                                                    "id": "obj-17",
                                                    "maxclass": "tab",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 171.0, 52.0, 139.0, 24.0 ],
                                                    "tabs": [ "1", "2", "3", "4", "5", "6" ],
                                                    "varname": "sel"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-12",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 171.0, 121.0, 98.0, 22.0 ],
                                                    "text": "prepend setcolor"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "swatch",
                                                    "numinlets": 3,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "float" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 171.0, 80.0, 128.0, 32.0 ],
                                                    "saturation": 1.0,
                                                    "varname": "cust"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-7",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "" ],
                                                    "patching_rect": [ 171.0, 151.0, 126.0, 22.0 ],
                                                    "restore": [ 0 ],
                                                    "saved_object_attributes": {
                                                        "parameter_enable": 0,
                                                        "parameter_mappable": 0
                                                    },
                                                    "text": "pattr preset_metadata",
                                                    "varname": "preset_metadata"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-16",
                                                    "keymode": 1,
                                                    "lines": 1,
                                                    "maxclass": "textedit",
                                                    "nosymquotes": 1,
                                                    "numinlets": 1,
                                                    "numoutlets": 4,
                                                    "outlettype": [ "", "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 136.5, 189.0, 100.0, 23.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-18",
                                                    "items": "<empty>",
                                                    "maxclass": "umenu",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 18.5, 189.0, 112.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-20",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 20.0, 76.0, 109.0, 22.0 ],
                                                    "saved_object_attributes": {
                                                        "client_rect": [ 100, 172, 596, 755 ],
                                                        "parameter_enable": 0,
                                                        "parameter_mappable": 0,
                                                        "storage_rect": [ 365, 44, 816, 172 ]
                                                    },
                                                    "text": "pattrstorage mypat",
                                                    "varname": "mypat"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "color_mode",
                                                    "id": "obj-5",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 171.0, 26.0, 128.0, 22.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-12", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 0 ],
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 0 ],
                                                    "source": [ "obj-2", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-18", 0 ],
                                                    "source": [ "obj-2", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-20", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 0 ],
                                                    "source": [ "obj-3", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 434.0, 28.0, 347.0, 219.0 ],
                                    "varname": "patcher",
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.870588235294118, 0.537254901960784, 0.537254901960784, 1.0 ],
                                    "bgmode": 2,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "embed": 1,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-21",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "offset": [ 0.0, 0.0 ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 59.0, 119.0, 1000.0, 755.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "fontface": 1,
                                                    "fontsize": 16.0,
                                                    "id": "obj-4",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 148.0, 13.0, 129.0, 24.0 ],
                                                    "text": "tc.preset_interp"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "number",
                                                    "minimum": 0,
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "bang" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 122.0, 177.0, 50.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-34",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patcher": {
                                                        "fileversion": 1,
                                                        "appversion": {
                                                            "major": 9,
                                                            "minor": 1,
                                                            "revision": 0,
                                                            "architecture": "x64",
                                                            "modernui": 1
                                                        },
                                                        "classnamespace": "box",
                                                        "rect": [ 439.0, 167.0, 640.0, 480.0 ],
                                                        "boxes": [
                                                            {
                                                                "box": {
                                                                    "id": "obj-9",
                                                                    "maxclass": "comment",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 266.0, 45.0, 101.0, 20.0 ],
                                                                    "text": "Interpolation time"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-6",
                                                                    "maxclass": "comment",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 84.5, 45.0, 89.0, 20.0 ],
                                                                    "text": "Preset to recall"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-1",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 2,
                                                                    "outlettype": [ "", "" ],
                                                                    "patching_rect": [ 52.5, 105.0, 68.0, 22.0 ],
                                                                    "text": "route recall"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-2",
                                                                    "index": 2,
                                                                    "maxclass": "inlet",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 234.0, 40.0, 30.0, 30.0 ]
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-8",
                                                                    "maxclass": "message",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 158.5, 249.0, 45.0, 22.0 ],
                                                                    "text": "store 0"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-5",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 3,
                                                                    "outlettype": [ "bang", "int", "bang" ],
                                                                    "patching_rect": [ 52.5, 170.0, 125.66666666666669, 22.0 ],
                                                                    "text": "t b i b"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-4",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "int" ],
                                                                    "patching_rect": [ 52.5, 239.0, 29.5, 22.0 ],
                                                                    "text": "i"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-31",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 2,
                                                                    "outlettype": [ "bang", "float" ],
                                                                    "patching_rect": [ 52.5, 334.0, 29.5, 22.0 ],
                                                                    "text": "t b f"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-29",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 3,
                                                                    "numoutlets": 2,
                                                                    "outlettype": [ "", "bang" ],
                                                                    "patching_rect": [ 52.5, 307.0, 41.0, 22.0 ],
                                                                    "text": "line 0."
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-25",
                                                                    "maxclass": "message",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 52.5, 276.0, 52.0, 22.0 ],
                                                                    "text": "0., 1. $1"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-14",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 4,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 52.5, 362.0, 99.0, 22.0 ],
                                                                    "text": "pack recall 0 0 0."
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-32",
                                                                    "index": 1,
                                                                    "maxclass": "inlet",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 52.5, 40.0, 30.0, 30.0 ]
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-33",
                                                                    "index": 1,
                                                                    "maxclass": "outlet",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 52.5, 444.0, 30.0, 30.0 ]
                                                                }
                                                            }
                                                        ],
                                                        "lines": [
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-5", 0 ],
                                                                    "source": [ "obj-1", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-33", 0 ],
                                                                    "source": [ "obj-14", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-4", 1 ],
                                                                    "source": [ "obj-2", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-29", 0 ],
                                                                    "source": [ "obj-25", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-31", 0 ],
                                                                    "source": [ "obj-29", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-14", 3 ],
                                                                    "source": [ "obj-31", 1 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-14", 0 ],
                                                                    "source": [ "obj-31", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-1", 0 ],
                                                                    "source": [ "obj-32", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-25", 0 ],
                                                                    "source": [ "obj-4", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-14", 2 ],
                                                                    "source": [ "obj-5", 1 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-4", 0 ],
                                                                    "source": [ "obj-5", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-8", 0 ],
                                                                    "source": [ "obj-5", 2 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-33", 0 ],
                                                                    "source": [ "obj-8", 0 ]
                                                                }
                                                            }
                                                        ]
                                                    },
                                                    "patching_rect": [ 16.0, 206.0, 125.0, 22.0 ],
                                                    "text": "p trigger_interpolation"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-27",
                                                    "keymode": 1,
                                                    "lines": 1,
                                                    "maxclass": "textedit",
                                                    "nosymquotes": 1,
                                                    "numinlets": 1,
                                                    "numoutlets": 4,
                                                    "outlettype": [ "", "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 161.0, 143.0, 100.0, 23.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "items": "<empty>",
                                                    "maxclass": "umenu",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "int", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 43.0, 143.0, 112.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "border": 0,
                                                    "embedstate": [
                                                        [ "poll_edited", 0 ],
                                                        [ "autowriteagain", 0 ],
                                                        [ "send_name", "none" ],
                                                        [ "slot_round", 0 ],
                                                        [ "display_interp", 1 ],
                                                        [ "margin", 4 ],
                                                        [ "menu_mode", 0 ],
                                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                                        [ "fontsize", 14 ],
                                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                                        [ "unique_names", 0 ],
                                                        [ "fontname", "Arial" ],
                                                        [ "pattrstorage", "mypat" ],
                                                        [ "bubblesize", 14 ],
                                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                                        [ "nbslot_edit", 1 ],
                                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                                        [ "use_uid", 0 ],
                                                        [ "scrollable", 0 ],
                                                        [ "min_rows", 10 ],
                                                        [ "ui_rename", 1 ],
                                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                                        [ "layout", 0 ],
                                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                                        [ "spacing", 4 ],
                                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                                        [ "color_mode", 0 ],
                                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                                        [ "select_mode", 0 ],
                                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                                        [ "ignoreslotzero", 1 ],
                                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                                        [ "recall_passthrough", 0 ]
                                                    ],
                                                    "filename": "tc.preset.js",
                                                    "id": "obj-10",
                                                    "maxclass": "jsui",
                                                    "numinlets": 1,
                                                    "numoutlets": 5,
                                                    "outlettype": [ "", "", "", "", "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 16.0, 74.0, 130.0, 59.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 16.0, 41.0, 109.0, 22.0 ],
                                                    "saved_object_attributes": {
                                                        "client_rect": [ 100, 172, 596, 755 ],
                                                        "parameter_enable": 0,
                                                        "parameter_mappable": 0,
                                                        "storage_rect": [ 365, 44, 816, 172 ]
                                                    },
                                                    "text": "pattrstorage mypat",
                                                    "varname": "mypat"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-27", 0 ],
                                                    "source": [ "obj-10", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-34", 0 ],
                                                    "source": [ "obj-10", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-8", 0 ],
                                                    "source": [ "obj-10", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-27", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "source": [ "obj-34", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-34", 1 ],
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 75.0, 18.0, 287.0, 239.0 ],
                                    "varname": "bpatcher",
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "fontsize": 14.0,
                                    "id": "obj-5",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 0.0, 270.0, 426.0, 73.0 ],
                                    "text": "Get these snippets from any patch through the Snippets menu!\n\nAfter renaming the pattrstorage, remind to also update the 'pattrstorage' attribute of tc.preset."
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 687.0, 25.7999267578125, 63.0, 22.0 ],
                    "text": "p snippets",
                    "varname": "snippet"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 146.0, 160.0, 89.0, 22.0 ],
                                    "text": "loadmess set 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "tab",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 56.0, 130.0, 150.0, 26.0 ],
                                    "tabs": [ "Grid", "List" ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 293.0, 378.0, 40.0, 22.0 ],
                                    "restore": [ -0.079365079365079, 0.206349206349206, 0.428571428571429, 0.682539682539683, 0.904761904761905, 0.904761904761905, 0.841269841269841, 0.555555555555556, 0.047619047619048, -0.301587301587302, -0.587301587301587, -0.682539682539683, -0.650793650793651, -0.428571428571429, -0.111111111111111, 0.079365079365079 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr",
                                    "varname": "u099005226"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "multislider",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 304.0, 405.0, 136.0, 78.0 ],
                                    "size": 16,
                                    "varname": "multislider"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 337.0, 379.0, 118.0, 20.0 ],
                                    "text": "Some data to store"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 409.0, 120.0, 241.0, 74.0 ],
                                    "text": "When scrollable is enabled, adds a - and + buttons at the end of the presets list which, when clicked, respectively remove or add a row of empty slot(s). The minimum number of rows is capped by min_rows."
                                }
                            },
                            {
                                "box": {
                                    "attr": "nbslot_edit",
                                    "id": "obj-16",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 304.0, 146.0, 103.0, 22.0 ],
                                    "text_width": 78.0
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 0,
                                    "id": "obj-6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.5, 484.0, 236.0, 39.0 ],
                                    "text": "Scroll the list with your mouse or trackpad!"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "embedstate": [
                                        [ "poll_edited", 0 ],
                                        [ "autowriteagain", 0 ],
                                        [ "send_name", "none" ],
                                        [ "slot_round", 0 ],
                                        [ "display_interp", 1 ],
                                        [ "margin", 4 ],
                                        [ "menu_mode", 0 ],
                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                        [ "fontsize", 14 ],
                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                        [ "unique_names", 0 ],
                                        [ "fontname", "Arial" ],
                                        [ "pattrstorage", "tcpreset_help" ],
                                        [ "bubblesize", 14 ],
                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                        [ "nbslot_edit", 1 ],
                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                        [ "use_uid", 0 ],
                                        [ "scrollable", 1 ],
                                        [ "min_rows", 10 ],
                                        [ "ui_rename", 0 ],
                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                        [ "layout", 1 ],
                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                        [ "spacing", 4 ],
                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                        [ "color_mode", 0 ],
                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                        [ "select_mode", 0 ],
                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                        [ "ignoreslotzero", 1 ],
                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                        [ "recall_passthrough", 1 ]
                                    ],
                                    "filename": "tc.preset.js",
                                    "id": "obj-10",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 378.0, 257.0, 112.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 309.0, 229.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 100, 172, 596, 755 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 365, 44, 816, 172 ]
                                    },
                                    "text": "pattrstorage tcpreset_help @savemode 0",
                                    "varname": "tcpreset_help"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-4",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "tc.preset" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 188.2880096435547, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 3,
                                    "id": "obj-78",
                                    "linecount": 6,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 668.0, 103.0, 231.0, 91.0 ],
                                    "text": "...and: bgcolor, empty_slot_color, stored_slot_color, interp_slot_color, active_slot_color, fontname, fontsize, text_bg_color, text_color\n(see the tc.preset attributes in the inspector or in its Reference page)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 463.0, 214.0, 196.0, 33.0 ],
                                    "text": "Minimum number of rows to display when scrollable is enabled."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-62",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 278.0, 55.0, 211.0, 20.0 ],
                                    "text": "Enable to scroll through your presets! "
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 56.0, 93.0, 150.0, 33.0 ],
                                    "text": "Choose to display presets as a grid (0) or a list (1)!"
                                }
                            },
                            {
                                "box": {
                                    "attr": "layout",
                                    "id": "obj-129",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 56.0, 160.0, 78.0, 22.0 ],
                                    "text_width": 53.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "scrollable",
                                    "id": "obj-130",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 278.0, 80.0, 95.0, 22.0 ],
                                    "text_width": 73.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "min_rows",
                                    "id": "obj-131",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 345.0, 220.0, 116.0, 22.0 ],
                                    "text_width": 72.0
                                }
                            },
                            {
                                "box": {
                                    "attr": "bubblesize",
                                    "id": "obj-7",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 404.0, 287.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "spacing",
                                    "id": "obj-8",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 557.0, 287.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "margin",
                                    "id": "obj-11",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 557.0, 311.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "slot_round",
                                    "id": "obj-14",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 404.0, 311.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-129", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-130", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-131", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 468.0, 26.7999267578125, 82.0, 22.0 ],
                    "text": "p appearance",
                    "varname": "appearance"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 0.0, 26.0, 899.0, 620.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 227.5, 131.0, 89.0, 22.0 ],
                                    "text": "loadmess set 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "items": [ "Classic", ",", "Cycle", ",", "Select", ",", "Custom" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 109.5, 131.0, 100.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 614.0, 312.0, 156.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "legacy": 0
                                    },
                                    "text": "dict.unpack by_uid: by_slot:"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-27",
                                    "keymode": 1,
                                    "lines": 1,
                                    "maxclass": "textedit",
                                    "nosymquotes": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 128.5, 499.0, 102.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 2,
                                    "id": "obj-40",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 591.5, 146.0, 249.0, 93.0 ],
                                    "text": "When enabled, each stored preset gets a unique identifier, following the preset when it gets renamed, moved and overwritten. This can be useful when doing some complex preset management."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 636.0, 16.0, 40.0, 22.0 ],
                                    "restore": [ -0.23, -0.57, 0.26, 0.02, 0.72, -0.18, -0.46, 0.4, 0.16, -0.92, 0.77, 0.95, -0.37, 0.25, -0.07, -0.38 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr",
                                    "varname": "u099005226"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "multislider",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 647.0, 43.0, 136.0, 78.0 ],
                                    "size": 16,
                                    "varname": "multislider"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 680.0, 17.0, 118.0, 20.0 ],
                                    "text": "Some data to store"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 614.0, 280.0, 119.0, 22.0 ],
                                    "text": "r colors_presets_dict"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 614.0, 345.0, 253.0, 267.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-36",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 703.0, 163.0, 460.0, 440.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-21",
                                                    "linecount": 3,
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 188.0, 419.0, 206.0, 47.0 ],
                                                    "text": "If you move presets around, or write presets to disk and read them back later, colors will still be here."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-19",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 141.0, 370.0, 98.0, 22.0 ],
                                                    "text": "prepend setcolor"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-18",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "int", "bang" ],
                                                    "patching_rect": [ 141.0, 270.0, 29.5, 22.0 ],
                                                    "text": "t i b"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-17",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "" ],
                                                    "patcher": {
                                                        "fileversion": 1,
                                                        "appversion": {
                                                            "major": 9,
                                                            "minor": 1,
                                                            "revision": 0,
                                                            "architecture": "x64",
                                                            "modernui": 1
                                                        },
                                                        "classnamespace": "box",
                                                        "rect": [ 59.0, 119.0, 640.0, 480.0 ],
                                                        "boxes": [
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-2",
                                                                    "index": 1,
                                                                    "maxclass": "inlet",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "bang" ],
                                                                    "patching_rect": [ 50.0, 43.0, 30.0, 30.0 ]
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-25",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 120.0, 168.0, 131.0, 22.0 ],
                                                                    "text": "random @floatoutput 1"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-24",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 85.0, 134.0, 131.0, 22.0 ],
                                                                    "text": "random @floatoutput 1"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-1",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 50.0, 100.0, 131.0, 22.0 ],
                                                                    "text": "random @floatoutput 1"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-13",
                                                                    "index": 1,
                                                                    "maxclass": "outlet",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 50.0, 230.0, 30.0, 30.0 ]
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-15",
                                                                    "index": 2,
                                                                    "maxclass": "outlet",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 85.0, 230.0, 30.0, 30.0 ]
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "comment": "",
                                                                    "id": "obj-16",
                                                                    "index": 3,
                                                                    "maxclass": "outlet",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 120.0, 230.0, 30.0, 30.0 ]
                                                                }
                                                            }
                                                        ],
                                                        "lines": [
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-13", 0 ],
                                                                    "source": [ "obj-1", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-1", 0 ],
                                                                    "order": 2,
                                                                    "source": [ "obj-2", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-24", 0 ],
                                                                    "order": 1,
                                                                    "source": [ "obj-2", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-25", 0 ],
                                                                    "order": 0,
                                                                    "source": [ "obj-2", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-15", 0 ],
                                                                    "source": [ "obj-24", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-16", 0 ],
                                                                    "source": [ "obj-25", 0 ]
                                                                }
                                                            }
                                                        ]
                                                    },
                                                    "patching_rect": [ 156.0, 303.0, 92.0, 22.0 ],
                                                    "text": "p random_color"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-9",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "bang", "bang", "int" ],
                                                    "patching_rect": [ 119.0, 244.0, 41.0, 22.0 ],
                                                    "text": "uzi 20"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-14",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 161.0, 169.0, 175.0, 20.0 ],
                                                    "text": "Set selected preset color to red"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-23",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 121.0, 129.0, 123.0, 20.0 ],
                                                    "text": "Change preset colors"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-11",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 52.0, 167.0, 104.0, 22.0 ],
                                                    "text": "setcolor 1. 0. 0. 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 5,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 141.0, 338.0, 97.0, 22.0 ],
                                                    "text": "pack 0 0. 0. 0. 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "maxclass": "button",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 119.0, 207.0, 24.0, 24.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 149.0, 209.0, 265.0, 20.0 ],
                                                    "text": "Set a random color for the first 20 presets"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 142.0, 70.0, 163.0, 20.0 ],
                                                    "text": "Set color mode to 3 (custom)"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 26.0, 69.0, 81.0, 22.0 ],
                                                    "text": "color_mode 3"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-10",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 26.0, 439.0, 81.0, 22.0 ],
                                                    "text": "s to_tc.preset"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-20",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 115.0, 70.0, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "1",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-22",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 161.0, 432.5, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "3",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-12",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 94.0, 129.0, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "2",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-11", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 3 ],
                                                    "source": [ "obj-17", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 2 ],
                                                    "source": [ "obj-17", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 1 ],
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 0 ],
                                                    "source": [ "obj-18", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-18", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-19", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-3", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-19", 0 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 0 ],
                                                    "source": [ "obj-8", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-18", 0 ],
                                                    "source": [ "obj-9", 2 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 227.5, 191.0, 94.0, 22.0 ],
                                    "text": "p custom_mode"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 148.0, 340.0, 79.0, 22.0 ],
                                    "text": "r to_tc.preset"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 703.0, 163.0, 481.0, 436.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "linecount": 3,
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 219.0, 365.0, 216.0, 47.0 ],
                                                    "text": "If you move presets around, or write them to disk and read them back later, the set colors index will still be here."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-23",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 180.5, 150.0, 123.0, 20.0 ],
                                                    "text": "Change preset colors"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-18",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 199.5, 273.0, 29.5, 22.0 ],
                                                    "text": "+ 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-19",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 199.5, 244.0, 59.0, 22.0 ],
                                                    "text": "random 6"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-21",
                                                    "maxclass": "button",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 199.5, 213.0, 24.0, 24.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-22",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 229.5, 215.0, 174.0, 20.0 ],
                                                    "text": "Set a random color for preset 4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-17",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 199.5, 304.0, 77.0, 22.0 ],
                                                    "text": "setcolor 4 $1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-14",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 76.5, 242.0, 29.5, 22.0 ],
                                                    "text": "+ 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-13",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 76.5, 213.0, 59.0, 22.0 ],
                                                    "text": "random 6"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "maxclass": "button",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 76.5, 182.0, 24.0, 24.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 106.5, 184.0, 235.0, 20.0 ],
                                                    "text": "Set a random color for the selected preset"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 164.0, 94.0, 155.0, 20.0 ],
                                                    "text": "Set color mode to 2 (select)"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 48.0, 93.0, 81.0, 22.0 ],
                                                    "text": "color_mode 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-10",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 48.0, 407.0, 81.0, 22.0 ],
                                                    "text": "s to_tc.preset"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-9",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 76.5, 271.0, 67.0, 22.0 ],
                                                    "text": "setcolor $1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-20",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 137.0, 94.0, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "1",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-4",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 192.0, 379.0, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "3",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "background": 1,
                                                    "bgcolor": [ 1.0, 0.788235, 0.470588, 1.0 ],
                                                    "fontface": 1,
                                                    "hint": "",
                                                    "id": "obj-24",
                                                    "ignoreclick": 1,
                                                    "legacytextcolor": 1,
                                                    "maxclass": "textbutton",
                                                    "numinlets": 1,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "", "", "int" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 153.5, 150.0, 20.0, 20.0 ],
                                                    "rounded": 60.0,
                                                    "text": "2",
                                                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-14", 0 ],
                                                    "source": [ "obj-13", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 0 ],
                                                    "source": [ "obj-14", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 0 ],
                                                    "source": [ "obj-18", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-18", 0 ],
                                                    "source": [ "obj-19", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-19", 0 ],
                                                    "source": [ "obj-21", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-3", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-13", 0 ],
                                                    "source": [ "obj-8", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-9", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 128.5, 191.0, 87.0, 22.0 ],
                                    "text": "p select_mode"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "id": "obj-32",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 328.5, 184.0, 160.0, 37.0 ],
                                    "text": "Open these subpatchers to get more info"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 0,
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 724.0, 259.0, 378.0, 380.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-10",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 44.0, 343.0, 81.0, 22.0 ],
                                                    "text": "s to_tc.preset"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 179.0, 167.0, 129.0, 20.0 ],
                                                    "text": "Set color 5 to cyan"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "linecount": 7,
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 44.0, 14.0, 321.0, 100.0 ],
                                                    "text": "The color wheel is a set of six colors used in color_mode 1 (cycle) and 2 (select).\n\nYou can change each of the 6 colors from the color wheel either by using color_1 to color_6 messages, either by using a generic color_wheel message, or directly in the inspector when selecting the tc.preset object."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-126",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 179.0, 215.0, 164.0, 20.0 ],
                                                    "text": "Reset color 3 to default value"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-122",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 179.0, 139.0, 129.0, 20.0 ],
                                                    "text": "Set color 3 to magenta"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-120",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 44.0, 166.0, 123.0, 22.0 ],
                                                    "text": "color_wheel 5 0 1 1 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-119",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 179.0, 241.0, 150.0, 20.0 ],
                                                    "text": "Reset all colors to default"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-117",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 119.0, 214.0, 48.0, 22.0 ],
                                                    "text": "color_3"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-99",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 79.0, 138.0, 88.0, 22.0 ],
                                                    "text": "color_3 1 0 1 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-95",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 94.0, 240.0, 73.0, 22.0 ],
                                                    "text": "color_wheel"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-117", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-120", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-95", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-99", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 34.5, 191.0, 83.0, 22.0 ],
                                    "text": "p color_wheel"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubble_bgcolor": [ 0.815686274509804, 0.650980392156863, 0.650980392156863, 1.0 ],
                                    "bubbleside": 2,
                                    "id": "obj-28",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 182.0, 231.5, 393.0, 79.0 ],
                                    "text": "For color modes 2 and 3, and use_uid to work, you need to add a pattr object named 'preset_metadata' to your patch. If using subscribe mode, make sure to add preset_metadata to the pattrstorage's subscribe list.\nPreset color data will be stored just like your other parameters."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 319.0, 312.5, 126.0, 22.0 ],
                                    "restore": [ "{\"color\":[0,0.502,0.502,0.502,1],\"uid\":\"44918fd8-bfef-42ee-87ed-13929dc21d32\"}" ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr preset_metadata",
                                    "varname": "preset_metadata"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 0,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "box",
                                        "rect": [ 574.0, 280.0, 640.0, 480.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-10",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "bang" ],
                                                    "patching_rect": [ 61.0, 231.0, 29.5, 22.0 ],
                                                    "text": "t l b"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-9",
                                                    "index": 2,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 322.0, 270.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 322.0, 179.0, 39.0, 22.0 ],
                                                    "text": "/ 100."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-5",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "int" ],
                                                    "patching_rect": [ 322.0, 149.0, 36.0, 22.0 ],
                                                    "text": "- 100"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 322.0, 120.0, 73.0, 22.0 ],
                                                    "text": "random 200"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-3",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "bang", "bang", "int" ],
                                                    "patching_rect": [ 322.0, 77.0, 41.0, 22.0 ],
                                                    "text": "uzi 16"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 322.0, 210.0, 68.0, 22.0 ],
                                                    "text": "zl.group 16"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 50.0, 98.0, 54.0, 22.0 ],
                                                    "text": "deferlow"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-12",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 72.0, 159.0, 83.0, 22.0 ],
                                                    "text": "prepend store"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-11",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 3,
                                                    "outlettype": [ "bang", "bang", "int" ],
                                                    "patching_rect": [ 50.0, 131.0, 41.0, 22.0 ],
                                                    "text": "uzi 26"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-7",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "patching_rect": [ 50.0, 65.0, 58.0, 22.0 ],
                                                    "text": "loadbang"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 61.0, 188.0, 202.0, 22.0 ],
                                                    "text": "store 34, store 44, store 56, store 65"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-13",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 61.0, 270.0, 30.0, 30.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-11", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-13", 0 ],
                                                    "source": [ "obj-10", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-3", 0 ],
                                                    "source": [ "obj-10", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-12", 0 ],
                                                    "source": [ "obj-11", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-11", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-12", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-9", 0 ],
                                                    "source": [ "obj-2", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-3", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-8", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "source": [ "obj-7", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "source": [ "obj-8", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 232.0, 340.0, 34.0, 22.0 ],
                                    "text": "p init"
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "embedstate": [
                                        [ "poll_edited", 0 ],
                                        [ "autowriteagain", 0 ],
                                        [ "send_name", "none" ],
                                        [ "slot_round", 0 ],
                                        [ "display_interp", 1 ],
                                        [ "margin", 4 ],
                                        [ "menu_mode", 0 ],
                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                        [ "fontsize", 14 ],
                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                        [ "unique_names", 0 ],
                                        [ "fontname", "Arial" ],
                                        [ "pattrstorage", "colors" ],
                                        [ "bubblesize", 14 ],
                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                        [ "nbslot_edit", 1 ],
                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                        [ "use_uid", 1 ],
                                        [ "scrollable", 0 ],
                                        [ "min_rows", 10 ],
                                        [ "ui_rename", 0 ],
                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                        [ "layout", 0 ],
                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                        [ "spacing", 4 ],
                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                        [ "color_mode", 1 ],
                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                        [ "select_mode", 0 ],
                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                        [ "ignoreslotzero", 1 ],
                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                        [ "recall_passthrough", 1 ]
                                    ],
                                    "filename": "tc.preset.js",
                                    "id": "obj-10",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 378.0, 256.0, 112.0 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpname.js",
                                    "id": "obj-4",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "tc.preset" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 188.2880096435547, 57.599853515625 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 13.0,
                                    "id": "obj-113",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 64.0, 470.0, 65.0 ],
                                    "text": "When color_mode is set to 1 (Cycle), stored presets are shown in colors from color_1 to color_6, cyclically depending on their slot number.\nIn mode 2 (Select), you can freely choose one of the 6 colors for each preset.\nIn mode 3 (Custom), you are free to set any color in rgba format for any preset."
                                }
                            },
                            {
                                "box": {
                                    "alias": {
                                        "preset_metadata": "preset_metadata"
                                    },
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 10.0, 309.0, 189.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 100, 172, 596, 755 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 365, 44, 816, 172 ]
                                    },
                                    "text": "pattrstorage colors @savemode 0",
                                    "varname": "colors"
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_mode",
                                    "id": "obj-11",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 109.5, 161.0, 125.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_1",
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 378.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_2",
                                    "id": "obj-16",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 404.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_3",
                                    "id": "obj-17",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 428.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_4",
                                    "id": "obj-18",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 452.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_5",
                                    "id": "obj-19",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 476.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "color_6",
                                    "id": "obj-20",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 288.0, 500.0, 226.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "use_uid",
                                    "id": "obj-23",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 671.5, 244.0, 87.0, 22.0 ],
                                    "text_width": 64.0
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-10", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "midpoints": [ 138.0, 525.0, 6.0, 525.0, 6.0, 375.0, 19.5, 375.0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-5", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 567.0, 26.7999267578125, 112.0, 22.0 ],
                    "text": "p \"slot colors & uid\"",
                    "varname": "slot colors"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 100.0, 126.0, 899.0, 620.0 ],
                        "default_fontsize": 13.0,
                        "gridsize": [ 5.0, 5.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 219.0, 27.0, 89.0, 21.0 ],
                                    "text": "Max 8 version"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 596.0, 159.0, 40.0, 23.0 ],
                                    "restore": [ -0.079365079365079, 0.206349206349206, 0.428571428571429, 0.682539682539683, 0.904761904761905, 0.904761904761905, 0.841269841269841, 0.555555555555556, 0.047619047619048, -0.301587301587302, -0.587301587301587, -0.682539682539683, -0.650793650793651, -0.428571428571429, -0.111111111111111, 0.079365079365079 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0
                                    },
                                    "text": "pattr",
                                    "varname": "u099005226"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "multislider",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 607.0, 186.0, 136.0, 78.0 ],
                                    "size": 16,
                                    "varname": "multislider"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "id": "obj-15",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 680.0, 529.0, 212.0, 40.0 ],
                                    "text": "Rightmost outlet provides a dictionary with all stored presets"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "dict.view",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 490.0, 492.0, 188.0, 114.0 ]
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "id": "obj-12",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 394.0, 426.0, 103.0, 54.0 ],
                                    "text": "Lock state of the current preset"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 0,
                                    "id": "obj-6",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 228.5, 473.0, 150.0, 55.0 ],
                                    "text": "Edit the selected preset name and hit enter!"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubblepoint": 0.8,
                                    "bubbleside": 0,
                                    "id": "obj-5",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 18.0, 478.0, 183.0, 84.0 ],
                                    "text": "The umen is automatically updated with the list of stored presets. It also displays the currently selected preset."
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "id": "obj-24",
                                    "linecount": 10,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 511.0, 305.0, 368.0, 156.0 ],
                                    "text": "tc.preset handles the same user interactions as the regular preset object, plus a few useful ones:\n\n- RECALL (or SELECT if select_mode enabled): click\n- STORE: shift+click\n- DELETE: shift-(option|alt)-click\n- LOCK/UNLOCK: shift+control+click\n- RENAME: control+click (requires a [textedit] connected to third outlet)\n- MOVE: click and drag presets to reorganize them"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 640.0, 160.0, 118.0, 21.0 ],
                                    "text": "Some data to store"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 372.0, 440.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "keymode": 1,
                                    "lines": 1,
                                    "maxclass": "textedit",
                                    "nosymquotes": 1,
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 254.0, 441.0, 98.0, 23.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "items": [ 1, "up", ",", 2, "down", ",", 3, "sine", ",", 4, "random", ",", 7, "W" ],
                                    "maxclass": "umenu",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 136.0, 441.0, 112.0, 23.0 ]
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "embedstate": [
                                        [ "poll_edited", 0 ],
                                        [ "autowriteagain", 0 ],
                                        [ "send_name", "none" ],
                                        [ "slot_round", 0 ],
                                        [ "display_interp", 1 ],
                                        [ "margin", 4 ],
                                        [ "menu_mode", 0 ],
                                        [ "edited_color", 1, 0.49, 0.263, 1 ],
                                        [ "text_color", 0.129, 0.129, 0.129, 1 ],
                                        [ "fontsize", 14 ],
                                        [ "color_3", 0.527, 0.459, 0.756, 1 ],
                                        [ "unique_names", 0 ],
                                        [ "fontname", "Arial" ],
                                        [ "pattrstorage", "tcpreset_help" ],
                                        [ "bubblesize", 14 ],
                                        [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ],
                                        [ "nbslot_edit", 1 ],
                                        [ "color_4", 0.367, 0.542, 0.712, 1 ],
                                        [ "use_uid", 0 ],
                                        [ "scrollable", 0 ],
                                        [ "min_rows", 10 ],
                                        [ "ui_rename", 0 ],
                                        [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ],
                                        [ "layout", 0 ],
                                        [ "color_5", 0.283, 0.606, 0.559, 1 ],
                                        [ "spacing", 4 ],
                                        [ "bgcolor", 0.2, 0.2, 0.2, 1 ],
                                        [ "active_slot_color", 0.808, 0.898, 0.91, 1 ],
                                        [ "color_1", 0.743, 0.41, 0.501, 1 ],
                                        [ "color_mode", 0 ],
                                        [ "interp_slot_color", 1, 1, 1, 0.8 ],
                                        [ "text_bg_color", 1, 1, 1, 0.5 ],
                                        [ "select_mode", 0 ],
                                        [ "color_6", 0.316, 0.616, 0.377, 1 ],
                                        [ "ignoreslotzero", 1 ],
                                        [ "color_2", 0.679, 0.405, 0.669, 1 ],
                                        [ "recall_passthrough", 1 ]
                                    ],
                                    "filename": "tc.preset.js",
                                    "id": "obj-10",
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "outlettype": [ "", "", "", "", "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 18.0, 328.0, 491.0, 95.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 18.0, 286.0, 247.0, 23.0 ],
                                    "saved_object_attributes": {
                                        "client_rect": [ 100, 172, 596, 755 ],
                                        "parameter_enable": 0,
                                        "parameter_mappable": 0,
                                        "storage_rect": [ 365, 44, 816, 172 ]
                                    },
                                    "text": "pattrstorage tcpreset_help @savemode 0",
                                    "varname": "tcpreset_help"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 14.0,
                                    "id": "obj-13",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 10.0, 136.0, 427.0, 85.0 ],
                                    "text": "Get tc.preset working in 3 steps:\n1. Create a [tc.preset] (shortcut for [jsui @filename tc.preset.js])\n2. Connect its inlet to your [pattrstorage] outlet like shown below\n3. Send to tc.preset the name of your pattrstorage prepended by \"pattrstorage\", or set its name in the @pattrstorage attribute "
                                }
                            },
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "obj-2",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "tc.preset" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 621.0, 124.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-10", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-10", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-10", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "midpoints": [ 263.5, 473.2890625, 9.0, 473.2890625, 9.0, 324.0, 27.5, 324.0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 240.0, 27.7999267578125, 50.0, 22.0 ],
                    "saved_object_attributes": {
                        "fontsize": 13.0
                    },
                    "text": "p basic",
                    "varname": "basic_tab"
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-18",
                    "ignoreclick": 1,
                    "jsarguments": [ "tc.preset" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 188.2880096435547, 57.599853515625 ]
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}