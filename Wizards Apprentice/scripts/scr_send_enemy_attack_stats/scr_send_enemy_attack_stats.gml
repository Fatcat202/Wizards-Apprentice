// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_enemy_attack_stats(attack_var)
{
	// Pass through attack object name
	// Send struct variables to attack object
	
	attack_var.enemy_object = object_index;
	
	attack_var.damage = damage;
	attack_var.water_level = water_level
	attack_var.oil_level = oil_level
	attack_var.is_ice = is_ice
	attack_var.is_flaming = is_flaming
	attack_var.is_steaming = is_steaming
	attack_var.is_charged = is_charged
	attack_var.atk_spd = atk_spd;
	attack_var.atk_range = atk_range;
	attack_var.duration = duration;
	attack_var.level = level;
	attack_var.attack_scr = attack_scr;
	attack_var.sprite = sprite;
	attack_var.sprite_index = sprite;
	attack_var.visible = is_visible;
	attack_var.move_spd = move_spd;
	
}