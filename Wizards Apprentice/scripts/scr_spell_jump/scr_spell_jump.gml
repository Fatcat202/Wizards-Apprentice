
// Allow for the player to double jump

function scr_spell_jump()
{
	scr_pull_spell_data("jump")

	// Pull relevant details for easier to use variables
	var num_jumps = global.spell_stats[spell_index].uses
	var _mana = global.spell_stats[spell_index].mana
	// Set duration in seconds
	var duration = global.spell_stats[spell_index].duration * 60;
	
	// Prevent use if duration is not up
	if(spell_jump_active = true) exit;
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	
	
	//Use active_spell to declare spell slot used to pass through cooldown once duration finishes
	spell_jump_slot = active_spell;
	
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
	

}