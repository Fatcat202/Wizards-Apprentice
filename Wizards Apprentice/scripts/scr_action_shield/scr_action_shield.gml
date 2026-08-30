// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_shield()
{
//	show_debug_message("Action: Shield")
	
	
	function func_apply_shield()
	{
		arr_possible_shields = ["Fire", "Water", "Ice", "Shock", "Steam"]

		// Random position based on number of possible elements
		var rand = irandom(array_length(arr_possible_shields)-1)
		
		// Element selected
		var element = arr_possible_shields[rand]
		show_debug_message("Element Selected: " + string(element))
		
		// Apply shield
		element_shield = element;
		active_shield_health = shield_health;
		
		// Set action_taken to start cooldown
		action_taken = true;
		action_timer = 0;
		
	}

	// Range shield can be placed onto ally
	var shield_range = vision_range
	
	
	// Apply element shield to self
	if(element_shield == "Empty")
	{
		func_apply_shield()
		
	}else
	
	// Apply shield to ally if self already has shield
	if(element_shield != "Empty")
	{
		// Create DS list holding all allies within range, excluding self, and sorted by distance
		ds_near_allies = ds_list_create();
		var num_near = collision_circle_list(x, y, shield_range, obj_enemy_parent, false, true, ds_near_allies, true)
		
		// Check allies in order of distance
		for(var i = 0; i < num_near; i++)
		{
			// Check for empty shield and direct line of sight
			if(ds_near_allies[| i].element_shield == "Empty" && !collision_line(x, y,ds_near_allies[| i].y, ds_near_allies[| i].y, obj_platform_solid_parent, true, true ))
			{
				// Apply shield to ally
				with(ds_near_allies[| i])
				{
					func_apply_shield()
					
				}
				break;
			}
		}
		
		// Set action_taken to start cooldown
		action_taken = true;
		action_timer = 0;
		
		// Memory management
		ds_list_destroy(ds_near_allies)
		
	}
}