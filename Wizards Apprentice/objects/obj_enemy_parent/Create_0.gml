

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
	
	// Determines if enemy is a caster
	caster = global.enemy_stats[index].caster;
	
	// Modifiable max movement speed
	move_spd_max = move_spd_max_default
	
	// Declares if enemy can move
	can_move = true;
	
	// Stores x and y origin points
	home_x = x;
	home_y = y;

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
	player_visible_timer = game_get_speed(gamespeed_fps) * 3.5


	// Array holding all target nodes for tracking player
	target_nodes = []
	
	// Movement speed when jumping
	jump_speed = 6.5;

	// Allow jumping speed to by dynamically altered with each jump
	jumping_speed_h_max = 3.2

	// Time in seconds between being able to create new target node
	target_time = 0.1
	// Time in seconds between being able to jump
	can_jump_time = 1
	// Time in seconds before gravity kicks in when jumping
	grav_delay_time = 0.225
	// Time in seconds before enemy can set a new path
	pathing_free_time = 0.2

	// Length of cooldown
	target_cooldown_length = game_get_speed(gamespeed_fps) * target_time
	// Cooldown timer
	target_cooldown_timer = 0;
	
	// Length of cooldown
	can_jump_cooldown_length = game_get_speed(gamespeed_fps) * can_jump_time
	// Cooldown timer
	can_jump_cooldown_timer = 0;
	
	// Length of cooldown
	grav_delay_cooldown_length = game_get_speed(gamespeed_fps) * grav_delay_time
	// Cooldown timer
	grav_delay_cooldown_timer = 0;
	
	// Length of cooldown
	pathing_free_cooldown_length = game_get_speed(gamespeed_fps) * pathing_free_time
	// Cooldown timer
	pathing_free_cooldown_timer = 0;
		
		
		
	// Determines if enemy may set a new target
	can_target = true;
	
	//	Determines if enemy can jump
	is_jumping = false
	
	// Determines if the enemy can set a new path
	pathing_free = true
	
	// Declares if gravity delay is active when jumping
	grav_delay = false
	
	// Total time in seconds enemy can continue to see player without line of sight
	wall_hack_timer = game_get_speed(gamespeed_fps) * 0.4
	
	// Path used for attacking, or returning to patrol point
	attack_path = path_add()
	
	// Declares if enemy is creating its own flight patrol
	flying_patrol = false
	
	// Declares home has been reached
	returned_home = false

	#region Timers
		
		#region Attack Timers
				
				// Default melee attack timer
				atk_melee_default_cooldown = false;
				atk_melee_default_timer = 0;
				atk_melee_default_time = 0
				
		#endregion Attack Timers
		
	#endregion Timer Initialization
	
	
#endregion Loading instance stats


#region Enemy AI States


	state_idle = function()
	{

//		show_debug_message("State: Idle")

		// Reset target coords
		target_x = -1
		target_y = -1
		
		// Clear target nodes
		scr_clear_target_nodes()

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
	
		#region Ground Enemy Patrol
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
					var ledge = !place_meeting(x + check_dist, y + 1, obj_platform_parent)
					// Detects if ledge would be a low fall
					var low_fall = place_meeting(x + check_dist, y + global.cell_size*2, obj_platform_parent)
				
				/*	
					show_debug_message("h_coll: " + string(h_coll))
					show_debug_message("plat_step: " + string(plat_step))
					show_debug_message("ledge: " + string(ledge))
					show_debug_message("low_fall: " + string(low_fall))
				*/
				
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
		
		#endregion Ground Based Patrol
		
		#region Flying Enemy Patrol
		
			if(flies == true)
			{
				var sprite_size = (sprite_width + sprite_height) / 2
				
				// If path is assigned, has not started, and is within range of patrol start (width of sprite)
				if(path_patrol != -1 && path_index == -1
				&& (point_distance(x, y, path_get_x(path_patrol, 0), path_get_y(path_patrol, 0)) <= sprite_width
				|| point_distance(x, y, path_get_x(path_patrol, 0), path_get_y(path_patrol, 0)) <= sprite_height))
				{	
					
//					show_debug_message("Starting Assigned Patrol")
					
					if(path_exists(attack_path)) path_delete(attack_path)
					
					// Start manually created path
					path_start(path_patrol, move_spd_max, path_action_restart, 1)
				}else
			
			
				// If located elsewhere from starting point, return to start to resume path
				if(path_index == -1 && returned_home == false)
				{
//					show_debug_message("Returning to Assigned Path")
					
					// If path manually assigned, return to path start point
					if(path_patrol != -1)
					{
					
						// Return to path
						scr_create_attack_path(path_get_x(path_patrol, 0), path_get_y(path_patrol, 0), true)
					
						path_start(attack_path, move_spd_max, path_action_stop, 1)
					
						if(x == path_get_x(attack_path, 1) && y == path_get_y(attack_path, 1))
						{
							path_delete(attack_path)
							
							// Declares home has been reached
							returned_home = true
						}
					
						// Set flying patrol false
						flying_patrol = false
					}else
					
					// If no path manually assigned, return to start position
					if(path_patrol == -1)
					{
						// Return to home position
						scr_create_attack_path(home_x, home_y, true)
					
						path_start(attack_path, move_spd_max, path_action_stop, 1)
						
						// End path when reaching home
						if(x == home_x && y == home_y)
						{
							if(path_exists(attack_path)) path_delete(attack_path)
							
							// Declares home has been reached
							returned_home = true
						}
					}
					
					scr_sprite_direction()
				
				}else
			
				// If no path is assigned, fly back and forth looking out for the player
				if(path_patrol == -1 && path_index == -1 && returned_home == true)
				{
					// Move left and right, flipping direction when touching a wall
					
//					show_debug_message("Patrolling Left and Right")
					
					// Check if patrol has started. If not, set speed
					if(flying_patrol == false)
					{
						move_spd_h = move_spd_max;
						
						// Set flying patrol true
						flying_patrol = true
						
						// Store starting y position for wave
						start_y = y;
					}
					
					
					// Height of sine wave
					var	wave_height = 15;
					
					// Move object
					x += move_spd_h
					y = start_y + (sin(current_time/500) * wave_height)
					
					#region Sprite Flip
						if(move_spd_h > 0)
						{
							image_xscale = 1
						}

						if(move_spd_h < 0)
						{
							image_xscale = -1
						}
					#endregion Sprite Flip

					// Flip direction when reaching wall
					if(place_meeting(x + move_spd_h, y, obj_platform_solid_parent))
					{
						move_spd_h *= -1
					}


				}else
				
				// Moving on path
				if(path_index != -1)
				{
				//	show_debug_message("Moving on Patrol Path");
				
					// Set flying patrol false
					flying_patrol = false
				}else
				{
					show_error("Error: No Patrol Moveset Found", false);
					
					// Set flying patrol false
					flying_patrol = false
				}

			}
		
		#endregion Flying Enemy Patrol
		
		#region Enter Attack State
		
			// Search for player and change to attack state if found
			scr_player_search()
			if(player_visible == true)
			{
				flying_patrol = false
				
				// Destroy attack path if it exists
				if(path_exists(attack_path))
				{
					path_delete(attack_path)
				}
				
				// Declares home has not been reached
				returned_home = false
				
				state_behavior = state_attack;
			
				scr_reset_enemy_movement()
			
			}
		
		#endregion Enter Attack State
		
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
		
		
		#region GROUND ENEMIES
			// If a walking enemy
			if(flies == false && caster == false)
			{
				// Range to reset coords
				var target_range = 5
				
				// Delete target node from array when reaching within range
				if(x > target_x - target_range && x < target_x + target_range)
				{
					// Gather first node
					var first_node = array_first(target_nodes)
				
					// If target_node array is being targeted
					if(array_first(target_nodes) != undefined)
					{
						// Remove first target node from array and destroy instance
						instance_destroy(array_shift(target_nodes))

						// If array is now empty and the player is not visible
						if(array_length(target_nodes) == 0 && player_visible == false)
						{
							// Set alarm to enter idle state
							if(alarm_get(0) == -1)
							{
								alarm_set(0, idle_state_delay)
							}
						}else
					
						if(player_visible == false)
						{	// Target next node in array
							var new_first_node = array_first(target_nodes)
						
							// Set new coords
							target_x = new_first_node.x
							target_y = new_first_node.y
						
						}
					}
				}

				// Range to reset speed for the purposes of preventing spinning
				var target_range = 1
				if(x > target_x - target_range && x < target_x + target_range)
				{
					move_spd_h = 0
				
					// If array is now empty and the player is not visible
					if(array_length(target_nodes) == 0 && player_visible == false)
					{
						// Set alarm to enter idle state
						if(alarm_get(0) == -1)
						{
							alarm_set(0, idle_state_delay)
						}
					}
				}else
			
				// Move right to target_x
				if(x < target_x)
				{
					move_spd_h += h_acel
				}else
			
				// Move left to target_x
				if(x > target_x)
				{
					move_spd_h -= h_acel
				}

			
				if(!collision_line(x, y, target_x, target_y, obj_platform_solid_parent, false, false))
				{
					// Trigger the enemy to jump
					scr_enemy_jump()
				}
			
			
				#region Avoid Ledges

					if(is_jumping == false)
					{
						// Used for checking for ledges
						var check_dist = (global.cell_size / 2) * move_dir
				
						// Set check distance to 0 if not moving
						if(move_spd_h == 0) check_dist = 0
			
						// ledge detected
						var ledge = !place_meeting(x + check_dist, y + 1, obj_platform_parent)
						// Detects if ledge would be a low fall
						var low_fall = place_meeting(x + check_dist, y + global.cell_size*2, obj_platform_parent)
					
				//		show_debug_message("ledge: " + string(ledge))
				//		show_debug_message("low_fall: " + string(low_fall))
				
						// If no ledge, or fall is a short drop
						if((target_y + global.cell_size >= y) || (ledge == false) || (ledge == true && low_fall == true))
						{
							// Continue normally
						}else
						{			
							// Set move speed to 0
							move_spd_h = 0
						
							// Clear nodes to not get locked in place
							scr_clear_target_nodes()	
						}	
					}
				
				#endregion Avoid Ledges

				#region Changing Modifiers Based On Platform Element
	
					// Detects platform ID below player
					var plat_id = instance_place(x, y + 1, obj_platform_parent)
					if(plat_id != noone)
					{
				
						if(plat_id.oil_level > 0)
						{
							// Rest any changes
							scr_reset_move_modifiers();
				
							// Change move speed to match
							plat_spd_mod = plat_spd_oil;
			
							// Change acceleration/deceleration
							h_acel = h_acel_default * plat_spd_mod;
							h_decel = h_decel_default * plat_spd_mod;
							// Change max move speed
							move_spd_max = move_spd_max_default * plat_spd_mod;
			
			
						}else
					
						if(plat_id.is_ice == true)
						{
							// Rest any changes
							scr_reset_move_modifiers();
				
							// Change acceleration/deceleration
							h_acel = h_acel_default * plat_spd_acel_ice;
							h_decel = h_decel_default * plat_spd_decel_ice;
				
				
						}else
					
						if(plat_id.water_level > 0)
						{
							// Rest any changes
							scr_reset_move_modifiers();
						
							// If the character is standing on a charged water platform
							if(plat_id.is_charged)
							{
	
								// Determines if the character can be stunned
								if(can_be_stunned == true)
								{
									// Declares the player platform stunned, starting timer until no longer stunned
									plat_stunned = true
								}
							
							}
						}else scr_reset_move_modifiers() // Rest any changes when on the ground
					
				
					}else scr_reset_move_modifiers() // Rest any changes when not on the ground
			

		
				#endregion Changing Modifiers Based On Platform Element

				#region Move Object
		

					#region Collision above
		
						// Cause enemy to fall if hitting head on ceiling
						if(place_meeting(x, y - 2, obj_collision_parent) && scr_is_solid(x, y - 2) && !scr_check_semi_solid(x, y - 2))
						{
							if(move_spd_v > 0) move_spd_v = 0
						}
			
					#endregion Collision above
		
					#region Slopes
			
						// Distance to move object to navigate slope
						var move_dis = 1
			
						// Check for horizontal collision
						if(place_meeting(x + move_spd_h, y, obj_platform_parent))
						{
							// Check for slope to go up
							if(!place_meeting(x + move_spd_h, y - abs(move_spd_h) - 1, obj_collision_parent))
							{
								// Go up slope
								while(place_meeting(x + move_spd_h, y, obj_collision_parent))
								{
									y -=  move_dis
								}
							}else
							{	
								// Preventing getting stuck with collision objects horizontaly
								move_spd_h = 0
							}
						}
			
						// Check for slope to go down
						if(move_spd_v >= 0 && !place_meeting(x + move_spd_h, y + 1, obj_collision_parent) && place_meeting(x + move_spd_h, y + abs(move_spd_h) + 1, obj_collision_parent))
						{
							// Go down slope
							while(!place_meeting(x + move_spd_h, y + move_dis, obj_collision_parent))
							{
									y += move_dis
							}
						}
				
					#endregion Slopes
		
					#region Declaring movement direction
			
						// Declare movement direction
						if(move_spd_h > 0)
						{
							move_dir = 1
						}else
						if(move_spd_h < 0)
						{
							move_dir = -1
						}
				
					#endregion Declaring movement direction
		
					// Short jump over adjacent platform
					scr_step_over_platform()
					
					#region Sliding off player
		
						// Cause enemy to fall off player head if landing on player
						if(place_meeting(x, y + 2, obj_player_parent))
						{
							if(rand_shift_dir == -1) rand_shift_dir = irandom(1)
			
							// Shift left
							if(rand_shift_dir == 0)
							{
								move_spd_h -= 2
							}else
			
							// Shift right
							if(rand_shift_dir == 1)
							{
								move_spd_h += 2
							}
						}else rand_shift_dir = -1
			
					#endregion Sliding off player
		
					#region Distance to Player Check
		
						// Enemy stops movement if within the width of the player sprite to the player
						if(point_distance(x, y, obj_player_parent.x, obj_player_parent.y) < sprite_get_width(spr_player)
						&& !place_meeting(x, y + 2, obj_player_parent))
						{
							move_spd_h = 0
						}
			
					#endregion Distance to Player Check
		
					#region Semi-Solid Passthrough
		
						// If target is below enemy, activate semi solid to pass through platforms
						if(target_y - global.cell_size > y || is_jumping == true)
						{
							semi_solid = true;
						}else
						{
							semi_solid = false;
						}
				
					//	show_debug_message("semi_solid: " + string(semi_solid))
			
					#endregion Semi-Solid Passthrough	
		
					#region Setting Max Speed
				
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
		
					#endregion Setting Max Speed

					// Move object horizontally
					x += move_spd_h
					// Move object vertically
					y -= move_spd_v
			
					#region is_jumping
			
						// Reset is_jumping when on the ground
						if(scr_on_ground() == true)
						{
							is_jumping = false;
					
						}
				
					#endregion is_jumping
			
					#region Gravity
	
						if(!flies)
						{
							if(!scr_on_ground())
							{
								// Apply gravity if grav_delay is off
								if(grav_delay == false) move_spd_v -= global.grav;

								// Gravity Debug
								//show_debug_message("Gravity On")
								//show_debug_message("grav_delay: " + string(grav_delay))
							}else
							{
								// Reset y speed if on the ground
								move_spd_v = 0
				
								// Gravity Debug
								//show_debug_message("Gravity Off")
							}
						}
	
					#endregion Gravity
	
				#endregion Move Object
		
				#region Flipping Sprite
	
					// Flip sprite when moving	
					if(move_dir = 1)
					{
						image_xscale = 1
					}else 
		
					if(move_dir = -1)
					{
						image_xscale = -1
					}

		
				#endregion Flipping Sprite

			}else
		
		#endregion GROUND ENEMIES


		#region FLYING ENEMIES
			if(flies == true && caster == false)
			{
				// Target coords set to player coords in scr_player_search
				
			//	if(path_exists(attack_path)) path_delete(attack_path);
			//	attack_path = path_add()
			
				#region Player Proximity Stop
					
					// Cancel movement if within width of player sprite
					
					var dis_to_player = point_distance(x, y, obj_player_parent.x, obj_player_parent.y)
					var player_sprite_size = (sprite_get_width(spr_player) + sprite_get_height(spr_player)) / 2
					if(dis_to_player < player_sprite_size) exit;
					
				#endregion Player Proximity Stop
				
				#region Platform Proximity
					/*
					// Platform Below
					if(place_meeting(x, y + global.half_cell, obj_platform_solid_parent))
					{
						y--
					}
					
					// Platform Above
					if(place_meeting(x, y - global.half_cell, obj_platform_solid_parent))
					{
						y++
					}
					
					// Platform Right
					if(place_meeting(x + global.half_cell, y, obj_platform_solid_parent))
					{
						x--
					}
					
					// Platform Left
					if(place_meeting(x - global.half_cell, y, obj_platform_solid_parent))
					{
						x++
					}
				*/
				#endregion Platform Proximity 

				// Create path to player
				scr_create_attack_path(target_x, target_y)
					
				// Move on path
				if(path_exists(attack_path) && can_move)
				{	

					// Move towards first point 
					mp_potential_step_object(target_x, target_y, move_spd_max, obj_collision_parent);
					

				}else
				
				if(can_move == false)
				{	
					// Delete path if unable to move
					if(path_exists(attack_path)) path_delete(attack_path); 
				}
			
			
				// Change sprite direction based on movement
				scr_sprite_direction()
				
				
			
			}else
		#endregion FLYING ENEMIES


		#region CASTERS
		
			if(caster == true)
			{
				// Implement caster logic
			
			
			}else
			{
				show_error("Error: No moveset found", false)
			}
			
		#endregion CASTERS
	
	}
	
	

	state_behavior = state_idle;

#endregion Enemy AI States

