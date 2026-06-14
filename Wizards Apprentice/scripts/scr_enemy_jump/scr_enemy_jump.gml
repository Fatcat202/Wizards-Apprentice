// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_jump()
{
	// Function to cause enemy to "jump".
	
	// Offset used to ensure a height difference between target_y and enemy y
	var offset = global.cell_size * 2

	// Check if enemy is capable of jumping
	if(can_jump == true)
	{
		// Check if target_y is higher than enemy
		if(target_y < y - offset
		&& target_y != -1 // Make sure target_y exists
		&& point_distance(x, y, obj_player_parent.x, obj_player_parent.y) > 64)
		{
			// Check if enemy is on ground to jump
			if(scr_on_ground() == true)
			{
				// Gather directon of target point
				var dir = point_direction(x, y, target_x, target_y)
				
				
				// Set move speeds based on direction and overall jump speed
				move_spd_h = lengthdir_x(jump_speed, dir)
				move_spd_v = -lengthdir_y(jump_speed, dir)
				
				// Declare enemy is jumping
				is_jumping = true
				
				// Activate gravity delay
				grav_delay = true
				
				// Start can_jump timer and prevent further jumping
				can_jump = false

			}
		}
	}
}