
function scr_element_platform_interactions(spell_id, platform_id)
{
	// Used for interactions between spells and platforms
	
	
	// Used for spell variables
	var spell_element = spell_id.element

	
	// Used for platform
	var platform_element = platform_id.element

	
	// Check if any element interaction is possible
	//if(spell_element == "Empty" || platform_element == "Empty") exit;
	
	
	// Debug
	//show_debug_message("spell_element = " + string(spell_element))
	//show_debug_message("platform_element = " + string(platform_element))

	// If platform is icy
	if(platform_element == "Ice")
	{

		// Fire + Ice
		if(spell_element == "Fire")
		{
			scr_element_reset_variables()
			platform_id.element = "Water"
		}
		
		// Steam + Ice
		if(spell_element == "Steam")
		{
			scr_element_reset_variables()
			platform_id.element = "Water"
			platform_id.is_steaming = false
		}
			
			
	}else
		
	// If platform is wet
	if(platform_element == "Water")
	{
			
		// Fire + Water
		if(spell_element == "Fire")
		{
			scr_element_reset_variables()
			platform_id.element = "Steam"
			
			// Create steam effect
			platform_id.is_steaming = true;
					
			// Reset timer
			evaporation_timer = 0;
		}
		
		// Ice + Water
		if(spell_element == "Ice")
		{
			scr_element_reset_variables()
			platform_id.element = "Ice"
		}
		

			
	}else
		
	// if platform is oily
	if(platform_element == "Oil")
	{
		
		// Lighting oil on fire with fire
		if(spell_element == "Fire")
		{
			// Sets platform to now be flaming
			platform_id.is_flaming = true;

		}	
	}else
	
	// if platform is steaming
	if(platform_element == "Steam")
	{
		if(spell_element == "Ice")
		{
			with(platform_id)
			{
				scr_element_reset_variables()
				element = "Water"
				instance_destroy(steam)
			}
			
		}
	}else
	
	// if platform has no element
	if(platform_element == ("Empty"))
	{
		
		// Cover platform with water
		if(spell_element == ("Water"))
		{
			
			platform_id.element = "Water"
		}
		
		// Cover platform with oil
		if(spell_element == ("Oil"))
		{
			
			platform_id.element = "Oil"
		}
	}
}