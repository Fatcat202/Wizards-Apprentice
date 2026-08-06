/// @description


page_state()

if(!instance_exists(obj_button_shop_dialogue_page))
{
	instance_create_layer(page_x, button_dialogue_y, "Menu_Buttons", obj_button_shop_dialogue_page)
}

if(!instance_exists(obj_button_shop_shop_page))
{
	instance_create_layer(page_x, button_shop_y, "Menu_Buttons", obj_button_shop_shop_page)
}