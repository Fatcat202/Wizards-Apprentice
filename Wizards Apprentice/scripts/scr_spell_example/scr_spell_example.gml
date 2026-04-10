
//NOT TO BE USED, TAKING PLACE AS TEMPLATE FOR FUTURE SPELLS


function scr_spell_example()
{

	// Pull relevant details for easier to use variables
	scr_pull_spell_data("example")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	

	/*
	
	
			Place functionality here
			
			
	*/
	
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
	
	
}