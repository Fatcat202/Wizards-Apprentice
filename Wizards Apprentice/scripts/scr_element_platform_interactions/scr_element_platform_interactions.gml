
function scr_element_platform_interactions(own_id, other_id)
{
	// Used for interactions between spells and platforms
	
	
	// Used for calling other elements variables
		// Used for own variables
		var own_element = own_id.element

	
		// Used for calling other elements variables
		var platform_element = other_id.element

	
	// Check if any element interaction is possible
	if(own_element == "Empty" || platform_element == "Empty") exit;
	
	
	// Debug
	//show_debug_message("own_element = " + string(own_element))
	//show_debug_message("platform_element = " + string(platform_element))

	// If platform is icy
	if(platform_element == "Ice")
	{

		
		// Fire + Ice
		if(own_element == "Fire")
		{
			other_id.element = "Water"
		}
			
			
	}else
		
	// If platform is wet
	if(platform_element == "Water")
	{
			
		// Fire + Water
		if(own_element == "Fire")
		{
			other_id.element = "None"
		}
			
	}else
		
	// if platform is oily
	if(platform_element == "Oil")
	{
			
			
	}
}