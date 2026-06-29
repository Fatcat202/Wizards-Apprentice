// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_find_enemy_attack_index(attack_name)
{

	// Locate position of attack in attack_stats array to assign stats with index
	var attack_index = 0
	
	// Debug
	//show_debug_message("attack_name: " + string(attack_name))
	
	for(var i = 1; i <= global.enemy_attack_index_length; i++)
	{
		if (attack_name == string(global.arr_enemy_attack_index_name[i]))
		{
			attack_index = i;
			
			return attack_index;
		}
	}
	
	// **DEBUG**

	if(attack_index != 0)
	{
		//show_debug_message("attack_index: " + string(attack_index))
	}else show_error("NO ENEMY ATTACK INDEX LOCATED", true)
	

}