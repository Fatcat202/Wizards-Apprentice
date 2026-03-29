event_inherited()

#region Loading instance stats

	
	// Health
		// Normal max health
		base_max_health = 6
		// Adjusted max health after drain
		max_health = base_max_health;
		// Total health drained from normal max
		health_drain = 0;
		// Current health
		active_health = max_health;

	// Mana
		// Normal max mana
		base_max_mana = 10
		// Adjusted max mana after drain
		max_mana = base_max_mana;
		// Total mana drained from normal max
		mana_drain = 0;
		// Current mana
		active_mana = max_mana;
	

	// Max speed
	move_spd_max = 4;

	// Movement speed when jumping
	jump_speed = 5.5;

	//Terminal Velocity
	term_vel = -(jump_speed + 2)
	
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
	
	
	// **TIMERS**
	
	// Coyote timer
	coyote_time_timer = 0;
	// Length of coyote time, measured in cycles
	coyote_time_length = 3;
	
	// Jump buffer timer
	jump_buffer_timer = 0;
	// Length of jump buffer, measured in cycles
	jump_buffer_length = 5
	// Used to determine if a jump has been buffered
	jump_key_buffered = false
	
	// Holding jump timer
	jump_hold_timer = 0;
	// Maximum number of cycles for held jump before gravity kicks in
	jump_hold_frames = 12;
	
	
	
	// Variable to determine if player is walking
	is_walking = false;
	
	// Sets initial default for state_jump to idle
	state_jump_free = noone
	
	// Collision speed, used for collision logic
	collision_speed = global.collision_distance
	
	// Actively selected spell
	active_spell = 1;
	
	// Total number of spells memorised
	total_spells = 5
	
	// Array of usable spells
	arr_active_spells[total_spells] = -1
	
	#region Hard coded spells for testing
		arr_active_spells[1] = global.spell_stats[scr_find_spell_index("heal")]
		arr_active_spells[2] = -1
		arr_active_spells[3] = -1
		arr_active_spells[4] = -1
		arr_active_spells[5] = -1
	//	arr_active_spells[6] = -1
	//	arr_active_spells[7] = -1
	//	arr_active_spells[8] = -1
	//	arr_active_spells[9] = -1
	//	arr_active_spells[10] = -1
	
	show_debug_message("arr_active_spells = " + string(arr_active_spells))
	#endregion Hard coded spells for testing
	
	// Used for deciding if the player is able to attack
	can_attack = true;
	
	#region Spell Timers
		
		// Activates timer and states if spell slot is on cooldown
		spell_cooldown_1 = false;
		spell_cooldown_2 = false;
		spell_cooldown_3 = false;
		spell_cooldown_4 = false;
		spell_cooldown_5 = false;
		spell_cooldown_6 = false;
		spell_cooldown_7 = false;
		spell_cooldown_8 = false;
		spell_cooldown_9 = false;
		spell_cooldown_10 = false;
		
		// Used for the length of a timer in frames
		spell_cooldown_time_1 = 0;
		spell_cooldown_time_2 = 0;
		spell_cooldown_time_3 = 0;
		spell_cooldown_time_4 = 0;
		spell_cooldown_time_5 = 0;
		spell_cooldown_time_6 = 0;
		spell_cooldown_time_7 = 0;
		spell_cooldown_time_8 = 0;
		spell_cooldown_time_9 = 0;
		spell_cooldown_time_10 = 0;

		// Used for ticking timer up
		spell_cooldown_timer_1 = 0;
		spell_cooldown_timer_2 = 0;
		spell_cooldown_timer_3 = 0;
		spell_cooldown_timer_4 = 0;
		spell_cooldown_timer_5 = 0;
		spell_cooldown_timer_6 = 0;
		spell_cooldown_timer_7 = 0;
		spell_cooldown_timer_8 = 0;
		spell_cooldown_timer_9 = 0;
		spell_cooldown_timer_10 = 0;

	#endregion Spell Timers
	
	
#endregion Loading instance stats


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

