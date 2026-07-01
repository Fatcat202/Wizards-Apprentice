// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision_above()
{
	// Cause enemy to fall if hitting head on ceiling
	if(place_meeting(x, y - 2, obj_collision_parent) && scr_is_solid(x, y - 2) && !scr_check_semi_solid(x, y - 2))
	{
		if(move_spd_v > 0) move_spd_v = 0
	}
}