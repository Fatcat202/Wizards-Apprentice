// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gather_enemy_attack_stats(attack_name)
{
	attack_index = scr_find_enemy_attack_index(string(attack_name))
	
	
	damage = global.enemy_attack_stats[attack_index].damage
	water_level = global.enemy_attack_stats[attack_index].water_level
	oil_level = global.enemy_attack_stats[attack_index].oil_level
	is_ice = global.enemy_attack_stats[attack_index].is_ice
	is_flaming = global.enemy_attack_stats[attack_index].is_flaming
	is_steaming = global.enemy_attack_stats[attack_index].is_steaming
	is_charged = global.enemy_attack_stats[attack_index].is_charged
	atk_spd = global.enemy_attack_stats[attack_index].atk_spd
	atk_range = global.enemy_attack_stats[attack_index].atk_range
	duration = global.enemy_attack_stats[attack_index].duration
	level = global.enemy_attack_stats[attack_index].level
	attack_scr = global.enemy_attack_stats[attack_index].attack_scr
	sprite = global.enemy_attack_stats[attack_index].sprite
	is_visible = global.enemy_attack_stats[attack_index].is_visible
	move_spd = global.enemy_attack_stats[attack_index].move_spd
}