// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_avoid_ledges()
{
	if(is_jumping == false)
	{
		// Used for checking for ledges
		var check_dist = (global.cell_size / 2) * move_dir
				
		// Set check distance to 0 if not moving
		if(move_spd_h == 0) check_dist = 0
			
		// ledge detected
		var ledge = !place_meeting(x + check_dist, y + 1, obj_platform_parent)
		// Detects if ledge would be a low fall
		var low_fall = place_meeting(x + check_dist, y + global.cell_size*2, obj_platform_parent)
					
//		show_debug_message("ledge: " + string(ledge))
//		show_debug_message("low_fall: " + string(low_fall))
				
		// If no ledge, or fall is a short drop
		if((target_y + global.cell_size >= y) || (ledge == false) || (ledge == true && low_fall == true))
		{
			// Continue normally
		}else
		{			
			// Set move speed to 0
			move_spd_h = 0
						
			// Clear nodes to not get locked in place
			scr_clear_target_nodes()	
		}	
	}
}