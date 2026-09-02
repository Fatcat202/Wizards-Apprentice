/// @description Platform Elements

// Inherit the parent event
event_inherited();


if(element_interaction_triggered == false)
{
	// Iterate for each pixel along width of sprite
	for(var i = 0; i < sprite_width; i++)
	{
		
		var x_pos = x - (sprite_width/2) + i
		
		// Check along length of object for platforms
		if(place_meeting(x_pos, y + 1, obj_platform_parent))
		{	
			// Gather platform ID
			var other_id = instance_place(x_pos, y + 1, obj_platform_parent)

			// If not contained in array, add to array and interact
			if(!array_contains(arr_interacted_platforms, other_id))
			{
				// Add to interacted array
				array_push(arr_interacted_platforms, other_id)
				
				// Interact with platform
				scr_element_platform_interactions(id, other_id)
			}
		}
		
	}
	show_debug_message("sprite_width: " + string(sprite_width))
	show_debug_message("arr_interacted_platforms: " + string(arr_interacted_platforms))

	// Declare element interaction complete
	element_interaction_triggered = true;
}


// Destroys wall after set duration
if(!alarm_get(0)) alarm_set(0, game_get_speed(gamespeed_fps) * duration);