// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_gravity()
{
	if(!flies)
	{
		if(!scr_on_ground())
		{
			// Apply gravity if grav_delay is off
			if(grav_delay == false) move_spd_v -= global.grav;

			// Gravity Debug
			//show_debug_message("Gravity On")
			//show_debug_message("grav_delay: " + string(grav_delay))
		}else
		{
			// Reset y speed if on the ground
			move_spd_v = 0
				
			// Gravity Debug
			//show_debug_message("Gravity Off")
		}
	}
}