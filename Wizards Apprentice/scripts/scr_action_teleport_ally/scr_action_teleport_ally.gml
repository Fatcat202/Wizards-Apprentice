// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_teleport_ally()
{
	show_debug_message("Action: Teleport_Ally")
	
	// When player is approaching caster and melee non flier is near, teleport ally between self and player
	

	
	// Search for ally with highest active hp
	var highest_hp = 0;
	for(var i = 0; i < num_melee; i++)
	{
		if(arr_melee_allies[i].active_health > arr_melee_allies[highest_hp].active_health)
		{
			highest_hp = i;
		}
	}
	

	for(var i = 0; i < num_melee; i++)
	{
		// Find width of sprite
		var spr_width = arr_melee_allies[highest_hp].sprite_width
		
		// Check if enemy width is not wider than player
		if(dis_to_player > spr_width)
		{
			// Find mid point between player and caster
			x_average = (x + obj_player_parent.x)/2
			y_average = (y + obj_player_parent.y)/2
			
			// Move ally between player and caster
			arr_melee_allies[highest_hp].x = x_average
			arr_melee_allies[highest_hp].y = y_average
			
			// Exit loop once suitable ally is found
			break;
		}
	}
	
	
	
	
	
}