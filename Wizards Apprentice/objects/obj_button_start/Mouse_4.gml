/// @description Start Game


with(menu_id)
{
	if(temp_free_level == 0)
	{
		layer_destroy_instances("Menu_Buttons")
		
		state = "make_save_slot"
		
		// Clear and set both active spells and spellbook
	//	global.active_spells = []
	//	global.spellbook = []
		global.active_spells[0,1] = starting_spell
		global.spellbook[1,0] = starting_spell
		
		
		
		instance_destroy(obj_button_start)
	}
}
