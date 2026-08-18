/// @description Buttons

// If menu is fully displayed, create buttons
if(alpha >= 1)
{

	if(!instance_exists(obj_button_death_reload_save))
	{
		instance_create_layer(x_pos_reload, y_pos_reload, "Menu_Buttons", obj_button_death_reload_save)
	}

	if(!instance_exists(obj_button_death_main_menu))
	{
		instance_create_layer(x_pos_main_menu, y_pos_main_menu, "Menu_Buttons", obj_button_death_main_menu)
	}
}