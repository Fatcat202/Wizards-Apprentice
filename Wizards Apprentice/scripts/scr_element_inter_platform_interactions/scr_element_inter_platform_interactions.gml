
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
	if(own_element == "Empty" || other_element == "Empty") exit;



	#region Spreading Flaming Oil
		/*	
		if(own_element == "Oil" && own_id.is_flaming == true)
		{
			if(other_element == "Oil")
			{
				other_id.is_flaming = true;
			}
		
		}*/

	#endregion Spreading Flaming Oil
	
	#region Water Freezing
	

		
		if(own_element == "Ice")
		{
			if(other_element == "Water")
			{
				// Start timer to turn water platform to ice
				if(water_to_ice_timer >= water_to_ice_length)
				{
					// Turn platform to ice
					other_id.element = "Ice"
					// Reset timer
					water_to_ice_timer = 0;
					
					// Increment timer
				}else water_to_ice_timer++
			}
		}
		
	#endregion Water Freezing
	
	
	
	
	
}