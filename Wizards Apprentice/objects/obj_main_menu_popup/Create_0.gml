/// @description

// Set position
xpos = 499
ypos = 191
x = xpos
y = ypos

// State used for detemining what menu options to show in step
state = "none"

// Menu positions for placing buttons
width = sprite_get_width(sprite_index)
height = sprite_get_height(sprite_index)

middle = xpos

x_left = xpos - (width / 2);
x_right = xpos + (width / 2);
y_top = ypos - (height / 2);
y_bottom = ypos + (height / 2);

save_slot_gap = 50
save_slot_x = middle - 70
save_slot_y_title = y_top + 25
save_slot_y = y_top + 10
slot_text_gap = 80




#region New Game

	#region Name Creation
	
	
	#endregion Name Creation

	#region Stats

		stats_x = middle
		stats_start_y = y_top + 75
		stats_gap = 27

		available_level_x = middle
		available_level_y = y_top + 210

		add_button_x = middle + 80
		subtract_button_x = middle - 80


		temp_vit = global.vitality;
		temp_dex = global.dexterity;
		temp_int = global.intelligence;
		temp_mem = global.memory;
		temp_cha = global.charisma;


		global.starting_levels = 15
		temp_free_level = global.starting_levels;

		// Buttons
		add_vit = noone;
		sub_vit = noone;
		add_dex = noone;
		sub_dex = noone;
		add_int = noone;
		sub_int = noone;
		add_mem = noone;
		sub_mem = noone;
		add_cha = noone;
		sub_cha = noone;
	
	#endregion Stats


#endregion New Game

