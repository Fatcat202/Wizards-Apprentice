// Test if object is located on the ground, return True or False
// May optionally pass through external object, default is testing self
function scr_on_ground(obj = self)
{
	with(obj)
	{
		// Check if the player is on the ground
		if(place_meeting(x, y + 0.5, obj_collision_parent) )
		{
			// Used to prevent thinking the ceiling is the floor
			var quarter_sprite = sprite_get_height(object_get_sprite(obj_player_parent)) / 4
			if(!place_meeting(x, y - quarter_sprite, obj_collision_parent))
			{
				// Debug message
				// show_debug_message("on_ground = true")
				
				return true
			}else return false
		}else
		{
			// Debug message
			// show_debug_message("on_ground = true")
				
			return false
		}
		
	}

}