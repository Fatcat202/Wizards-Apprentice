
function scr_spell_heal()
{
	// Pull relevant details for easier to use variables
	scr_pull_spell_data("heal")
	var healing = _damage

	
	// Total amount of mana drain
	var drain = healing

	// Checks to make sure the player is not already at max health
	if(active_health == max_health) exit
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	
	// Apply healing ability
	scr_heal(healing)
	
	// Apply mana drain
	scr_mana_drain(drain)
		
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
}