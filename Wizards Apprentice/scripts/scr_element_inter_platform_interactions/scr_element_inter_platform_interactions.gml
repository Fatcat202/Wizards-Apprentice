
function scr_element_inter_platform_interactions(own_id, other_id)
{
	// Used for logic for element interactions between different platforms
	
	/*
	
		Ice touching Water = Water becomes Ice
		Flaming Oil touching Oil = Fire spreads
		Flaming Oil touching Ice = Ice melts
		Flaming Oil touching Water = Water becomes Steam
	
	*/
	
	
	// Used for calling other elements variables
		// Used for own variables
		var own_element = own_id.element
		
		// Used for calling other elements variables
		var other_element = other_id.element
		


	// End script if there is no interaction to be had
	 if(own_element == "Empty" && other_element == "Empty") exit;



	#region Flaming Oil
		
		if(own_element == "Oil" && own_id.is_flaming == true)
		{
			// Spreading flaming oil
			if(other_element == "Oil")
			{
				// Start timer to spread fire between oil
				if(spreading_fire_timer >= spreading_fire_length)
				{
					// Turn platform to flaming oil
					other_id.is_flaming = true;
					// Reset timer
					spreading_fire_timer = 0;
					
					// Increment timer
				}else spreading_fire_timer++
			}else
			
			// Melting Ice
			if(other_element == "Ice")
			{
				// Start timer to melt ice
				if(melting_ice_timer >= melting_ice_length)
				{
					scr_element_reset_variables()
					// Turn platform to water from ice
					other_id.element = "Water"
					
					// Increment timer
				}else melting_ice_timer++
			}else
			
			
			// Evaporating Water
			if(other_element == "Water")
			{
				// Start timer to evaporate water
				if(evaporation_timer >= evaporation_length)
				{
					scr_element_reset_variables()
					// Turn platform to steam
					other_id.element = "Steam"
					
					// Create steam effect
					other_id.is_steaming = true;
					
					// Reset timer
					evaporation_timer = 0;
					
					// Increment timer
				}else evaporation_timer++
			}
		
		}

		
	#endregion Flaming Oil
	
	#region Water Freezing
	

		
		if(own_element == "Ice")
		{
			if(other_element == "Water")
			{
				// Start timer to turn water platform to ice
				if(freeze_timer >= freeze_length)
				{
					scr_element_reset_variables()
					// Turn platform to ice
					other_id.element = "Ice"
					// Reset timer
					freeze_timer = 0;
					
					// Increment timer
				}else freeze_timer++
			}
		}
		
	#endregion Water Freezing
	
	#region Charge Spreading
		
		if(own_element == "Water" && own_id.is_charged == true)
		{
			if(other_element == "Water" && other_id.is_charged == false)
			{
				// Electrify other platform
				other_id.is_charged = true
			}
		}
		
	#endregion Charge Spreading
	
	#region Water Spreading

		if(own_element == "Water" && own_id.water_level > 1)
		{
			if(other_element == "Empty")
			{
				// Change element to water
				other_id.element = "Water";
				// Decrease own water level by 1
				own_id.water_level -= 1;
				// Transfer water level
				other_id.water_level += own_id.water_level;
				
			}else if(other_element == "Water")
			{
				// Transfer level without decreasing
				other_id.water_level += own_id.water_level;
			}
		}
		
		
	#endregion Water Spreading
	
	
}