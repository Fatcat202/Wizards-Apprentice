

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
	jump_speed = 5.5;

	//Terminal Velocity
	term_vel = -(jump_speed + 2)
	
	// Current horizontal move speed, used for acceleraton/deceleration
	move_spd_h = 0;
	// Current vertical move speed, used for acceleraton/deceleration
	move_spd_v = 0;
	
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
	semi_solid = false
	
	// Normal max jumps
	base_max_jumps = 0;
	// Adjusted jumps
	max_jumps = 1;
	// Jumps remaining
	jumps_left = max_jumps
	
	// Jump Height in pixels
	jump_height = global.cell_size * global.enemy_stats[index].jump_height
	
	
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
	



#endregion





#region Enemy AI States


	state_idle = function()
	{
		
//		show_debug_message("State: Idle")

		// Search for player and change state to attack if found
		scr_player_search()
		if(player_visible == true)
		{
			state_behavior = state_attack;
		}

		
		// Begin patrol if located at spawn point
		if(point_distance(x, y, home_x, home_y) < (sprite_height + sprite_width) / 2)
		{
			state_behavior = state_patrol;
		}
		
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
			
			}else
		
			if(patrol_started == true)
			{
				var check_dist = (global.cell_size) * move_dir
				
				// No horizontal collision or ledge
				if(!place_meeting(x + move_spd_h, y, obj_platform_parent)
				&& place_meeting(x + check_dist, y + 1, obj_platform_parent))
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
		}
		
	}
	
	state_attack = function()
	{	
//		show_debug_message("State: Attack")

		// End path
		if(path_index != -1)
		{
			path_end()
		}
		
		// Decelerate till stopping
		if(move_spd_h > 0) move_spd_h -= h_decel;
		if(move_spd_h < 0) move_spd_h = 0;

	}
	
	state_return_home = function()
	{		
//		show_debug_message("State: Return Home")


	}

	state_behavior = state_idle;

#endregion Enemy AI States


