// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_attack_path(_target_x = target_x, _target_y = target_y, diag = false)
{
	
	// Used to create path from enemy to target_x and target_y
	
	// Checks if enemy can set a new path
	if(pathing_free)
	{
		// Set pathing timer
		pathing_free = false
		
		//
		var x_cell = floor(_target_x / global.cell_size);
		var y_cell = floor(_target_y / global.cell_size);
						
		// 
		var position_x = (x_cell * global.cell_size);
		var position_y = (y_cell * global.cell_size);
						
		// Create a new path
		if(!path_exists(attack_path)) attack_path = path_add()
		attack_path = path_add()	
	
	
		// Draw new path
		mp_grid_path(global.mp_grid, attack_path, x, y, position_x, position_y, diag);
	}
}