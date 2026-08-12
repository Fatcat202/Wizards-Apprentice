/// @description States and Variables


spacer = 12


page_x = global.cam_target_x + (global.res_w/2)

// Width, height, and location of menu select box
inv_x = page_x - 315
inv_y = global.cam_target_y + (global.res_h/2) + 42
inv_width = sprite_get_width(spr_button_dialogue_page) + (spacer*2)
inv_height = ((sprite_get_height(spr_button_dialogue_page)*2) + (spacer*3))
	
button_x = inv_x + (sprite_get_width(spr_button_dialogue_page)/2) + spacer
button_dialogue_y = inv_y + sprite_get_height(spr_button_dialogue_page)/2 - spacer + 25
button_spell_learn_y = button_dialogue_y + (sprite_get_height(spr_button_dialogue_page)) + spacer



page_dialogue = function()
{
	
	// Destroy spell learning objects
	if(instance_exists(obj_menu_spell_learning)) instance_destroy(obj_menu_spell_learning)
	if(instance_exists(obj_inventory_player_spell_learning)) instance_destroy(obj_inventory_player_spell_learning)

	
	// Create Dialogue
	if(!instance_exists(obj_dialogue_wizard))
	{
		instance_create_layer(x, y, "Inventory", obj_dialogue_wizard)
	}
	
}


page_spell_learn = function()
{
	
	// Destroy dialogue object
	if(instance_exists(obj_dialogue_wizard)) instance_destroy(obj_dialogue_wizard)
	

	if(!instance_exists(obj_menu_spell_learning))
	{
		instance_create_layer(x, y, "Inventory", obj_menu_spell_learning)
	}
	if(!instance_exists(obj_inventory_player_spell_learning))
	{
		instance_create_layer(x, y, "Inventory", obj_inventory_player_spell_learning)
	}

	
}

page_state = page_dialogue



