/// @description

// Duration of steam in seconds
duration = 5

// Defined element for interactions
element = "Steam"

// Set alarm before steam dissipates
alarm_set(0, duration * game_get_speed(gamespeed_fps))

// Movement speed floating upwards
move_spd_v = 0.25;

is_ice = false;
water_level = 1;
oil_level = 0;
is_flaming = false;
is_charged = false;
is_steaming = true;