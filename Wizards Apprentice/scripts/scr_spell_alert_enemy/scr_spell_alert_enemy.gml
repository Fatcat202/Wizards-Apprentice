// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spell_alert_enemy(enemy_id = other.id)
{
	// Causes an enemy to become alerted to the players presence, targeting them directly
	
	enemy_id.target_x = obj_player_parent.x
	enemy_id.target_y = obj_player_parent.y
	enemy_id.player_visible = true;
	enemy_id.state_behavior = enemy_id.state_attack
	
}