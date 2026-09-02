/// @description Destruction Timer

// Inherit the parent event
event_inherited();


if(!alarm_get(0)) alarm_set(0, game_get_speed(gamespeed_fps) * duration)
