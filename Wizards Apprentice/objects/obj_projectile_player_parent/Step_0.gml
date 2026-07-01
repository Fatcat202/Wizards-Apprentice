/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


// Destroys projectile after set duration

if(!alarm_get(0)) alarm_set(0, game_get_speed(gamespeed_fps) * duration)
