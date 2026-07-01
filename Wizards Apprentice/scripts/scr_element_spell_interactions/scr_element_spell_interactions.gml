
function scr_element_spell_interactions(own_id, other_id)
{
	// Provides the logic for element interactions
	
	// Must provide ID of elements being interacted with
	
	
	// Used for calling other elements variables
		
		// Used for own variables
		var own_level = own_id.level
	
		// Used for calling other elements variables
		var other_level = other_id.level

	
	// Cancel script if either effect has no element
	if(scr_has_no_element(own_id) || scr_has_no_element(other_id)) exit;
	
	
	//show_debug_message("Interaction started")
	
	
	
	#region Ice - Fire = Water
	
		// Check if interaction is Fire + Ice
		if((own_id.is_flaming == true && other_id.is_ice == true) || (own_id.is_ice == true && other_id.is_flaming == true))
		{
			
			var level_difference = abs(own_id.level - other_id.level)
			
			// Create water droplet with the level of the element subtracted
			water_drop = instance_create_layer(x, y, "Spells", obj_element_water_droplet,
			{
				level : level_difference
			})

			
			// Lower level of both objects by the others level
			own_id.level -= other_level
			other_id.level -= own_level
			
		}
		
	#endregion Ice - Fire = Water
	
	#region Water - Fire = Steam
	
		// Check if interaction is Water - Fire
		if((own_id.is_flaming == true && other_id.water_level > 0) || (own_id.water_level > 0 && other_id.is_flaming == true))
		{
		
			/*
				Subtract water from fire
				Destroy which ever has its level lowered to 0
				Any remaining element has level permenantly lowered
			*/
		
			/*
				Create steam from amount removed from fire
				Max level of steam is level of fire
			*/
			
			
			var level_diff = abs(own_id.level - other_id.level)
			
			for(var i = 0; i < level_diff; i++)
			{
				var rand_x, rand_y
				var rand_dis = 50
				
				rand_x = x + irandom_range(-rand_dis, rand_dis)
				rand_y = y + irandom_range(-rand_dis, rand_dis)
				
				while(place_meeting(rand_x, rand_y, obj_platform_solid_parent) == true)
				{
					rand_x = x + irandom_range(-rand_dis, rand_dis)
					rand_y = y + irandom_range(-rand_dis, rand_dis)
				}

				// Create steam with the level of the element subtracted
				steam = instance_create_layer(rand_x, rand_y, "Spells", obj_element_steam_air,
				{
					level : 1
				})
			}

			
			// Lower level of both objects by the others level
			own_id.level -= other_level
			other_id.level -= own_level
			
		
		}
		
	#endregion Water - Fire = Steam
	
	#region Steam - Ice = Water
	
		// Check if interaction is Ice - Steam
		if((own_id.is_ice == true && other_id.is_steaming == true) || (own_id.is_steaming == true && other_id.is_ice == true))
		{
		
			/*
				Subtract ice from steam
				Destroy which ever has its level lowered to 0
				Any remaining element has level permenantly lowered
			*/
		
			/*
				Create water from amount removed from steam
				Max level of water is level of steam
			*/
		
		}
		
	#endregion Steam - Ice = Water
	
	#region Ice + Water = Ice
	
		// Check if interaction is Ice + Water
		if((own_id.is_ice == true && other_id.water_level > 0) || (own_id.water_level > 0 && other_id.is_ice == true))
		{
		
			/*
				Add water to ice
				Destroy water over time, giving levels to and spreading ice
			*/
		
		}
		
	#endregion Ice + Water = Ice
	
	#region Water + Shock = Charged Water
	
		// Check if interaction is Water + Shock
		if((own_id.is_charged == true && other_id.water_level > 0) || (own_id.water_level > 0 && other_id.is_charged == true))
		{
		
			other_id.is_charged = true;
			own_id.is_charged = true;
		
		}
		
	#endregion Water + Shock = Charged Water
	
	#region Steam + Shock = Charged Steam
	
		// Check if interaction is Steam + Shock
		if((own_id.is_charged == true && other_id.is_steaming == true) || (own_id.is_steaming == true && other_id.is_charged == true))
		{
		
			other_id.is_charged = true;
			own_id.is_charged = true;
		
		}
		
	#endregion Steam + Shock = Charged Steam
	
	
	// Activate element interaction delay to prevent doubling up on interactions
	own_id.element_delay_active = true;
	other_id.element_delay_active = true;
	
	
	//show_debug_message(string(own_id.title) + " interaction finished")
	
	
	// Destroy objects if reaching under level 0 or under
	if(other_id.level <= 0) with(other_id)
	{
		//show_debug_message(string(other_id.title) + " Destroyed")
		instance_destroy()
	}
	if(own_id.level <= 0) with(own_id)
	{
		//show_debug_message(string(own_id.title) + " Destroyed")
		instance_destroy()
	}
}
