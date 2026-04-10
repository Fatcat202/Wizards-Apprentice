

// Used for determining if object is a solid object for the purposes of collisions
// Semi solid objects and variables treated seporatly
function scr_is_solid(xx, yy)
{
	if(place_meeting(xx, yy, obj_collision_parent))
	{
		if(instance_place(xx, yy, obj_collision_parent).is_solid == true) return true
		else return false
	} else return false
}