// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_step_over_platform()
{
	// Cancel script if not on the ground
	if(scr_on_ground() == false) exit;
	
	// Distance to check for collision
	var check_dis = abs(move_spd_h * 2) * move_dir
	
	// Check to ensure check_dis is not 0
	if(check_dis == 0) check_dis = 1 * move_dir
	
	// Checks if there is a horizontal platform collision
	var h_coll = place_meeting(x + check_dis, y, obj_platform_parent)
	// Detects if enemy can step onto platform
	var plat_step = !place_meeting(x + check_dis, y - global.cell_size, obj_platform_parent)
	
	// Check for horizontal platform collision
	if(h_coll)
	{
		// Check platform to see if it is a slope
		var plat_id = instance_place(x + check_dis, y, obj_platform_parent)
		var plat_is_slope = object_is_ancestor(plat_id.object_index, obj_platform_aa_slope_parent)

		// If possible to step on, and platform is not a slope
		if(plat_step && plat_is_slope == false)
		{
			// Short hop to mantle platform
			move_spd_v = 4
			
			
			// Teleport onto platform
			//x += check_dis 
			//y -= global.cell_size
		}
	}
}