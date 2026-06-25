function scr_spellbook_pause()
{
	// Create Study Menu
	if(!instance_exists(obj_study_menu))
	{
		instance_create_layer(x, y, "Inventory", obj_study_menu)
	}
	
	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps)
	
	// "Pause" alarms by increasing them incrementally
	scr_increment_all_alarms();
	
	// Pauses all particle systems
	scr_part_systems_set_auto_update();
	
	global.show_inventory = true;

	// Set pause image
//	scr_pause_image()


	// Deactivate all but those needed
	instance_deactivate_object(all);
	instance_activate_object(game_manager);
	instance_activate_object(obj_study_menu)
	instance_activate_object(obj_mouse)
}