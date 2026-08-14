
function scr_use_mana(mana)
{	
	// Used for both checking if there is enough mana to use a spell, then subtract mana for spell usage
	
	// If there is enough mana to use spell
	if(active_mana - mana >= 0)
	{
		active_mana -= mana;
		
		// Prevent mana from going under 0
		if(active_mana < 0) active_mana = 0;
		
		// Reset mana regen if mana is used
		if(mana > 0)
		{
			mana_regen_timer = 0;
			mana_regen_delay_timer = 0;
		}
		
		return true
	}else return false
}