function scr_spellbook_resume()
{
	
	// States that the inventory is not shown
	global.show_inventory = false;

	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps);
	
	// Destroy pause image
//	layer_destroy("Pause_Sprites")
	
	// Reactivate regular objects
	instance_activate_all();
	
	if(instance_exists(obj_study_menu)) instance_destroy(obj_study_menu);
}