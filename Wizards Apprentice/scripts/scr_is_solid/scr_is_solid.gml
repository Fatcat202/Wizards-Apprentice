

// Used for determining if object is a solid object for the purposes of collisions
// Semi solid objects and variables treated seperatly
function scr_is_solid(xx, yy)
{
	// Check for platforms
	if(place_meeting(xx, yy, obj_platform_parent))
	{
		if(instance_place(xx, yy, obj_platform_parent).is_solid == true)
		{
			return true
		}else return false
		
	// Check for spell walls
	}else if(place_meeting(xx, yy, obj_wall_player_parent))
	{
		if(instance_place(xx, yy, obj_wall_player_parent).is_solid == true)
		{
			return true
		}else return false
		
	// Check for characters
	}else if(place_meeting(xx, yy, obj_character))
	{
		if(instance_place(xx, yy, obj_character).is_solid == true)
		{
			return true
		}else return false
	}else return false
}