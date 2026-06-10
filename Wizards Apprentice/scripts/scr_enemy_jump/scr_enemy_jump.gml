// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_jump()
{
	// Function to cause enemy to "jump".

	// Temp variable for testing
	jump_speed = 10
	
	// Offset used to ensure a height difference between target_y and enemy y
	var offset = 10

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
				// Set vertical movement to jump speed
				move_spd_v = jump_speed
			}
		}
	}
}