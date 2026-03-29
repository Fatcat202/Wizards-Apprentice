
//NOT TO BE USED, TAKING PLACE AS TEMPLATE FOR FUTURE SPELLS


function scr_spell_example()
{
	// Find index in array using name of spell
	var spell_index = scr_find_spell_index("example")
	
	// Pull relevant details for easier to use variables
	var damage = global.spell_stats[spell_index].damage
	var _cooldown = global.spell_stats[spell_index].cooldown
	var _mana = global.spell_stats[spell_index].mana
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	

	/*
	
	
			Place functionality here
			
			
	*/
	
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
	
	
}