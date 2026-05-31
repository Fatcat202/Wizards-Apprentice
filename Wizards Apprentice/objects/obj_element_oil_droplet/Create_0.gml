/// @description

// Prevent overwriting if move speed set on creation
if(!variable_instance_exists(id, "move_spd_v"))
{
	// Active move speed of droplet
	move_spd_v = 0;
}

// Prevent overwriting if move speed set on creation
if(!variable_instance_exists(id, "move_spd_h"))
{
	// Active move speed of droplet
	move_spd_h = 0;
}

// Max move speed of droplet
move_spd_max = -6;

// "Level" of droplet, used to determine number of platforms to make oily
level = 1

// Declares element as oil
element = "Oil"


// Declares flames are spawned
flames_spawned = false;

// Used to determine the amount of time oil droplet will burn for if flaming oil, calculated with frames
// Default burn time in seconds
fuel_default = game_get_speed(gamespeed_fps) * 10;

// Prevent overwriting if fuel left set on creation
if(!variable_instance_exists(id, "fuel_left"))
{
	// Number of frames remaining
	fuel_left = fuel_default;
}
// Rate at which fuel will burn, stored in frames.
fuel_burn_rate = 1;
