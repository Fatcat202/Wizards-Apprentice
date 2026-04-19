function scr_check_semi_solid(xx, yy)
{
	// Checks if both self and other collision object are semi solid. If so, return true
	// for the purpose of turning off collisions
	
	// Pass through x and y cords of location to check for semi solid object
	

	// Check if there is a object in the location to be checked before attempting to gather instance data
	if(place_meeting(xx, yy, obj_platform_parent) && scr_is_solid(xx, yy))
	{
		// Check if both self and object in location selected are semi_solid
		if(semi_solid && instance_place(xx, yy, obj_platform_parent).semi_solid)
		{
			// If both are, return true
			return true
		}else return false
	}
}