// Used to find spell index in spell scripts when pulling data from spell_data array

function scr_find_spell_index(spell_name)
{
	// Locate position of spell in spell_stats array to assign stats with index
	var spell_index = 0
	
	// Debug
	//show_debug_message("spell_name: " + string(spell_name))
	
	for(var i = 1; i <= global.spell_index_length; i++)
	{
		if (spell_name == string(global.arr_spell_index_name[i]))
		{
			spell_index = i;
			
			return spell_index;
		}
	}
	
	// **DEBUG**

	if(spell_index != 0)
	{
		show_debug_message("Spell_index: " + string(spell_index))
	}else show_error("NO SPELL INDEX LOCATED", true)
	
}