// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_room_number()
{
	// Find and set global.active_level_num by searching via room name

	room_name = room_get_name(room)
//	show_debug_message(room_name)
	
	for(var i = 0; i < array_length(global.arr_levels); i++)
	{
//		show_debug_message(global.arr_levels[i].level_name)
		
		if(room_get_name(global.arr_levels[i].level_name) == room_name)
		{
			global.active_level_num = i;
			
			show_debug_message("global.active_level_num: " + string(global.active_level_num))
		}
	}
}