
function scr_element_spell_interactions(own_id, other_id)
{
	// Provides the logic for element interactions
	
	// Must provide ID of elements being interacted with
	
	
	// Used for calling other elements variables
		
		// Used for own variables
		var own_element = own_id.element
		var own_level = own_id.level
	
		// Used for calling other elements variables
		var other_element = other_id.element
		var other_level = other_id.level

	
	// Cancel script if either effect has no element
	if(other_element == "None" || own_element == "None") exit;
	
	
	//show_debug_message("Interaction started")
	
	
	
	#region Ice - Fire = Water
	
		// Check if interaction is Fire + Ice
		if((own_element == "Fire" && other_element == "Ice") || (own_element = "Ice" && other_element == "Fire"))
		{
		
			/*
				Subtract fire from ice
				Destroy which ever has its level lowered to 0
				Any remaining element has level permenantly lowered
			*/
			
			// Lower level of both objects by the others level
			own_id.level -= other_level
			other_id.level -= own_level
			
			
			
		
			/*
				Create water from amount removed from ice
				Max level of water is level of ice
			*/
		
		}
		
	#endregion Ice - Fire = Water
	
	
	#region Water - Fire = Steam
	
		// Check if interaction is Water - Fire
		if((own_element == "Fire" && other_element == "Water") || (own_element = "Water" && other_element == "Fire"))
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
		if((own_element == "Ice" && other_element == "Steam") || (own_element = "Steam" && other_element == "Ice"))
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
		if((own_element == "Ice" && other_element == "Water") || (own_element = "Water" && other_element == "Ice"))
		{
		
			/*
				Add water to ice
				Destroy water over time, giving levels to and spreading ice
			*/
		
		}
		
	#endregion Ice + Water = Ice
	
	#region Water + Shock = Charged Water
	
		// Check if interaction is Water + Shock
		if((own_element == "Shock" && other_element == "Water") || (own_element = "Water" && other_element == "Shock"))
		{
		
			/*
				Add shock effect to existing water
			*/
		
		}
		
	#endregion Water + Shock = Charged Water
	
		#region Steam + Shock = Charged Steam
	
		// Check if interaction is Steam + Shock
		if((own_element == "Shock" && other_element == "Steam") || (own_element = "Steam" && other_element == "Shock"))
		{
		
			/*
				Add shock effect to existing steam
			*/
		
		}
		
	#endregion Steam + Shock = Charged Steam
	
	
	// Activate element interaction delay to prevent doubling up on interactions
	own_id.element_delay_active = true;
	other_id.element_delay_active = true;
	
	
	//show_debug_message(string(own_id.title) + " interaction finished")
	
	
	// Destroy objects if reaching under level 0 or under

	if(other_id.level <= 0) with(other_id)
	{
		show_debug_message(string(other_id.title) + " Destroyed")
		instance_destroy()
	}

	
	if(own_id.level <= 0) with(own_id)
	{
		show_debug_message(string(own_id.title) + " Destroyed")
		instance_destroy()
	}
}
