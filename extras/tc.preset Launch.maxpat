{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 391.0, 289.0, 483.0, 443.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 2,
		"toptoolbarpinned" : 2,
		"righttoolbarpinned" : 2,
		"bottomtoolbarpinned" : 2,
		"toolbars_unpinned_last_save" : 15,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 0,
		"enablevscroll" : 0,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-17",
					"linecount" : 5,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.0, 354.0, 116.0, 76.0 ],
					"text" : ";\rmax launchbrowser https://glucose47.gumroad.com/l/tc_preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 166.5, 373.0, 150.0, 47.0 ],
					"text" : "GPL 3.0\n© Théophile Clet, 2024\nClick here to support",
					"textcolor" : [ 0.0, 0.0, 0.0, 0.5 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 99.0, 81.0, 285.0, 24.0 ],
					"text" : "A jsui replacement for the preset object"
				}

			}
, 			{
				"box" : 				{
					"embedstate" : [ [ "spacing", 4 ], [ "color_3", 0.527, 0.459, 0.756, 1 ], [ "text_bg_color", 1, 1, 1, 0.5 ], [ "color_1", 0.743, 0.41, 0.501, 1 ], [ "color_2", 0.679, 0.405, 0.669, 1 ], [ "color_4", 0.367, 0.542, 0.712, 1 ], [ "select_mode", 0 ], [ "scrollable", 0 ], [ "bubblesize", 14 ], [ "margin", 4 ], [ "fontsize", 14 ], [ "color_mode", 0 ], [ "color_5", 0.283, 0.606, 0.559, 1 ], [ "ignoreslotzero", 1 ], [ "min_rows", 10 ], [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ], [ "fontname", "Arial" ], [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ], [ "text_color", 0.129, 0.129, 0.129, 1 ], [ "color_6", 0.316, 0.616, 0.377, 1 ], [ "display_interp", 1 ], [ "bgcolor", 0.2, 0.2, 0.2, 1 ], [ "slot_round", 0 ], [ "interp_slot_color", 1, 1, 1, 0.8 ], [ "active_slot_color", 0.808, 0.898, 0.91, 1 ], [ "autowriteagain", 0 ], [ "layout", 1 ] ],
					"filename" : "tc.preset",
					"id" : "obj-8",
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 254.0, 153.0, 130.0, 58.0 ]
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.0, 301.0, 51.0, 22.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 9.0, 274.0, 129.0, 22.0 ],
					"text" : "load tc.preset.maxhelp"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-4",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 162.0, 282.0, 159.0, 41.0 ],
					"text" : "Open helper file"
				}

			}
, 			{
				"box" : 				{
					"embedstate" : [ [ "spacing", 4 ], [ "color_3", 0.527, 0.459, 0.756, 1 ], [ "text_bg_color", 1, 1, 1, 0.5 ], [ "color_1", 0.743, 0.41, 0.501, 1 ], [ "color_2", 0.679, 0.405, 0.669, 1 ], [ "color_4", 0.367, 0.542, 0.712, 1 ], [ "select_mode", 0 ], [ "scrollable", 0 ], [ "bubblesize", 14 ], [ "margin", 4 ], [ "fontsize", 14 ], [ "color_mode", 0 ], [ "color_5", 0.283, 0.606, 0.559, 1 ], [ "ignoreslotzero", 1 ], [ "min_rows", 10 ], [ "stored_slot_color", 0.502, 0.502, 0.502, 1 ], [ "fontname", "Arial" ], [ "empty_slot_color", 0.349, 0.349, 0.349, 1 ], [ "text_color", 0.129, 0.129, 0.129, 1 ], [ "color_6", 0.316, 0.616, 0.377, 1 ], [ "display_interp", 1 ], [ "bgcolor", 0.2, 0.2, 0.2, 1 ], [ "slot_round", 0 ], [ "interp_slot_color", 1, 1, 1, 0.8 ], [ "active_slot_color", 0.808, 0.898, 0.91, 1 ], [ "autowriteagain", 0 ], [ "layout", 0 ] ],
					"filename" : "tc.preset",
					"id" : "obj-3",
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 99.0, 153.0, 130.0, 58.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 48.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 137.0, 16.0, 209.0, 60.0 ],
					"text" : "tc.preset",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.2, 0.2, 0.2, 0.0 ],
					"fontsize" : 20.0,
					"id" : "obj-15",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 166.5, 373.0, 150.0, 47.0 ],
					"text" : "Open helper file",
					"textoncolor" : [ 0.807843137254902, 0.898039215686275, 0.909803921568627, 0.0 ],
					"textovercolor" : [ 0.929411764705882, 0.929411764705882, 0.352941176470588, 0.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"hidden" : 1,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"hidden" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"hidden" : 1,
					"source" : [ "obj-6", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "tc.preset.js",
				"bootpath" : "~/Documents/Max 8/Packages/tc.preset/code",
				"patcherrelativepath" : "../code",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
