function scr_load_room_chests()
{
	for(var i = 0; i < array_length(global.arr_levels); i++)
	{
		if(global.arr_levels[i].level_name == room_get_name(room))
		{
			// If no data stored, exit
			if(!is_array(global.arr_levels[i].level_chests))
			{
				exit;
			}
				
			// Loop through each chest
			with(obj_interact_chest)
			{
				// Loop through each level_chests array, searching for correct chest by ID
				for(var j = 0; j < array_length(global.arr_levels[i].level_chests); j++)
				{
					// If ID matches, pass through data
					if(global.arr_levels[i].level_chests[j].chest_id == id)
					{
						// Wipe previous data
						inventory = [];
						chest_gold = 0;
						inventory_slots = 0;
							
						// Pass through new data
						inventory_slots = global.arr_levels[i].level_chests[j].inventory_slots
						inventory = global.arr_levels[i].level_chests[j].inventory
						chest_gold = global.arr_levels[i].level_chests[j].chest_gold
							
					}
				}
			}	
		}
	}
}