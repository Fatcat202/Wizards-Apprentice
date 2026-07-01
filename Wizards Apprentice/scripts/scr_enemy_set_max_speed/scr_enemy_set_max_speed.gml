// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_set_max_speed()
{
	// If jumping, set max speed to jump speed.
	// Maintain speed set when jumping as max until no longer jumping
	if(is_jumping == true)
	{
		// Set max horizontal movement speed
		move_spd_h = clamp(move_spd_h, -jumping_speed_h_max, jumping_speed_h_max)
	}else
	// If not jumping, set max h speed normally
	if(is_jumping == false)
	{
		// Set max horizontal movement speed
		move_spd_h = clamp(move_spd_h, -move_spd_max, move_spd_max)
	}

	// Set and apply terminal velocity
	if(move_spd_v < term_vel) move_spd_v = term_vel;
}