/// @description

// Duration of steam
duration = 8

// Defined element for interactions
element = "Steam"

// Set alarm before steam dissipates
alarm_set(0, duration * game_get_speed(gamespeed_fps))
