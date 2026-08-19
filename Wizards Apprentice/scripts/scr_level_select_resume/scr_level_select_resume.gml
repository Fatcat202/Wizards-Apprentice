// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_level_select_resume()
{
	
	// States that the inventory is not shown
	global.show_inventory = false;

	// Makes sure game speed is set to 60 to prevent issues
	game_set_speed(60, gamespeed_fps);
	
	layer_destroy_instances("Inventory");
	
	// Reactivate regular objects
	instance_activate_all();
	
	if(instance_exists(obj_menu_level_select)) instance_destroy(obj_menu_level_select)
	
	global.pause_image = -1
	
}