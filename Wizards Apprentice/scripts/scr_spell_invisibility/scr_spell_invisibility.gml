function scr_spell_invisibility()
{
	
	// Pull relevant details for easier to use variables
	scr_pull_spell_data("invisibility")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit
	

	invisible_time = 0;
	invisible_length = game_get_speed(gamespeed_fps) * duration;
	is_invisible = true;
	
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
	
}