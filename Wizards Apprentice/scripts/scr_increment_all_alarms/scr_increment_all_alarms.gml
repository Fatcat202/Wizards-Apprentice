function scr_increment_all_alarms()
{
	
	// Itterates through all alarms and increments them
	
	with(all)
	{
		// Check if game is paused or if a cutscene is active. If not, exit script
		if(!global.cutscene_active && !global.game_paused && !global.game_esc_paused && !global.game_death_paused && !global.show_inventory) continue;
		
		// Itterate through all alarms
		for(var i = 0; i < 12; i++)
		{
			if(alarm[i] > 0)
			{
				alarm[i] += 1; // Increment alarms
			}
		}
	}
}