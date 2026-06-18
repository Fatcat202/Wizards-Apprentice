function scr_inventory_resume()
{
	
	// States that the inventory is not shown
	global.show_inventory = false;
	
	// Resets end_inventory_pause
	global.end_inventory_pause = false;

	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps);
	
	// Destroy pause image
	layer_destroy("Pause_Sprites")
	
	// Reactivate regular objects
	instance_activate_all();
	
}