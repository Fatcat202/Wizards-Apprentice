/// @description


page_state()

if(!instance_exists(obj_button_spellbook_page))
{
	instance_create_layer(page_button_x, button_spellbook_y, "Menu_Buttons", obj_button_spellbook_page)
}

if(!instance_exists(obj_button_stat_page))
{
	instance_create_layer(page_button_x, button_stats_y, "Menu_Buttons", obj_button_stat_page)
}