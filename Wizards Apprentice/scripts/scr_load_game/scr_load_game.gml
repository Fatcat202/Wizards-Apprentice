// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_game(file_num = 0, new_room = rm_wizard_tower)
{
	// Pass through file number to load
	// Pass through new room to move to, default being wizard tower
	
	
	// File name
	var file_name = scr_create_file_name(file_num)
	
	if(file_exists(file_name))
	{
		// Load data from file into string via buffer
		var _buffer = buffer_load(file_name);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		// Parse data into array
		var load_data = json_parse(_string);
		
		// Gather player data from position 0
		global.player_data = array_get(load_data, 0)
		
		
		// Load individual variables
		global.vitality = global.player_data.vitality
		global.intelligence = global.player_data.intelligence
		global.dexterity = global.player_data.dexterity
		global.memory = global.player_data.memory
		global.charisma = global.player_data.charisma
		
		global.player_level = global.player_data.player_level
		global.player_gold = global.player_data.player_gold
		global.player_xp = global.player_data.player_xp
		global.player_name = global.player_data.player_name
		global.player_free_level = global.player_data.player_free_level
		
		global.active_spells = global.player_data.active_spells
		global.spellbook = global.player_data.spellbook
		global.inventory = global.player_data.inventory
		
		global.arr_levels = global.player_data.arr_levels
		
		
		//show_debug_message(global.player_data)
//		show_debug_message("Save Game Loaded! " + _string)
		

		
		// Go to loaded room	
		scr_transfer_to_room(new_room)
		
		// Ensure pause properties are undone
//		scr_esc_resume()
//		if(instance_exists(obj_esc_menu)) instance_destroy(obj_esc_menu)
//		layer_destroy_instances("Menu_Buttons")


	}else
	{
		show_error("Error: Save Game Not Found", true);
	}
	
}