// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_possible_attack(attack)
{
	// Adds to arr_possible_attacks another attack the enemy can make
	// Must pass through attack name as string in arg
	// Must call individually in create event of enemy object
	
	// Find index
	var index = scr_find_enemy_attack_index(attack)
	
	// Add to array
	array_push(arr_possible_attacks, global.enemy_attack_stats[index])
	
}