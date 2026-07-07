// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reload_save_slot_array()
{
	// Number of save game slots
	global.num_save_slots = 5
				
	// Array holding save game slots
	global.arr_save_slots = []
				
	function save_slot( _slot_number = -1, _slot_file = -1, _player_name = -1, _player_level = -1) constructor
	{
		slot_number = _slot_number		// Number in array of save file
		slot_file = _slot_file			// File name of save file
		player_name = _player_name		// Player name is save file, if exists
		player_level = _player_level	// Player level in save file, if exists
	}
				
	// Fill array with structs holding details of save slots
	for(var i = 0; i < global.num_save_slots; i++)
	{
		// Generate file name
		var file_name = scr_create_file_name(i)
					
		// Holders for needed player data
		var p_level = -1
		var p_name = -1
					
		// If file exists, parse json file to gather needed details
		if(file_exists(file_name))
		{
					
			// Load data from file into string via buffer
			var _buffer = buffer_load(file_name);
			var _string = buffer_read(_buffer, buffer_string);
			buffer_delete(_buffer);
		
			// Parse data into array
			var load_data = json_parse(_string);
						
			// Player data in save file
			var p_data = array_get(load_data, 0)
					
			// Hold needed data
			p_level = p_data.player_level
			p_name = p_data.player_name
					
						
		}
					
		// Create new slot, then place in appropriate place in array
		var slot = new save_slot(i, file_name, p_level, p_name)
		global.arr_save_slots[i] = slot
	}
}