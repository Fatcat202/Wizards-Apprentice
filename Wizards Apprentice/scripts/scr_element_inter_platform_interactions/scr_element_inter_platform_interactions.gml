
function scr_element_inter_platform_interactions(own_id = id, other_id)
{
	// Used for logic for element interactions between different platforms
	
	/*
	
		Ice touching Water = Water becomes Ice
		Flaming Oil touching Oil = Fire spreads
		Flaming Oil touching Ice = Ice melts
		Flaming Oil touching Water = Water becomes Steam
	
	*/
	
	// Exit script if other_id is not properly passed through to prevent crash
	if(!instance_exists(other_id))
	{
		exit;
	}
	
	// Prevent interactions with void to prevent crash
	if(other_id.object_index == obj_platform_void || other_id.object_index == obj_platform_void_slope) exit;
	
	// End script if there is no interaction to be had
	 if(own_id.water_level == 0 && own_id.oil_level == 0
		 && other_id.water_level == 0 && other_id.oil_level == 0) exit;


	#region Flaming Oil
		
		if(own_id.oil_level > 0 && own_id.is_flaming == true)
		{
			// Spreading flaming oil
			if(other_id.oil_level > 0)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to spread fire between oil
				if(spreading_fire_timer >= spreading_fire_length)
				{
				    if(instance_exists(other_id))
				    {
						// Turn platform to flaming oil
						if(other_id.is_flaming != true) other_id.is_flaming = true;
						// Reset timer
						spreading_fire_timer = 0;
						// Set interacting to false
						interacting = false;
					}
					
					// Increment timer
				}else spreading_fire_timer++
			}else
			
			// Melting Ice
			if(other_id.is_ice == true)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to melt ice
				if(melting_ice_timer >= melting_ice_length)
				{
					if(instance_exists(other_id))
				    {
						// Turn platform to water from ice
						is_ice = false
					
						// Set interacting to false
						interacting = false;
					}
					
					// Increment timer
				}else melting_ice_timer++
			}else
			
			
			// Evaporating Water
			if(other_id.water_level > 0)
			{
				// Declare an interaction has started
				other_id.interacting = true;
				
				// Start timer to evaporate water
				if(other_id.evaporation_timer >= other_id.evaporation_length)
				{
					if(instance_exists(other_id))
				    {
						// Create steam effect
						other_id.is_steaming = true;
					
						// Reset timer
						other_id.evaporation_timer = 0;
					
						// Set interacting to false
						other_id.interacting = false;
					}
					
					// Increment timer
				}else other_id.evaporation_timer++
			}
		}

		
	#endregion Flaming Oil
	
	#region Water Freezing

		if(own_id.is_ice == true)
		{
			if(other_id.water_level > 0)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to turn water platform to ice
				if(freeze_timer >= freeze_length)
				{
					if(instance_exists(other_id))
				    {
						// Destroy steam object, if it exists
						if(instance_exists(steam)) instance_destroy(steam, true)
						
						// Remove steam
						other_id.is_steaming = false;
			
						// Reset Fuel
						other_id.fuel_left = other_id.fuel_default
			
						// Remove charge
						other_id.is_charged = false;
			
						// Set element to ice
						other_id.is_ice = true
						
						// Reset timer
						freeze_timer = 0;
					
						// Set interacting to false
						interacting = false;
					}
					
					// Increment timer
				}else freeze_timer++
			}
		}
		
	#endregion Water Freezing
	
	#region Charge Spreading
		
		if(own_id.water_level > 0 && own_id.is_charged == true)
		{
			if(other_id.water_level > 0 && other_id.is_charged == false)
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
		if(own_id.water_level > 0 && other_id.above_free == false)
		{
			exit;
		}
				
		// Water spreading to other platforms normally
		if(own_id.water_level > 1 && (own_id.object_index != obj_platform_aa_slope_left && own_id.object_index != obj_platform_aa_slope_right))
		{
			// Spreading to other platform without water
			if(other_id.water_level == 0)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer spread water between platforms
				if(own_id.spreading_water_timer >= own_id.spreading_water_length)
				{	
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
			
			// Water spreading to platform with water
			if(other_id.water_level > 0 && other_id.water_level < own_id.water_level)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to transfer water level
				if(own_id.spreading_water_timer >= own_id.spreading_water_length)
				{
				    if(instance_exists(other_id))
				    {
						// Verify total amount to transfer
						var trans_total = determine_level_transfer(own_id.water_level, other_id.water_level);
					
						// Transfer water level
						other_id.water_level += trans_total;
						own_id.water_level -= trans_total
					
						// Reset timer
						other_id.spreading_water_timer = 0;
						own_id.spreading_water_timer = 0;
					
						// Set interacting to false
						interacting = false;
					}
				// Increment timer
				} own_id.spreading_water_timer++
			}
		}else
		
		// Water sliding down slopes
		if(own_id.water_level > 0 && (own_id.object_index == obj_platform_aa_slope_left || own_id.object_index == obj_platform_aa_slope_right))
		{

			// Declare an interaction has started
			interacting = true;
				
			// Start timer to spread water between platforms
			if(own_id.spreading_water_timer >= own_id.spreading_water_length)
			{

				//show_debug_message("Level = " + string(trans_total))
					
				// Verify total amount to transfer
				var trans_total = own_id.water_level - 1
				if(trans_total < 1) trans_total = 1
						
				// Transfer water level
				other_id.water_level += trans_total;
				own_id.water_level -= trans_total
						
				// Transfer fuel remaining to other platform
				other_id.fuel_left = own_id.fuel_left
				// Transfer steam to other platform
				other_id.is_steaming = own_id.is_steaming;
					
				with(own_id) { scr_element_reset_variables() }

				
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
		if(own_id.oil_level > 0 && other_id.above_free == false)
		{
			exit;
		}
		
		// Oil spreading to other platforms normally
		if(own_id.oil_level > 1 && (own_id.object_index != obj_platform_aa_slope_left && own_id.object_index != obj_platform_aa_slope_right))
		{
			// Spreading to platform without oil
			if(other_id.oil_level == 0)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer spread oil between platforms
				if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
				{
				    if(instance_exists(other_id))
				    {

						// Verify total amount to transfer
						var trans_total = own_id.oil_level - 1
						if(trans_total < 1) trans_total = 1
					
						// Decrease own oil level to 1
						own_id.oil_level = 1;
						
						// Transfer fuel remaining to other platform
						other_id.fuel_left = own_id.fuel_left
					
						// Transfer oil level
						other_id.oil_level += trans_total;
						// Reset timer
						other_id.spreading_oil_timer = 0;
						own_id.spreading_oil_timer = 0;
					
						// Transfer flames to other platform
						other_id.is_flaming = own_id.is_flaming;
					
						// Set interacting to false
						interacting = false;
					}
					
				// Increment timer
				} own_id.spreading_oil_timer++
				
			}else
			
			// Spreading to platform with oil
			if(other_id.oil_level > 0 && other_id.oil_level < own_id.oil_level)
			{
				// Declare an interaction has started
				interacting = true;
				
				// Start timer to transfer oil level
				if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
				{

					// Verify total amount to transfer
					var trans_total = determine_level_transfer(own_id.oil_level, other_id.oil_level);
					
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
		if(own_id.oil_level > 0 && (own_id.object_index == obj_platform_aa_slope_left || own_id.object_index == obj_platform_aa_slope_right))
		{

			// Declare an interaction has started
			interacting = true;
				
			// Start timer to spread oil between platforms
			if(own_id.spreading_oil_timer >= own_id.spreading_oil_length)
			{

				//show_debug_message("Level = " + string(level))
										
				// Verify total amount to transfer
				var trans_total = own_id.oil_level - 1
				if(trans_total < 1) trans_total = 1
					
				// Transfer oil level
				other_id.oil_level += trans_total;
				own_id.oil_level -= trans_total
						
				// Transfer fuel remaining to other platform
				other_id.fuel_left = own_id.fuel_left
				// Transfer flames to other platform
				other_id.is_flaming = own_id.is_flaming;
					
				// Clear own element
				with(own_id) { scr_element_reset_variables() }
				
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