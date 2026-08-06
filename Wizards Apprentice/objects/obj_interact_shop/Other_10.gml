/// @description Insert description here
// You can write your code in this editor



if(global.cont_interact) scr_shop_pause()




/*
// Prevent inventory pausing
if(!global.game_paused)
{
	// Activate Inventory Pause
	if(global.show_inventory = false)
	{
		global.show_inventory = true;
		
		scr_inventory_pause()
		
		// Create Inventory Menu object
		instance_create_layer(0, 0, "Inventory", obj_inventory_player_shop);
		instance_create_layer(0, 0, "Inventory", obj_inventory_shop);

	}
}