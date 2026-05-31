
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
		
		// Water + Ice
		if(spell_element == "Water")
		{
			platform_id.water_level += spell_id.level;
		}
			
			
	}else
		
	// If platform is wet
	if(platform_element == "Water")
	{
			
		// Fire + Water
		if(spell_element == "Fire")
		{
			scr_element_reset_variables(platform_id)
			platform_id.element = "Steam"
			
			// Create steam effect
			platform_id.is_steaming = true;
					
			// Reset timer
			evaporation_timer = 0;
		}
		
		// Ice + Water
		if(spell_element == "Ice")
		{
			scr_element_reset_variables(platform_id)
			platform_id.element = "Ice"
		}
		
		// Shock + Water
		if(spell_element == "Shock")
		{
			// Charge water to stun characters
			platform_id.is_charged = true;
		}
		
		// Water + Water
		if(spell_element == "Water")
		{
			platform_id.water_level += spell_id.level;
		}
		

			
	}else
		
	// if platform is oily
	if(platform_element == "Oil")
	{
		// Oil + Oil
		if(spell_element == "Oil")
		{
			platform_id.oil_level += spell_id.level;
		}
		
		// Lighting oil on fire with fire
		if(spell_element == "Fire")
		{
			// Sets platform to now be flaming
			platform_id.is_flaming = true;

		}	
		
		// Flaming Oil + Water
		if(platform_id.is_flaming == true && spell_element == "Water")
		{
			// Create a number of flaming oil droplets equal to level of water spell
			// splitting remaining fuel in platform between them.
			// Throw oil droplets in random directions
			// with gravity affecting them and facing the direction they fly
			
			
			// Store level of spell to determine number of oil droplets and steam objects
			var spell_level = spell_id.level;
			
			// Total fuel after split between each droplet and platform
			var fuel_split = platform_id.fuel_left / (spell_level + 1)
			
			// Reduce platform fuel
			platform_id.fuel_left = fuel_split;
			
			for(var i = 0; i < spell_level; i++)
			{
				
				// Create random speed of droplet
				var rand_spd = random_range(-4, 4)
				
				// Create random deviation in x origin point on platform
				var rand_x = random_range(-10, 10)
				
				
				
				// Create oil droplet, throwing it in random direction
				droplet = instance_create_layer(platform_id.x + rand_x, platform_id.y - platform_id.sprite_height - 5, "Spells", obj_element_oil_droplet,
				{
					fuel_left : fuel_split,
					is_flaming : true,
					move_spd_v : 6,
					move_spd_h : rand_spd
					
				})
				
				
				// Create steam object for each water level in location droplet is spawned
				steam = instance_create_layer(platform_id.x + rand_x, platform_id.y - platform_id.sprite_height - 5, "Spells", obj_element_steam_air)
			
			
			}
			
			
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
				instance_destroy(steam, true)
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
			platform_id.water_level += spell_id.level;
		}
		
		// Cover platform with oil
		if(spell_element == ("Oil"))
		{
			
			platform_id.element = "Oil"
			platform_id.oil_level += spell_id.level;
		}
	}
}