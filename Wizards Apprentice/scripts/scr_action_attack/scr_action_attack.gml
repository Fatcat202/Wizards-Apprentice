// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_attack()
{
	show_debug_message("Action: Attack")
	
	
	// Attack has been triggered. Enemy is to select between available attacks, then make said attack
	// Posssible attacks should be listed in child object of specific caster in array
	// Attacks should be randomly selected, possibility of adding weights
	
	
	
	// Gather number of attacks
	var num_attacks = array_length(arr_possible_attacks)
	// Select between attacks randomly
	var rand_attack = irandom(num_attacks-1)
			
	// Run enemy specific attack script
	var attack = arr_possible_attacks[rand_attack].attack_scr
//	show_debug_message(string(attack))
	if(attack != -1) attack()
	
	
}