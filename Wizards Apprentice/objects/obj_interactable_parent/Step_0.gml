/// @description Interact

// If player is within range with direct line of sight, allow for interaction
if(collision_circle(x, y,interact_size, obj_player_parent, true, false) != noone
	&& collision_line(x, y, obj_player_parent.x, obj_player_parent.y, obj_platform_solid_parent, true, false) == noone)
	{
		// Display text to interact
		within_range = true;
		
		// If interact button pressed when within range, start object specific action
		if(global.cont_interact == true)
		{
			// Logic if interaction happens
			
			event_user(0)
		}
	}else within_range = false;