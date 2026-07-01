// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_to_target()
{
	// Range to reset speed for the purposes of preventing spinning
	var target_range = 1
	if(x > target_x - target_range && x < target_x + target_range)
	{
		move_spd_h = 0
				
		// If array is now empty and the player is not visible
		if(array_length(target_nodes) == 0 && player_visible == false)
		{
			// Set alarm to enter idle state
			if(alarm_get(0) == -1)
			{
				alarm_set(0, idle_state_delay)
			}
		}
	}else
			
	// Move right to target_x
	if(x < target_x)
	{
		move_spd_h += h_acel
	}else
			
	// Move left to target_x
	if(x > target_x)
	{
		move_spd_h -= h_acel
	}
}