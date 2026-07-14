/// @description Death

if(active_health <= 0)
{
	// Grant player with xp
	global.player_earned_xp += global.enemy_stats[index].xp
	
	instance_destroy()
}