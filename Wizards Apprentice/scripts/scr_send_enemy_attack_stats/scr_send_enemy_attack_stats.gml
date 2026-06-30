// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_enemy_attack_stats(attack_var)
{
	// Pass through attack object name
	// Send struct variables to attack object
	
	attack_var.damage = damage;
	attack_var.atk_spd = atk_spd;
	attack_var.atk_range = atk_range;
	attack_var.duration = duration;
	attack_var.level = level;
	attack_var.element = element;
	attack_var.attack_scr = attack_scr;
	attack_var.sprite = sprite;
	attack_var.sprite_index = sprite;
	attack_var.visible = is_visible;
	
}