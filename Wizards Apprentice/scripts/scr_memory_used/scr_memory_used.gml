function scr_memory_used()
{
	var count = 0;
	for(var i = 1; i < global.max_spell_slots+1; i++)
	{

		if(global.active_spells[0, i] != -1)
		{
			count += global.active_spells[0, i].memory;	
		}
	}
	global.memory_used = count;
}