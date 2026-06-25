
function scr_update_player_stats()
{
	// Apply updates to player stats to ensure accuracy
	
	with(obj_player_parent)
	{
		// XP to next level
		global.player_xp_next_level = (global.player_level+global.player_free_level) * 1000;
		
		// Memory
		memory = global.memory;
		
		// Move speed
		move_spd_max_default = 3.9 + (global.dexterity * 0.1);
		move_spd_max = move_spd_max_default;
		
		 // Jump speed
		jump_speed = 5.4 + (global.dexterity * 0.1);
		term_vel = -(jump_speed + 2)
		
		// Health
		base_max_health = 1 + global.vitality;
		max_health = base_max_health;
		active_health = max_health;
		
		// Mana
		base_max_mana = 1 + global.intelligence
		max_mana = base_max_mana;
		active_mana = max_mana;
	}
}