
// Checks what spell slot is selected for the purposes of activating correct cooldown
// May pass through active_spell if not activated directly by spell script

function scr_set_spell_cooldown(_cooldown, spell_slot = active_spell)
{
	// Sets cooldown to function in seconds
	_cooldown = _cooldown * 60;
	
	global.arr_spell_timers[spell_slot].cooldown = true;
	global.arr_spell_timers[spell_slot].length = _cooldown;

}