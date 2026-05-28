
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
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to spread fire between oil
				if(spreading_fire_timer >= spreading_fire_length)
				{
					// Turn platform to flaming oil
					other_id.is_flaming = true;
					// Reset timer
					spreading_fire_timer = 0;
					
					// Set interacting to false
					interacting = false;
					
					// Increment timer
				}else spreading_fire_timer++
			}else
			
			// Melting Ice
			if(other_element == "Ice")
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to melt ice
				if(melting_ice_timer >= melting_ice_length)
				{
					scr_element_reset_variables()
					// Turn platform to water from ice
					other_id.element = "Water"
					
					// Set interacting to false
					interacting = false;
					
					// Increment timer
				}else melting_ice_timer++
			}else
			
			
			// Evaporating Water
			if(other_element == "Water")
			{
				// Declare an interaction has started
				interacting = true;
				
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
					
					// Set interacting to false
					interacting = false;
					
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
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to turn water platform to ice
				if(freeze_timer >= freeze_length)
				{
					scr_element_reset_variables()
					// Turn platform to ice
					other_id.element = "Ice"
					// Reset timer
					freeze_timer = 0;
					
					// Set interacting to false
					interacting = false;
					
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
				
				// Set interacting to false
				interacting = false;
			}
		}
		
	#endregion Charge Spreading
	
	#region Water Spreading

		// Prevent water from spreading to platform located under another platform
		if(own_element == "Water" && other_id.above_free == false)
		{
			exit;
		}
				
		// Water spreading to other platforms normally
		if(own_element == "Water" && own_id.water_level > 1 && (own_id.object_index != obj_platform_aa_slope_left && own_id.object_index != obj_platform_aa_slope_right))
		{
			if(other_element == "Empty")
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer spread water between platforms
				if(own_id.spreading_water_timer >= own_id.spreading_water_length)
				{
					// Change element to water
					other_id.element = "Water";
					// Decrease own water level by 1
					own_id.water_level -= 1;
					// Transfer water level
					other_id.water_level += own_id.water_level;
					// Reset timer
					other_id.spreading_water_timer = 0;
					own_id.spreading_water_timer = 0;
					
					// Set interacting to false
					interacting = false;
					
				// Increment timer
				} own_id.spreading_water_timer++
				
			}else
			
			if(other_element == "Water" && other_id.water_level < own_id.water_level)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to transfer water level
				if(own_id.spreading_water_timer >= own_id.spreading_water_length)
				{
					// Verify total amount to transfer
					var trans_total = own_id.water_level - 1
					if(trans_total < 1) trans_total = 1
					
					// Transfer water level
					other_id.water_level += trans_total;
					own_id.water_level -= trans_total
					
					// Reset timer
					other_id.spreading_water_timer = 0;
					own_id.spreading_water_timer = 0;
					
					// Set interacting to false
					interacting = false;
					
				// Increment timer
				} own_id.spreading_water_timer++
			}
		}else
		
		// Water sliding down slopes
		if(own_id.element == "Water" && (own_id.object_index == obj_platform_aa_slope_left || own_id.object_index == obj_platform_aa_slope_right))
		{

			// Declare an interaction has started
			interacting = true;
				
			// Start timer to spread water between platforms
			if(own_id.spreading_water_timer >= own_id.spreading_water_length)
			{
				if(other_id.element == "Empty" || other_id.element == "Water")
				{
					//show_debug_message("Level = " + string(trans_total))
					
					// Verify total amount to transfer
					var trans_total = own_id.water_level - 1
					if(trans_total < 1) trans_total = 1
						
					// Change other element to water
					other_id.element = "Water";
					// Transfer water level
					other_id.water_level += trans_total;
					own_id.water_level -= trans_total
					
					// Clear own element
					own_id.element = "Empty"
				}
				
				// Reset timer
				other_id.spreading_water_timer = 0;
				own_id.spreading_water_timer = 0;
					
				// Set interacting to false
				interacting = false;
					
			// Increment timer
			} own_id.spreading_water_timer++

		}
		
		
	#endregion Water Spreading

	#region Oil Spreading

		// Prevent oil from spreading to platform located under another platform
		if(own_element == "Oil" && other_id.above_free == false)
		{
			exit;
		}
		
		// Oil spreading to other platforms normally
		if(own_element == "Oil" && own_id.oil_level > 1 && (own_id.object_index != obj_platform_aa_slope_left && own_id.object_index != obj_platform_aa_slope_right))
		{
			if(other_element == "Empty")
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer spread oil between platforms
				if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
				{
					// Change element to oil
					other_id.element = "Oil";

					// Verify total amount to transfer
					var trans_total = own_id.oil_level - 1
					if(trans_total < 1) trans_total = 1
					
					// Decrease own oil level to 1
					own_id.oil_level = 1;
					
					// Transfer oil level
					other_id.oil_level += trans_total;
					// Reset timer
					other_id.spreading_oil_timer = 0;
					own_id.spreading_oil_timer = 0;
					
					// Transfer flames to other platform
					other_id.is_flaming = own_id.is_flaming;
					
					// Set interacting to false
					interacting = false;
					
				// Increment timer
				} own_id.spreading_oil_timer++
				
			}else
			
			if(other_element == "Oil" && other_id.oil_level < own_id.oil_level)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to transfer oil level
				if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
				{
					// Verify total amount to transfer
					var trans_total = own_id.oil_level - 1
					if(trans_total < 1) trans_total = 1
					
					// Transfer oil level
					other_id.oil_level += trans_total;
					own_id.oil_level -= trans_total
					
					// Reset timer
					other_id.spreading_oil_timer = 0;
					own_id.spreading_oil_timer = 0;
					
					// Transfer flames to other platform
					other_id.is_flaming = own_id.is_flaming;
					
					// Set interacting to false
					interacting = false;
					
				// Increment timer
				} own_id.spreading_oil_timer++
			}
		}else
		
		// Oil sliding down slopes
		if(own_id.element == "Oil" && (own_id.object_index == obj_platform_aa_slope_left || own_id.object_index == obj_platform_aa_slope_right))
		{

			// Declare an interaction has started
			interacting = true;
				
			// Start timer to spread oil between platforms
			if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
			{

				if(other_id.element == "Empty" || other_id.element == "Oil")
				{
					//show_debug_message("Level = " + string(level))
										
					// Verify total amount to transfer
					var trans_total = own_id.oil_level - 1
					if(trans_total < 1) trans_total = 1
						
					// Change other element to oil
					other_id.element = "Oil";
					// Transfer oil level
					other_id.oil_level += trans_total;
					own_id.oil_level -= trans_total
					
					// Transfer flames to other platform
					other_id.is_flaming = own_id.is_flaming;
					
					
					// Clear own element
					own_id.element = "Empty"
				}
				
				// Reset timer
				other_id.spreading_oil_timer = 0;
				own_id.spreading_oil_timer = 0;
					
				// Set interacting to false
				interacting = false;
					
			// Increment timer
			} own_id.spreading_oil_timer++

		}
		
		
	#endregion Oil Spreading
	
	
}