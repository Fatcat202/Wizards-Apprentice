/// @description


// Pass through next_room when creating object

// Transition time in seconds
duration = game_get_speed(gamespeed_fps) * 1

timer = 0
state = 0
alpha = 0

// Delaying timer to delay fade back in when entering room
delaying = false;

delaying_time = game_get_speed(gamespeed_fps) * 1;
delaying_timer = 0;

target_instance = -1

