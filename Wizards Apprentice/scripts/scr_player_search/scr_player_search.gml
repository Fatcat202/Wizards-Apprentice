function scr_player_search()
{
	// Player coords
	var player_x = obj_player_parent.x
	var player_y = obj_player_parent.y
	
	// Declares if enemy has direct line of sight to the player
	var direct_los = false
	
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
		if(!collision_line(x, y, player_x, player_y, obj_platform_solid_parent, true, false)
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
			direct_target_range = 100
			// Check if player is within direct targeting range
			if(point_distance(x, y, player_x, player_y) <= direct_target_range && direct_los == true)
			{
				// Set target coords based directly on player coords
				target_x = player_x;
				target_y = player_y;
				
				// Clear all target nodes
				scr_clear_target_nodes()

			}else
			{
				// Track player based on target nodes
				
				var first_node = array_first(target_nodes)
				
				if(first_node != undefined)
				{	
					// If enemy is closer to node than player, reset nodes
					if(point_distance(x, y, player_x, player_y) < point_distance(x, y, first_node.x, first_node.y))
					{
						scr_clear_target_nodes()
					}

				}
					
				if(can_target == true)
				{
				
					// Create target node
					target_node = instance_create_layer(player_x, player_y, "Target_Nodes", obj_target_node)

					// Add target node to array
					array_push(target_nodes, target_node)
				
					first_node = array_first(target_nodes)
					target_x = first_node.x
					target_y = first_node.y
					
					// Reset targeting timer
					can_target = false;
					
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