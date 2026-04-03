


// Provides debug messages for health, mana, and drain

function scr_health_and_mana_debug()
{	
	show_debug_message("Max Health = " + string(max_health))
	show_debug_message("Active Health = " + string(active_health))
	show_debug_message("Max Mana = " + string(max_mana))
	show_debug_message("Active Mana = " + string(active_mana))
	show_debug_message("Mana Drain = " + string(mana_drain))
}