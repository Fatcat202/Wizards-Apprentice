
function scr_room_set_completed(_room = room)
{
	// Must pass through room to set as completed, defaults as current room
				
	// Set room as completed
				
	for(var i = 0; i < array_length(global.arr_levels); i++)
	{
		if(global.arr_levels[i].level_name == _room)
		{
			global.arr_levels[i].level_completed = true;
		}
	}
}