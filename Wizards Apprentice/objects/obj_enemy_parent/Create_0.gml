

// Inherit the parent event
event_inherited();


#region Determening Enemy for Stats

	// Read name of object and assigns it to object_name
	object_name = object_get_name(object_index);
	// Isolates the character name from object_name
	enemy_name = string_delete(object_name, 0, 4);
	// Initialise this_enemy to track instance data
	index = 0;

	// Determine starting character
	for(var i = 1; i <= global.enemy_index_length; i++)
	{
		if (enemy_name == string(global.arr_enemy_index_name[i]))
		{
			index = i;
		}
	}

#endregion Determening Enemy for Stats


#region Loading instance stats

	// Max Health
	max_health = global.enemy_stats[index].hp
		// Current Health
		active_health = max_health;
		
	// Max movement speed
	move_spd_max_default = global.enemy_stats[index].move_spd;
	
	// Determines if enemy flies
	flies = global.enemy_stats[index].flies;
	
	// Modifiable max movement speed
	move_spd_max = move_spd_max_default
	
	// Declares if enemy can move
	can_move = true;
	
	// Stores x and y origin points
	home_x = x;
	home_y = y;
	
	// Movement speed when jumping
	jump_speed = 8;

	//Terminal Velocity
	term_vel = -7.5
	
	// Current horizontal move speed, used for acceleraton/deceleration
	move_spd_h = 0;
	// Current vertical move speed, used for acceleraton/deceleration
	move_spd_v = 0;
	
	// Direction the enemy is moving. -1 is left, 1 is right
	move_dir = 0;
	
	// Horizontal movement acceleration rate. 0 is instant, 1 is nothing
		// Default modifier
		h_acel_default = 0.5
		// Modifier to be used
		h_acel = h_acel_default
	// Horizontal movement deceleration rate. 0 is instant, 1 is nothing
		// Default modifier
		h_decel_default = 0.4
		// Modifier to be used
		h_decel = h_decel_default
	
	// Used for modifying movement speed when the enemy is on a specific platform element
	
		// Sets default
		plat_spd_default = 1
	
		// Used to modify speeds
		plat_spd_mod = plat_spd_default
	
		// Modifies move speed when on oil
		plat_spd_oil = 0.4
		
		// Modifies acceleration on ice
		plat_spd_acel_ice = 0.6
		// Modifies deceleration on ice
		plat_spd_decel_ice = 2.3
	
	
	// Variable to determine if enemy is walking
	is_walking = false;
	
	// Sets initial default for state_move to idle
	state_move_free = noone
	
	// Collision speed, used for collision logic
	collision_speed = global.collision_distance
	
	// Used to determine if the enemy is solid for the purposes of semi solid objects
	// Flying enemies are always semi solid
	semi_solid = flies;
	
	// Declares enemy is capable of jumping
	can_jump = global.enemy_stats[index].can_jump
	
	// Holds path the enemy has assigned to patrol
	// Must be manually set in object creation code
	path_patrol = -1
	
	// Declares if a patrol has begun
	patrol_started = false
	
	// Declares if the player is visible
	player_visible = false
	
	// X and Y Cords for targeting path goal. Allow for traveling to last known location
	target_x = -1
	target_y = -1
	
	// Range at which an enemy can see the player
	vision_range = global.enemy_stats[index].vision_range;
	
	// Delay in seconds before entering idle state
	idle_state_delay = game_get_speed(gamespeed_fps) * 1
	
	// Random 0 or 1 integer used to shift enemy off players head, determines direction
	rand_shift_dir = -1
	
	// Alarm to reset target coords if player is not visible for a set time
	player_visible_timer = game_get_speed(gamespeed_fps) * 5



#endregion Loading instance stats


#region Enemy AI States


	state_idle = function()
	{

//		show_debug_message("State: Idle")

		// Reset target coords
		target_x = -1
		target_y = -1

		// Search for player and change state to attack if found
		scr_player_search()
		if(player_visible == true)
		{
			state_behavior = state_attack;
				
			scr_reset_enemy_movement()
		}		
		// Begin patrol
		state_behavior = state_patrol;

	}
	
	state_patrol = function()
	{
//		show_debug_message("State: Patrol")

		// Ground based patrol
		if(flies == false)
		{
			// If starting a new patrol
			if(patrol_started == false)
			{
				// Random number for direction to move
				var rand_dir = irandom(1)
			
				// Select direction to begin patrol
				
				// Start left
				if(rand_dir == 0)
				{
					move_dir = -1; 
				}else
				
				// Start right
				if(rand_dir == 1)
				{
					move_dir = 1;
				}
			
				// Declare a patrol has started
				patrol_started = true
			
			}
			if(patrol_started == true)
			{
				
				// Used for checking for ledges
				var check_dist = (global.cell_size / 2) * move_dir
				
				// Distance to check for collisions for stepping up over platforms
				var move_check = abs(move_spd_h * 2) * move_dir
				
				// Check to ensure move_check is not 0
				if(move_check == 0) move_check = 1 * move_dir
				
				// Checks if there is a horizontal platform collision
				var h_coll = place_meeting(x + move_check, y, obj_platform_parent)
				// Detects if enemy can step onto platform
				var plat_step = !place_meeting(x + move_check, y - global.cell_size, obj_platform_parent)
				
				// ledge detected
				var ledge = !place_meeting(x + check_dist, y + global.cell_size, obj_platform_parent)
				// Detects if ledge would be a low fall
				var low_fall = place_meeting(x + check_dist, y + global.cell_size*2, obj_platform_parent)
				
				
				show_debug_message("h_coll: " + string(h_coll))
				show_debug_message("plat_step: " + string(plat_step))
				show_debug_message("ledge: " + string(ledge))
				show_debug_message("low_fall: " + string(low_fall))
			
				
				// No horizontal collision, or can step up on platform
				if(h_coll == false || (h_coll == true && plat_step == true))
				{	// If no ledge, or fall is a short drop
					if(ledge == false || (ledge == true && low_fall == true))
					{
						// Accelerate
						move_spd_h += (h_acel * move_dir)
					}else
					{
						// Switch direction
						move_dir *= -1
						// Swap direction
						move_spd_h *= -1
					}
				}else
				{
					// Switch direction
					move_dir *= -1
					// Swap direction
					move_spd_h *= -1		
				}
			}
		}else
		
		// Flight base patrol
		if(flies == true)
		{
			// If path is assigned and has not started
			if(path_patrol != -1 && path_index == -1)
			{
				// Start manually created path
				path_start(path_patrol, move_spd_max, path_action_restart, 1)
			}
		}
		
		
		// Search for player and change to attack state if found
		scr_player_search()
		if(player_visible == true)
		{
			state_behavior = state_attack;
			
			scr_reset_enemy_movement()
			
		}
		
	}
	
	state_attack = function()
	{	
//		show_debug_message("State: Attack")

		// Reset player coords
		scr_player_search()


		// Reset target coords if player is no longer visible for set time
		if(player_visible == false)
		{
			if(alarm_get(1) == -1) alarm_set(1, player_visible_timer)
		}else alarm_set(1, -1)
		
		
		// If a walking enemy
		if(flies == false)
		{
			// Stop enemy when reaching target
			if(x > target_x - 2 && x < target_x + 2)
			{
				// Stop movement
				move_spd_h = 0;

				// Set alarm to enter idle state
				if(alarm_get(0) == -1)
				{
					alarm_set(0, idle_state_delay)
				}
			}else
			

			// Range to search for nearest jump_spot
			j_range = 20

			// Nearest obj_jump_spot
			var jump_spot = collision_circle(x, y, j_range, obj_jump_spot, false, false)
			// Detect for nearby jump spot, if within range then move towards it to jump
			if(y > target_y + 32 && jump_spot != noone)
			{
				// Move right to jump_spot x
				if(x < jump_spot.x)
				{
					move_spd_h += h_acel
				}else
			
				// Move left to jump_spot x
				if(x > jump_spot.x)
				{
					move_spd_h -= h_acel
				}
				
			}else
			
			// Move right to target_x
			if(x < target_x)
			{
				move_spd_h += h_acel
			}else
			
			// Move left to target_x
			if(x >= target_x)
			{
				move_spd_h -= h_acel
			}

			
			// Trigger the enemy to jump
			if(place_meeting(x, y, obj_jump_spot)) 
			{
				scr_enemy_jump()
			}


		}else
		
		
		// If a flying enemy
		if(flies == true)
		{
			// Implement A*
		}

	}
	

	state_behavior = state_idle;

#endregion Enemy AI States


