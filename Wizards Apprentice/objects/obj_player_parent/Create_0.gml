

#region Loading instance stats

/*
	// Health
	max_hp = global.player_stats[index].dice_hp + global.player_stats[index].hp_mod;
	active_health = max_hp;

	// Armor
	max_armor = global.player_stats[index].dice_armor;
	active_armor = max_armor;
*/


	// Speed
	move_spd = 5;
	jump_speed = -6;
	collision_speed = move_spd + global.collision_distance;
	y_speed = 0;
	
	// Gravity
	grav = 0.275
	
	//Terminal Velocity
	term_vel = move_spd
	
	


#endregion