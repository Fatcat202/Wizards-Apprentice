function scr_freeze(can_freeze)
{
	// Lock character in ice. 
	// Treat effect as ice element. 
	// Prevent damage, but doing a set amount of damage ends effect.
	// Lasts longer than stun
	// Instantly stop movement
	
	can_move = false;
	can_attack = false;
	freeze_timer = 0;
	freeze_length = game_get_speed(gamespeed_fps) * can_freeze
	is_frozen = true;
	
}