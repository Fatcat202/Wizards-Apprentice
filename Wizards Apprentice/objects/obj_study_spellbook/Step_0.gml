/// @description Update Spellbook


global.spellbook = inventory

// Update spell timers 
// Place structs into array
for(var i = 1; i <= global.max_spell_slots; i++)
{
	if(global.active_spells[0,i] != -1)
	{
		global.arr_spell_timers[i] = new con_spell_timers(false, 0 , global.active_spells[0,i].cooldown)
	}
		
	if(global.active_spells[0,i] == -1) global.arr_spell_timers[i] = -1
}


scr_memory_used()
