// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_get_completed(_room)
{
	// Pass through room to check as completed
	// Returns true or false
	
	_room = room_get_name(_room);
	
	for(var i = 0; i < global.level_index_length; i++)
	{
		if(asset_get_index(global.level_stats[i].room_name) == _room)
		{
			return global.level_stats[i].level_completed;
		}
	}
}