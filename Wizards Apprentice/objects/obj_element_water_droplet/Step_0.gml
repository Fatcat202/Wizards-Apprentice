/// @description Gravity

// Increment gravity
move_spd_v -= global.grav;

// Set max speed of droplet
if(move_spd_v > move_spd_max) move_spd_v = move_spd_max

// Move object
y -= move_spd_v


// Swap between sprites if charged
if(is_charged == false)
{
	sprite_index = spr_element_water_droplet;
}else

if(is_charged == true)
{
	sprite_index = spr_element_water_droplet_charged;
}