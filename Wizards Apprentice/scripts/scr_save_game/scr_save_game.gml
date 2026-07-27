// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_game(file_num = global.file_num)
{	
	
	// Pass through save slot number as file_num
	
	// Create save data array
	var save_data = array_create(0);
	
	
	#region Room Save
	
		// Array to hold chest data
		var level_chests = []
		
		// Loop through all chests in room
		with(obj_interact_chest)
		{
			// Gather chest data
			var chest_struct =
			{
				chest_id : id,
				inventory : inventory,
				inventory_slots : inventory_slots,
				chest_gold : chest_gold
			}
			
			// Push chest data into level_chests array
			array_push(level_chests, chest_struct)
		}
		
		for(var i = 0; i < global.level_index_length; i++)
		{
			if(global.level_stats[i].level_name == room_get_name(room))
			{
				global.level_stats[i].level_chests = level_chests

			}
		}
		
	#endregion Room Save
	
	
	#region Data collection

		// Create struct to hold player data for transfer
		global.player_data =
		{
			vitality : global.vitality,
			intelligence : global.intelligence,
			dexterity : global.dexterity,
			memory : global.memory,
			charisma : global.charisma,
		
			player_level : global.player_level,
			player_gold : global.player_gold,
			player_xp : global.player_xp,
			player_name : global.player_name,
			player_free_level : global.player_free_level,
		
			active_spells : global.active_spells,
			spellbook : global.spellbook,
			inventory : global.inventory,
		
			arr_levels : global.level_stats
		
		}
		// Add data struct to start of save_data array
		array_push(save_data, global.player_data)
	
	
	#endregion Data collection
	
	
	#region JSON Saving
	
		// File name generation
		var file_name = scr_create_file_name(file_num)
	
		// Convert array to string to place into json. Use buffer to set in memory
		var _string = json_stringify(save_data, true);
		var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
		buffer_write(_buffer, buffer_string, _string);
		buffer_save(_buffer, file_name);
		buffer_delete(_buffer)
		
		global.file_num = file_num
	
//		show_debug_message("Game Saved! " + _string)
	
	#endregion JSON Saving
}