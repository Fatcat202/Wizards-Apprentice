/// @description Insert description here
// You can write your code in this editor


// Activate Inventory Pause
if(global.show_inventory = false)
{
	global.show_inventory = true;
		
	scr_inventory_pause()	
		
	if(!instance_exists(obj_menu_level_select))
	{
		instance_create_layer(x, y, "Inventory", obj_menu_level_select)
	}
	
}
