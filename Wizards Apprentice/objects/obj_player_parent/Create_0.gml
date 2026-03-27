




#region Loading instance stats

/*
	// Health
	max_hp = global.player_stats[index].dice_hp + global.player_stats[index].hp_mod;
	active_health = max_hp;

	// Armor
	max_armor = global.player_stats[index].dice_armor;
	active_armor = max_armor;
*/


	// Max speed
	move_spd_max = 4;
	
	// Current horizontal move speed, used for acceleraton/deceleration
	move_spd_h = 0;
	
	// Current vertical move speed, used for acceleraton/deceleration
	move_spd_v = 0;
	
	// Horizontal movement acceleration rate. 0 is instant, 1 is nothing
	h_acel = 0.5
	// Horizontal movement deceleration rate. 0 is instant, 1 is nothing
	h_decel = 0.4
	
	// Gravity, used for deceleration when jumping and acceleration when falling
	grav = 0.275
	
	// Movement speed when jumping
	jump_speed = 8;
	
	//Terminal Velocity
	term_vel = -jump_speed
	
	//Coyote Time
	coyote_time = 0;
	// Length of coyote time, measured in frames
	coyote_time_length = 3;
	
	// Collision speed, used for collision logic
	collision_speed = move_spd_max + global.collision_distance;
	
	
	
	
	
	// Variable to determine if player is walking
	is_walking = false;
	
	// Sets initial default for state_jump to idle
	state_jump_free = noone
	
#endregion

// Ticks down counter for coyote time
function func_coyote_time()
{
	if(coyote_time > 0) coyote_time--;
	
	if(scr_on_ground()) coyote_time = coyote_time_length;
}

#region Jump States

	// Applies when the player is not jumping or falling
	state_idle = function()
	{

		state_jump_free = state_idle;
		//show_debug_message("Jump State: Idle");
	}

	// Applies when player is jumping
	state_jumping = function()
	{

		state_jump_free = state_jumping;
		//show_debug_message("Jump State: Jumping");
	}

	// Applies when player is falling
	state_falling = function()
	{

		state_jump_free = state_falling;
		//show_debug_message("Jump State: Falling");
	}

	state_jump = state_idle;
	
#endregion Jump States