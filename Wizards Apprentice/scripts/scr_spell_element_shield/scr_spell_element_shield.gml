function scr_spell_element_shield(_element)
{
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit;


	// Check for _element passed through. Apply shield

	if(_element == "Fire")
	{
		element_shield = "Fire";
		active_shield_health = shield_health;		
		is_shielded = true;
		shield_length = game_get_speed(gamespeed_fps) * duration;
	}else
	
	if(_element == "Ice")
	{
		element_shield = "Ice";
		active_shield_health = shield_health;		
		is_shielded = true;
		shield_length = game_get_speed(gamespeed_fps) * duration;
	}else
		
	if(_element == "Water")
	{
		element_shield = "Water";
		active_shield_health = shield_health;
		is_shielded = true;
		shield_length = game_get_speed(gamespeed_fps) * duration;
	}else 
		
	if(_element == "Shock")
	{
		element_shield = "Shock";
		active_shield_health = shield_health;
		is_shielded = true;
		shield_length = game_get_speed(gamespeed_fps) * duration;
	}


	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
	
}