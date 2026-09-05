/// @description Create Button


if(!instance_exists(obj_button_message_exit))
{
	var _button = instance_create_layer(button_x, button_y, "Menu_Buttons", obj_button_message_exit)
		_button.button_text = button_text;
}

