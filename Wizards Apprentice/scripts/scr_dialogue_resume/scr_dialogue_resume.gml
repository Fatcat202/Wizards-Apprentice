function scr_dialogue_resume()
{
	
	// States that the inventory is not shown
	global.show_inventory = false;

	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps);
	
	layer_destroy_instances("Inventory");
	
	// Reactivate regular objects
	instance_activate_all();
	
	if(instance_exists(obj_dialogue_parent)) instance_destroy(obj_dialogue_parent)
	
}