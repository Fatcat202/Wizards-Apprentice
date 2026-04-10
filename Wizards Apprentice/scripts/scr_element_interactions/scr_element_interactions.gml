
function scr_element_interactions(own_id, other_id)
{
	// Provides the logic for element interactions
	
	// Must provide ID of elements being interacted with
	
	
	// Used for own variables
	var own_element = own_id.element
	var own_level = own_id.level
	
	// Used for calling other elements variables
	var other_element = other_id.element
	var other_level = other_id.level

	
	// Cancel script if either effect has no element
	if(other_element == "None" || own_element == "None") exit;
	
	
	#region Ice - Fire = Water
	
		// Check if interaction is Fire + Ice
		if((own_element == "fire" && other_element == "ice") || (own_element = "ice" && other_element == "fire"))
		{
		
			/*
				Subtract fire from ice
				Destroy which ever has its level lowered to 0
				Any remaining element has level permenantly lowered
			*/
		
			/*
				Create water from amount removed from ice
				Max level of water is level of ice
			*/
		
		}
		
	#endregion Ice - Fire = Water
	
	
	#region Water - Fire = Steam
	
		// Check if interaction is Water - Fire
		if((own_element == "fire" && other_element == "water") || (own_element = "water" && other_element == "fire"))
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
		
		}
		
	#endregion Water - Fire = Steam
	
	#region Steam - Ice = Water
	
		// Check if interaction is Ice - Steam
		if((own_element == "ice" && other_element == "steam") || (own_element = "steam" && other_element == "ice"))
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
		if((own_element == "ice" && other_element == "water") || (own_element = "water" && other_element == "ice"))
		{
		
			/*
				Add water to ice
				Destroy water over time, giving levels to and spreading ice
			*/
		
		}
		
	#endregion Ice + Water = Ice
	
	#region Water + Shock = Charged Water
	
		// Check if interaction is Water + Shock
		if((own_element == "shock" && other_element == "water") || (own_element = "water" && other_element == "shock"))
		{
		
			/*
				Add shock effect to existing water
			*/
		
		}
		
	#endregion Water + Shock = Charged Water
	
		#region Steam + Shock = Charged Steam
	
		// Check if interaction is Steam + Shock
		if((own_element == "shock" && other_element == "steam") || (own_element = "steam" && other_element == "shock"))
		{
		
			/*
				Add shock effect to existing steam
			*/
		
		}
		
	#endregion Steam + Shock = Charged Steam
	
	
}