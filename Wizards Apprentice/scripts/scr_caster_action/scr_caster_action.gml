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
			TELEPORT,
			SHIELD
		}
	
		// Store actions as struct in array, allowing for easy modification of weights and calling of scripts
		arr_options[ACTIONS.ATTACK] = {action : scr_action_attack, weight : 1}
		arr_options[ACTIONS.TELEPORT] = {action : scr_action_teleport, weight : 0.5}
		arr_options[ACTIONS.SHIELD] = {action : scr_action_shield, weight : 0.6}
	#endregion Setting Possible Actions
	
	
	#region Modify Weights
		
		// If player is not visible, do not attack
		if(player_visible == false)
		{
			arr_options[ACTIONS.ATTACK].weight *= 0
		}
		
		
		
		
		
		
		
		
		
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
		}
	
		// Execute action
		script_execute(arr_options[highest].action)
	
	#endregion Execute
	
}