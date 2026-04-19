/// @description Gravity

// Increment gravity
move_spd_v -= global.grav;

// Set max speed of droplet
if(move_spd_v > move_spd_max) move_spd_v = move_spd_max

// Move object
y -= move_spd_v