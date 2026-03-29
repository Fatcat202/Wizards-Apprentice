
// Checks what spell slot is selected for the purposes of activating correct cooldown

function scr_set_spell_cooldown(_cooldown)
{
	// Sets cooldown to function in seconds
	_cooldown = _cooldown * 60
	
	switch(active_spell)
	{
		case 1:

			// Set up attack cooldown
			spell_cooldown_1 = true;
			spell_cooldown_time_1 = _cooldown;

		break;

		case 2:

			// Set up attack cooldown
			spell_cooldown_2 = true;
			spell_cooldown_time_2 = _cooldown;
					
		break;

		case 3:

			// Set up attack cooldown
			spell_cooldown_3 = true;
			spell_cooldown_time_3 = _cooldown;
					
		break;
				
		case 4:

			// Set up attack cooldown
			spell_cooldown_4 = true;
			spell_cooldown_time_4 = _cooldown;
					
		break;
				
		case 5:

			// Set up attack cooldown
			spell_cooldown_5 = true;
			spell_cooldown_time_5 = _cooldown;
					
		break;
				
		case 6:

			// Set up attack cooldown
			spell_cooldown_6 = true;
			spell_cooldown_time_6 = _cooldown;
					
		break;
				
		case 7:

			// Set up attack cooldown
			spell_cooldown_7 = true;
			spell_cooldown_time_7 = _cooldown;
					
		break;
				
		case 8:

			// Set up attack cooldown
			spell_cooldown_8 = true;
			spell_cooldown_time_8 = _cooldown;
					
		break;

		case 9:

			// Set up attack cooldown
			spell_cooldown_9 = true;
			spell_cooldown_time_9 = _cooldown;
					
		break;
				
		case 10:

			// Set up attack cooldown
			spell_cooldown_10 = true;
			spell_cooldown_time_10 = _cooldown;
					
		break;
	}
}