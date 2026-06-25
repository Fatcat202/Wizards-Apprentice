// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_level_up_check()
{
	// Check variables each step to check for player level up, providing free level and updating stats when true
	
	/*
	show_debug_message("XP: " + string(global.player_xp))
	show_debug_message("XP to Next: " + string(global.player_xp_next_level))
	show_debug_message("Player Level: " + string(global.player_level))
	show_debug_message("Player Free Level: " + string(global.player_free_level))
	*/
		
	if(global.player_xp >= global.player_xp_next_level)
	{
		// Increase number of available levels
		global.player_free_level++;  
		
		// Refresh player stats
		scr_update_player_stats();
		
	}
}