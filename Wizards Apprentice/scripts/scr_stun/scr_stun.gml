function scr_stun(_stun_time = stun_time)
{
	// Briefly stun character with electricity
	// Default to game wide default stun length
	
	is_stunned = true;
	stun_length = game_get_speed(gamespeed_fps) * _stun_time;
	
}