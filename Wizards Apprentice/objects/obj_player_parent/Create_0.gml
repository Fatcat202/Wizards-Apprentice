




#region Loading instance stats

/*
	// Health
	max_hp = global.player_stats[index].dice_hp + global.player_stats[index].hp_mod;
	active_health = max_hp;

	// Armor
	max_armor = global.player_stats[index].dice_armor;
	active_armor = max_armor;
*/


	// Speed
	move_spd = 5;
	jump_speed = -8;
	collision_speed = move_spd + global.collision_distance;
	y_speed = 0;
	
	//Terminal Velocity
	term_vel = move_spd
	
	// Variable to determine if player is walking
	is_walking = false;
	
	// Sets initial default for state_jump to idle
	state_jump_free = noone
	
#endregion

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