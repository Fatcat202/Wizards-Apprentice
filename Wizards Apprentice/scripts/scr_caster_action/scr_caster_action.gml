// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_caster_action()
{
	// Allows for the caster to take "actions", a variety of abilities that can be selected between
	// These can include attacking, teleporting, creating shields, etc.
	

	// Functions by allowing weights to be applied to potential actions, then have action take place based on weights
	
	
	
	#region Action Timer
		
		// Start timer if action has been taken
		if(action_taken == true)
		{
			// If length is not reached, increment timer and exit script early
			if(action_timer >= action_length)
			{
				// Reset action_taken
				action_taken = false;
				action_timer = 0;	
			}else
			{
				action_timer++
				exit;
			}
		}

		
	#endregion Action Timer
	
	#region Setting Possible Actions
	
		// Positions of actions in arr_options
		enum ACTIONS
		{
			ATTACK,
			SHIELD,
			TELEPORT_ALLY,
			TELEPORT_AWAY
		}
	
		// Store actions as struct in array, allowing for easy modification of weights and calling of scripts
		arr_options[ACTIONS.ATTACK] = {name : "Attack", action : scr_action_attack, weight : 0.9}
		arr_options[ACTIONS.SHIELD] = {name : "Shield",action : scr_action_shield, weight : 0.6}
		arr_options[ACTIONS.TELEPORT_ALLY] = {name : "Teleport Ally",action : scr_action_teleport_ally, weight : 0.3}
		arr_options[ACTIONS.TELEPORT_AWAY] = {name : "Teleport Away",action : scr_action_teleport_away, weight : 0.1}
		
	#endregion Setting Possible Actions
	
	
	#region Modify Weights
		
		// DS list holding all nearby allies
		var allies_near = ds_list_create()
		var num_allies = collision_circle_list(x, y, vision_range, obj_enemy_parent, false, true, allies_near, true)
		
		// Used to track number of allies near without shields
		var num_unshielded = 0
		
			
		// If all allies and self have shield applied, set weight to 0
		if(element_shield != "Empty")
		{
		//	show_debug_message("allies_near: " + string(allies_near))
		//	show_debug_message("num_allies: " + string(num_allies))
		
			// Determines if any allies without shield are near
			var can_apply_shield = false
			if(num_allies != 0)
			{
				for(var i = 0; i < num_allies; i++)
				{
					if(allies_near[| i].element_shield == "Empty")
					{
						can_apply_shield = true;
						
						// Track number of unshielded allies near
						num_unshielded++
					}
				}
			}
			
			// Set weight if no shield can be applied
			if(can_apply_shield == false)
			{
				arr_options[ACTIONS.SHIELD].weight *= 0
			}
			
		}
		
		
		// If player is not visible, deactivate actions
		if(player_visible == false)
		{
			arr_options[ACTIONS.ATTACK].weight *= 0;
			arr_options[ACTIONS.TELEPORT_ALLY].weight *= 0;
			arr_options[ACTIONS.TELEPORT_AWAY].weight *= 0;
		}else
		
		// If player is visible, modify available weights
		if(player_visible == true)
		{

			// TO DO: Increase teleport_away when health is low and player is closer
		
		
			// TO DO: Increase teleport_ally when a ground melee ally is near and the player is getting closer
		
		
			// Decrease attack with more unshielded allies near
			if(num_allies != 0)
			{
				if(num_unshielded != 0)
				{
					arr_options[ACTIONS.ATTACK].weight -= (num_unshielded/10)
				}
			}
			
		}
		

		// Reset memory
		ds_list_destroy(allies_near)
	#endregion Modify Weights
	
	
	#region Execute
	
		// Select action based on weights
	
		// Holds position of highest in array
		var highest = 0
		for(var i = 0; i < array_length(arr_options); i++)
		{
			if(arr_options[i].weight > arr_options[highest].weight)
			{
				highest = i;
			}
			
			// Weight Debug
			show_debug_message(string(arr_options[i].name) + ": " + string(arr_options[i].weight))
		}
		
		// Check for action to take
		if(arr_options[highest].weight != 0)
		{
			// Execute action
			script_execute(arr_options[highest].action)
		}else
		{
			show_debug_message("No Caster Action To Take")
		}
	
	#endregion Execute
	
}