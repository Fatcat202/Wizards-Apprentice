
function scr_spell_heal()
{
	// Find Index in Array
	var spell_index = scr_find_spell_index("heal")
	
	// Pull relevant details for easier to use variables
	var healing = global.spell_stats[spell_index].damage
	var _cooldown = global.spell_stats[spell_index].cooldown
	var _mana = global.spell_stats[spell_index].mana
	
	// Checks to make sure the player is not already at max health
	if(active_health == max_health) exit
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	
	// Apply healing ability
	scr_heal(healing)
		
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
}