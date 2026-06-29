/// @description Alarm Set

event_inherited()

// Set alarm for destruction based on number of sprite animation frames
if(!alarm_get(0)) alarm_set(0, sprite_get_number(sprite_index))