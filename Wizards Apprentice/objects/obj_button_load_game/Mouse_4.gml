/// @description Insert description here
// You can write your code in this editor

// Check if main menu controller exists
// Create if it doesn't, if it does then destroy and create again

if(room == rm_main_menu)
{
	if(!instance_exists(obj_main_menu_popup))
	{
		var menu = instance_create_layer(499, 191, "Popup_controller", obj_main_menu_popup)
			menu.state = "load_game"
	} else
	{
		instance_destroy(obj_main_menu_popup)
		var menu = instance_create_layer(499, 191, "Popup_controller", obj_main_menu_popup)
			menu.state = "load_game"
	}
}
