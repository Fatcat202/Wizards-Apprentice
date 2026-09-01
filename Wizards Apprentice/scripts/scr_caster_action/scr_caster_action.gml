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
		arr_options[ACTIONS.TELEPORT_AWAY] = {name : "Teleport Away",action : scr_action_teleport_away, weight : 0.0}
		
	#endregion Setting Possible Actions
	
	
	#region Modify Weights
		
		// DS list holding all nearby allies
		 allies_near = ds_list_create()
		 num_allies = collision_circle_list(x, y, vision_range, obj_enemy_parent, false, true, allies_near, true)
		
		// Distance to the player
		 dis_to_player = point_distance(x, y, obj_player_parent.x, obj_player_parent.y)
		
		// Used to track number of allies near without shields
		num_unshielded = 0
		 
		// Used to track number of melee, non flying, non casting allies near
		num_melee = 0;
		
		// Array holding melee allies near
		arr_melee_allies = []
		

		// Weight Variables
			// Decrease attack based on number of unshielded allies
			var mod_num_unshielded = 0.1
		
		
			
		#region If all allies and self have shield applied, set weight to 0
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
		#endregion If all allies and self have shield applied, set weight to 0
		
		#region If player is not visible, deactivate actions
		
			if(player_visible == false)
			{
				arr_options[ACTIONS.ATTACK].weight *= 0;
				arr_options[ACTIONS.TELEPORT_ALLY].weight *= 0;
				arr_options[ACTIONS.TELEPORT_AWAY].weight *= 0;
			}else
		
		#endregion If player is not visible, deactivate actions
		
		#region If player is visible, modify available weights
			if(player_visible == true)
			{

				#region Increase teleport_away when health is low and player is closer than min range
					if(dis_to_player < min_range)
					{
						// Find distance between player and self, turn to decimal
						var mod_distance = (((min_range/dis_to_player)-1)/10)
				
						// Find percentage of missing health, use as a multiplier
						var mod_missing_health = ((max_health - active_health))+1
				
						// Modify weight
						arr_options[ACTIONS.TELEPORT_AWAY].weight += (mod_distance * mod_missing_health)
				
					}
				#endregion Increase teleport_away when health is low and player is closer than min range
			
			
		
				#region Increase teleport_ally when a ground melee ally is near and the player is getting closer
					if(dis_to_player < min_range)
					{
						for(var i = 0; i < num_allies; i++)
						{
							// Track number of melee, non flying, non caster allies near
							if(allies_near[| i].is_melee && !allies_near[| i].flies && !allies_near[| i].caster)
							{
								array_push(arr_melee_allies, allies_near[| i])
								num_melee++;
							}
						}
				

						// Check if any melee enemies are near
						if(num_melee > 0)
						{
							var dis_to_ally = point_distance(x, y, arr_melee_allies[0].x, arr_melee_allies[0].y)
					
							// If player is closer than ally, increase weight
							if(dis_to_player < dis_to_ally)
							{
				
								// Find distance between player and self, turn to decimal
								var mod_distance = (((min_range/dis_to_player)-1)) * 1.5;
				
								// Modify weight
								arr_options[ACTIONS.TELEPORT_ALLY].weight += (mod_distance)
							}else
							{
								// If the player is further than the closest ally, set weight to 0
								arr_options[ACTIONS.TELEPORT_ALLY].weight *=0;
							}
						}
					}
				#endregion Increase teleport_ally when a ground melee ally is near and the player is getting closer
			

			
				#region Decrease attack with more unshielded allies near
					if(num_allies != 0)
					{
						if(num_unshielded != 0)
						{
							arr_options[ACTIONS.ATTACK].weight -= (num_unshielded * mod_num_unshielded)
						}
					}
				#endregion Decrease attack with more unshielded allies near
			
			}
		#endregion If player is visible, modify available weights
		

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