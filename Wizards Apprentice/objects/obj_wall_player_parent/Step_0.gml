/// @description Platform Elements

// Inherit the parent event
event_inherited();

if(place_meeting(x, y + 1, obj_platform_parent))
{
	var other_id = instance_place(x, y + 1, obj_platform_parent)

	scr_element_platform_interactions(id, other_id)
}


// Destroys wall after set duration
if(!alarm_get(0)) alarm_set(0, game_get_speed(gamespeed_fps) * duration);