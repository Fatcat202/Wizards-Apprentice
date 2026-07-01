function scr_player_search()
{
	
	// Used to locate the player by ground based enemies
	
	// Player coords
	var player_x = obj_player_parent.x
	var player_y = obj_player_parent.y
	
	// Declares if enemy has direct line of sight to the player
	var direct_los = false
	
	making_path = false
	
	// Check if the player is invisible
	if(obj_player_parent.invisible == true)
	{
		player_visible = false
		exit;
	}
		
	// Player is within range
	if(point_distance(x, y, player_x, player_y) <= vision_range)
	{
		// Check there are no platforms or steam blocking vision
		if(!collision_line(x, y, player_x, player_y, obj_platform_solid_parent, false, false)
			&& !collision_line(x, y, player_x, player_y, obj_element_steam_parent, true, false))
		{
			// Declare player as visible
			player_visible = true;
			
			// Declare direct line of sight true
			direct_los = true
		}else
		{
			// Declare direct line of sight false
			direct_los = false
			
			// Set alarm to keep player visible for limited time
			if(alarm_get(2) == -1) alarm_set(2, wall_hack_timer)
		}
		
		
		// If enemy has player set to visible, update tracking
		if(player_visible == true)
		{
			// Range to target player directly, rather than with nodes
			var direct_target_range = 100
			// Check if player is within direct targeting range
			if(point_distance(x, y, player_x, player_y) <= direct_target_range && direct_los == true)
			{
				// Set target coords based directly on player coords
				target_x = player_x;
				target_y = player_y;
				
				// Clear all target nodes if pathing was not just used
				if(pathing_free) scr_clear_target_nodes()

			}else
			{
				// If enemy is a ground based enemy
				if(flies == false)
				{
					
					// Track player based on target nodes
				
					// Check if any nodes exist
					var first_node = array_first(target_nodes)
					if(first_node != undefined)
					{	
						// If enemy is closer to node than player, reset nodes
						if(point_distance(x, y, player_x, player_y) < point_distance(x, y, first_node.x, first_node.y))
						{
							scr_clear_target_nodes()
						}

					}
				
				
					#region Target Below
				
						// Check for platforms between target and enemy
						var plat = collision_line(x, y, target_x, target_y, obj_platform_solid_parent, false, true)
						// If nodes exist, next node is below the enemy, and there is a solid platform between, create path to
						// navigate around platform
						if(target_y > y &&  plat != noone && pathing_free == true)
						{
							//scr_clear_target_nodes()
					
							// Create new attack path
							scr_create_attack_path(target_x, target_y)
					
							if(path_exists(attack_path))
							{
								// Get number of points on path
								var num_points = path_get_number(attack_path)
						
								// Create temp array to hold points
								var temp_array = []
						
						//		show_debug_message("num_points: " + string(num_points))
						
								var pos = 0;
								// Create nodes along path
								for(var i = 0; i < num_points; i++)
								{	
									var xx = path_get_point_x(attack_path, i)
									var yy = path_get_point_y(attack_path, i)
							
									if(y < yy)
									{
										// Create target node
										var target_node = instance_create_layer(xx, yy, "Target_Nodes", obj_target_node)
							
										// Hold instances in array
										temp_array[pos] = target_node
								
										// Increment position
										pos++
									}
								}
							
								var test_node = array_first(temp_array)
								if(test_node != undefined)
								{
								// Combine new target nodes into begining of target_nodes array
									target_nodes = array_concat(temp_array, target_nodes)
								}
						
								path_delete(attack_path)
						
								// Declares a path is being made
								making_path = true

							}else
							{
								show_error("ERROR: Attack Path Not Found", false);
							}
			
						}else
				
					#endregion Target Below
				
					#region Target Above
				
						// If enemy is below target with platform between
						if(target_y - (global.cell_size / 2) < y &&  plat != noone && pathing_free == true)
						{
							/*
								Search for platform above enemy. Store platform y
								Check left and right with same y to search for free space.
								Check if enemy can reach space below free space
								Create target node at free space with enemy y
								Create target node at free space with platform y, subtracting global.cell_size
								Add both target nodes to start of array
							*/
					
							// Coords of intercepting platform
							var plat_x = plat.x;
							var plat_y = plat.y;
					
					
							// Declares potential opening found 
							var opening_found = false
							var opening_x = -1
							var opening_y = plat_y
						
							var half_cell = (global.cell_size/2)

					
							// Number of cells to check left and right
							var num_cells = 4
							for(var i = 0; i < global.cell_size * num_cells; i++)
							{
								// Check right
								if(!place_meeting(plat_x + i, plat_y, obj_platform_solid_parent))
								{
									// Check half a cell right and above to allow room to jump
									if(!place_meeting(plat_x + i + half_cell, plat_y - half_cell, obj_platform_solid_parent))
									{
										// Check if there is a platform located below where the enemy would stand
										if(place_meeting(plat_x + i + half_cell, y + global.cell_size, obj_platform_solid_parent))
										{
											// Set variables
											opening_found = true
											opening_x = plat_x + i + half_cell
											opening_y = plat_y
									
											// End loop
											break;
										}
									}
								}
						
								// Check left
								if(!place_meeting(plat_x - i, plat_y, obj_platform_solid_parent))
								{
									// Check half a cell left and above to allow room to jump
									if(!place_meeting(plat_x - i - half_cell, plat_y - half_cell, obj_platform_solid_parent))
									{
										// Check if there is a platform located below where the enemy would stand
										if(place_meeting(plat_x - i - half_cell, y + global.cell_size, obj_platform_solid_parent))
										{
											// Set variables
											opening_found = true
											opening_x = plat_x - i - half_cell
											opening_y = plat_y
									
											// End loop
											break;
										}
									}
								}		
							}	
					
							// If an opening can be found, create target nodes by ground and in air
							if(opening_found == true)
							{
								// Clear nodes to prevent issues with tracking
								scr_clear_target_nodes()
						
								// Create target node in opening above
								var target_node = instance_create_layer(opening_x, opening_y, "Target_Nodes", obj_target_node)
									// Add target node to array
									array_push(target_nodes, target_node)
							
								// Create target node using opening_x and enemy y
									target_node = instance_create_layer(opening_x, y, "Target_Nodes", obj_target_node)
									// Add target node to array
									array_push(target_nodes, target_node)
				
				
								// Set target to first node
								first_node = array_first(target_nodes)
								target_x = first_node.x
								target_y = first_node.y
						
						
								// Start pathing timer
								making_path = true
							}
					
				
					
						}// END OF PATHFINDING
					#endregion Target Above
				
					#region Normal Node Creation
					
						// If no pathing done, create nodes based on player position
						if(can_target == true && making_path = false)
						{
				
							// Create target node
							var target_node = instance_create_layer(player_x, player_y, "Target_Nodes", obj_target_node)

							// Add target node to array
							array_push(target_nodes, target_node)
				
							first_node = array_first(target_nodes)
							target_x = first_node.x
							target_y = first_node.y
					
							// Reset targeting timer
							can_target = false;
					
						}
				
					#endregion Normal Node Creation
				}else
				
				// If enemy is a flying enemy
				if(flies == true)
				{
					
					// Set target coords
					target_x = player_x
					target_y = player_y
	
					// Run remainder of logic in obj_enemy_parent
					
				}

			}

			// Reset idle state alarm
			alarm_set(0, -1)
			
			// Reset player not visible idle state alarm
			alarm_set(1, -1)
			
		}
		
	}else
	{
		// Immediatly set player to not be visible		
		player_visible = false;
	}
}