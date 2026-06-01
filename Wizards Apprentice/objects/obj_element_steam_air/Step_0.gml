/// @description Movement


if(!place_meeting(x, y - 1, obj_platform_parent))
{
	// Float upwards if no platform above
	y -= move_spd_v
}