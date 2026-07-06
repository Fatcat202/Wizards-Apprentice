function scr_esc_resume()
{

	// States that the game not esc paused
	global.game_esc_paused = false;
	
	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps);

	// Destroy pause image
//	layer_destroy("Pause_Sprites")
	
	// Reactivate regular objects
	instance_activate_all();

}