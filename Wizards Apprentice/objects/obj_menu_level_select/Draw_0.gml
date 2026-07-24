/// @description

// Draw Pause Image
draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)

// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	x_pos - spacer,
	y_pos - spacer,
	width,
	height
);

// Set text draw settings
scr_draw_set_text(fa_center, fa_middle, fnt_menu, c_black)

// Draw level select text
draw_text(level_select_x, level_select_y, "Portal Gate")

#region Slots

	// Draw Level Slots
	for(var i = 0; i < slots; i++)
	{
		var xx = x_pos + (i mod row_length) * 64;
		var yy = y_pos + (i div row_length) * 64 + 40;
	
	
	
		if(!place_meeting(xx, yy, obj_button_level_select))
		{
			instance_create_layer(xx, yy, "Menu_Buttons", obj_button_level_select,
			{
				room_num : i + slot_offset,
				slot_offset : slot_offset
			})
		}
	
	//	show_debug_message(string(global.arr_levels[i+slot_offset]))
	
		// Stop drawing after reaching final level
		if(global.arr_levels[i+slot_offset].level_completed == false) break;
	}
	
#endregion Slots

#region Level Start

	instance_create_layer(level_start_x, level_start_y, "Menu_Buttons", obj_button_level_start)

#endregion Level Start




// Reset all text settings
scr_text_reset()