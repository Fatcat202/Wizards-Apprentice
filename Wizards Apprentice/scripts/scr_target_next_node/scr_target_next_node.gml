// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_next_node()
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
}