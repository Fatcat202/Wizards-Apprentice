/// @description

// Duration of steam
duration = 2

// Defined element for interactions
element = "Steam"

// Set alarm before steam dissipates
alarm_set(0, duration * game_get_speed(gamespeed_fps))

// No movement speed
move_spd_v = 0;
