/// @description

draw_sprite_stretched
(
	spr_inventory,
	0,
	xpos,
	ypos,
	width,
	height
);


// Save game slots
				
// Reload data held in save slot array
scr_reload_save_slot_array()
				
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(fnt_menu_small)
				
	draw_text(middle, save_slot_y_title, "Load Game")
				
	for(var i = 0; i < global.num_save_slots; i++)
	{
						
		var slot_y = save_slot_y + (save_slot_gap*(1+i))
						
		// Slot number text
		draw_text(save_slot_x, slot_y, "Slot " + string(i+1) + ": ")
						
		if(file_exists(global.arr_save_slots[i].slot_file))
		{
							
			draw_text(save_slot_x + slot_text_gap, slot_y - 10, string(global.arr_save_slots[i].player_level))
			draw_text(save_slot_x + slot_text_gap, slot_y + 10, "Level: " + string(global.arr_save_slots[i].player_name))
		}else
		{
			// If no data, show to be empty
			draw_text(save_slot_x + slot_text_gap, slot_y, "Empty")
		}
						
		// Create save slot button
		instance_create_layer(save_slot_x + 50, slot_y, "Menu_Buttons", obj_button_save_slot,
		{
			save_file_num : i,
			file_name : global.arr_save_slots[i].slot_file
		})
						
		// Create save slot delete button
		if(file_exists(global.arr_save_slots[i].slot_file))
		{
			instance_create_layer(x_right - 32, slot_y, "Menu_Buttons", obj_button_delete_slot,
			{
				save_file_num : i,
				file_name : global.arr_save_slots[i].slot_file
			})
		}
						
	}
					
scr_text_reset()
		