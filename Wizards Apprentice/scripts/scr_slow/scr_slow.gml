function scr_slow(_slow_time = slow_time)
{
	
	// Rest any changes
	scr_reset_move_modifiers();
	is_slowed = true;
	slow_length = game_get_speed(gamespeed_fps) * _slow_time;
	
	var spd_mod = plat_spd_oil
	
	// Change acceleration/deceleration
	h_acel = h_acel_default * spd_mod;
	h_decel = h_decel_default * spd_mod;
	// Change max move speed
	move_spd_max = move_spd_max_default * spd_mod;

}