// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_slopes()
{
	// Distance to move object to navigate slope
	var move_dis = 1
			
	// Check for horizontal collision
	if(place_meeting(x + move_spd_h, y, obj_platform_parent))
	{
		// Check for slope to go up
		if(!place_meeting(x + move_spd_h, y - abs(move_spd_h) - 1, obj_collision_parent))
		{
			// Go up slope
			while(place_meeting(x + move_spd_h, y, obj_collision_parent))
			{
				y -=  move_dis
			}
		}else
		{	
			// Preventing getting stuck with collision objects horizontaly
			move_spd_h = 0
		}
	}
			
	// Check for slope to go down
	if(move_spd_v >= 0 && !place_meeting(x + move_spd_h, y + 1, obj_collision_parent) && place_meeting(x + move_spd_h, y + abs(move_spd_h) + 1, obj_collision_parent))
	{
		// Go down slope
		while(!place_meeting(x + move_spd_h, y + move_dis, obj_collision_parent))
		{
				y += move_dis
		}
	}
}