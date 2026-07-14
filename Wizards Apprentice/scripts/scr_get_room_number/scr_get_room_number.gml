// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_room_number(_room)
{
	// Find and set global.active_level_num by searching via room name
	
	room_name = room_get_name(room)
	
	for(var i = 0; i < array_length(global.arr_levels); i++)
	{
		if(global.arr_levels[i].level_name == room_name)
		{
			global.active_level_num = i;
		}
	}
}