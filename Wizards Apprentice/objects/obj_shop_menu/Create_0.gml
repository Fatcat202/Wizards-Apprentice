/// @description

spacer = 12


page_x = global.cam_target_x + (global.res_w/2)

// Width, height, and location of menu select box
inv_x = page_x - (sprite_get_width(spr_button_dialogue_page)/2) - spacer
inv_y = global.cam_target_y + (global.res_h/2) - 55
inv_width = sprite_get_width(spr_button_dialogue_page) + (spacer*2)
inv_height = ((sprite_get_height(spr_button_dialogue_page)*2) + (spacer*3))
	
button_dialogue_y = inv_y + sprite_get_height(spr_button_dialogue_page)/2 - spacer + 25
button_shop_y = button_dialogue_y + (sprite_get_height(spr_button_dialogue_page)) + spacer

page_dialogue = function()
{
	// Destroy shop inventory objects
	if(instance_exists(obj_inventory_player_shop)) instance_destroy(obj_inventory_player_shop)
	if(instance_exists(obj_inventory_shop)) instance_destroy(obj_inventory_shop)
	
	// Create Dialogue
	if(!instance_exists(obj_dialogue_shop))
	{
		instance_create_layer(x, y, "Inventory", obj_dialogue_shop)
	}

}


page_shop = function()
{

	// Destroy dialogue object
	if(instance_exists(obj_dialogue_shop)) instance_destroy(obj_dialogue_shop)
	
	// Create Inventory Objects
	if(!instance_exists(obj_inventory_player_shop))
	{
		instance_create_layer(x, y, "Inventory", obj_inventory_player_shop)
	}
	if(!instance_exists(obj_inventory_shop))
	{
		instance_create_layer(x, y, "Inventory", obj_inventory_shop)
	}


}

// Start on dialogue page
page_state = page_dialogue;