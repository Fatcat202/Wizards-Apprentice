/// @description

// Duration of steam in seconds
duration = 5

// Defined element for interactions
element = "Steam"

// Set alarm before steam dissipates
alarm_set(0, duration * game_get_speed(gamespeed_fps))

// Movement speed floating upwards
move_spd_v = 0.25;
