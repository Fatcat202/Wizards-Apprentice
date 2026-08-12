/// @description Create Buttons and Run State



page_state()

if(!instance_exists(obj_button_wizard_dialogue_page))
{
	instance_create_layer(button_x, button_dialogue_y, "Menu_Buttons", obj_button_wizard_dialogue_page)
}

if(!instance_exists(obj_button_wizard_spell_learn_page))
{
	instance_create_layer(button_x, button_spell_learn_y, "Menu_Buttons", obj_button_wizard_spell_learn_page)
}