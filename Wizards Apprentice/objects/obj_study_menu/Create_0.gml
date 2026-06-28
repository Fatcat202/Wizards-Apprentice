/// @description

spacer = 12

page_button_x = global.cam_target_x + (global.res_w/2) - 225

button_spellbook_y = global.cam_target_y + (global.res_h/2 - sprite_get_height(spr_button_spellbook_page)/2) - 25
button_stats_y = button_spellbook_y + (sprite_get_height(spr_button_spellbook_page)) + spacer

inv_width = sprite_get_width(spr_button_spellbook_page) + (spacer*2)
inv_height = ((sprite_get_height(spr_button_spellbook_page)*2) + (spacer*3))

inv_x = page_button_x - (sprite_get_width(spr_button_spellbook_page)/2) - spacer
inv_y = button_spellbook_y - sprite_get_height(spr_button_spellbook_page)/2 - spacer

page_spellbook = function()
{
	
	if(instance_exists(obj_study_stats)) instance_destroy(obj_study_stats)
	
	// Create spellbook and active spells
	if(!instance_exists(obj_study_spellbook))
	{
		instance_create_layer(x, y, "Inventory", obj_study_spellbook)
	}
	
	if(!instance_exists(obj_study_active_spells))
	{
		instance_create_layer(x, y, "Inventory", obj_study_active_spells)
	}
}


page_stats = function()
{
	// Destroy spellbook objects
	if(instance_exists(obj_study_spellbook)) instance_destroy(obj_study_spellbook)
	if(instance_exists(obj_study_active_spells)) instance_destroy(obj_study_active_spells)
	
	
	if(!instance_exists(obj_study_stats))
	{
		instance_create_layer(x, y, "Inventory", obj_study_stats)
	}


}

// Start on stats page
page_state = page_stats;