/// @description Death

if(active_health <= 0)
{
	// Grant player with xp
	global.player_xp += global.enemy_stats[index].xp
	
	scr_player_level_up_check()
	
	instance_destroy()
}