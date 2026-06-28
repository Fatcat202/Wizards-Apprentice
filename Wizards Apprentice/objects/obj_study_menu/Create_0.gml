/// @description Insert description here
// You can write your code in this editor



page_spellbook = function()
{
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



}

// Start on stats page
page_state = page_spellbook;