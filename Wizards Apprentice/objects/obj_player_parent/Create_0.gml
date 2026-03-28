event_inherited()

#region Loading instance stats

	
	// Health
	max_health = 6
	active_health = max_health;

	// Mana
	max_mana = 10;
	active_mana = max_mana;
	
	
	// Max speed
	move_spd_max = 4;

	// Movement speed when jumping
	jump_speed = 5.5;

	//Terminal Velocity
	term_vel = -jump_speed
	
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
	collision_speed = move_spd_max + global.collision_distance;
	
	//Actively selected spell
	active_spell = 1;
	
#endregion

// Ticks down counter for coyote time
function func_coyote_time()
{
	// Tick down timer if timer is active
	if(coyote_time_timer > 0) coyote_time_timer--;
	
	// Reset timer if on the ground
	if(scr_on_ground()) coyote_time_timer = coyote_time_length;
}

// Ticks down counter for jump buffering
function func_jump_buffer()
{
	// Reset timer whenever jump button is pressed
	if(global.cont_jump_pressed) jump_buffer_timer = jump_buffer_length
	
	// Tick down timer if active
	if(jump_buffer_timer > 0)
	{
		jump_key_buffered = true;
		jump_buffer_timer--
	}else jump_key_buffered = false;
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