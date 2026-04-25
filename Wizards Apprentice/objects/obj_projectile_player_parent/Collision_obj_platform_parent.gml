/// @description Destroy on impact

event_inherited()

// Do not destroy if coming in contact with semi solid object
//if(scr_is_solid(x, y) && !place_meeting(x, y, obj_platform_semi_solid_parent))
{
	
	// Destroy self
	instance_destroy()
}