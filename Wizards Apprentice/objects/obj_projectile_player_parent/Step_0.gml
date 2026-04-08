/// @description Destroy on impact

// Do not destroy if coming in contact with player or semi solid object
if(place_meeting(x, y, obj_collision_parent) 
	&& !place_meeting(x, y, obj_semi_solid) 
	&& !place_meeting(x, y, obj_player_parent))
	{
		instance_destroy()
	}