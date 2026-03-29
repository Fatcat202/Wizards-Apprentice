
// Allow for the player to double jump

function scr_spell_jump()
{
	// Find index in array using name of spell
	var spell_index = scr_find_spell_index("jump")
	
	// Pull relevant details for easier to use variables
	var num_jumps = global.spell_stats[spell_index].uses
	var _cooldown = global.spell_stats[spell_index].cooldown
	var _mana = global.spell_stats[spell_index].mana
	// Set duration in seconds
	var duration = global.spell_stats[spell_index].duration * 60;
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	
	// Increase max number of jumps
	max_jumps += num_jumps;
	
	// Set jumps left to max
	jumps_left = max_jumps;
	
	// Jumps left debug
	//show_debug_message("jumps_left: " + string(jumps_left))
	
	// Set duration timer
	spell_jump_duration = duration
	
	// Activate duration timer
	spell_jump_active = true;
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
}