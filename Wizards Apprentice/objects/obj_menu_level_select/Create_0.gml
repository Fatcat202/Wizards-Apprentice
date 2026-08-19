/// @description


spacer = 12;

cell_width = 64

row_length = 4;

// Offset used to ignore wizard tower levels in array, set as first three rooms
slot_offset = 3

slots = global.level_index_length - slot_offset

// Width and height of inventory
width = 24 + row_length * cell_width;
height = cell_width + ((slots div row_length)+2) * cell_width;

// Menu Pos
x_pos = global.cam_target_x + (global.res_w / 2) - (width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (height / 2) + (spacer * 2) - 20;


level_select_x = x_pos + (width/2) - spacer;
level_select_y = y_pos + 20;

level_start_x = x_pos + (width/2) - spacer;
level_start_y = y_pos + (height) - 48



#region Slots

	// Draw Level Slots
	for(var i = 0; i < slots; i++)
	{
		var xx = x_pos + (i mod row_length) * 64;
		var yy = y_pos + (i div row_length) * 64 + 40;

	instance_create_layer(xx, yy, "Menu_Buttons", obj_button_level_select,
	{
		room_num : i + slot_offset,
		slot_offset : slot_offset
	})
		

	//	show_debug_message(string(global.level_stats[i+slot_offset]))
	
		// Stop drawing after reaching final level
		if(global.level_stats[i+slot_offset].level_completed == false) break;
	}
	
#endregion Slots

#region Level Start

	if(!instance_exists(obj_button_level_start))
	{
		instance_create_layer(level_start_x, level_start_y, "Menu_Buttons", obj_button_level_start)
	}

#endregion Level Start


