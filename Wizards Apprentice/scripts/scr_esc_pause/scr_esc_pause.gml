function scr_esc_pause()
{
	// Set game esc pause to true
	global.game_esc_paused = true;
	
	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps)
	
	// "Pause" alarms by increasing them incrementally
	scr_increment_all_alarms();
	
	// Pauses all particle systems
	scr_part_systems_set_auto_update();
	
	// Set pause image
	scr_pause_image()
	
	
	// Deactivate all objects except game_manger
	instance_deactivate_object(all);
	instance_activate_object(game_manager)
	instance_activate_object(obj_mouse)
		
}