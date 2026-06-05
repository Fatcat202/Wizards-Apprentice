
function scr_element_platform_interactions(spell_id, platform_id)
{
	// Used for interactions between spells and platforms
	
	
	// Used for spell variables
	var spell_element = spell_id.element
	
	// Used to check if platform is steaming, boolean
	var plat_is_steaming = platform_id.is_steaming;

	
	// ** MUST BE CHANGED FOR REFACTOR TO TEST SPELL ELEMENT, THEN PLATFORM ELEMENT **
	
	
	// Debug
	//show_debug_message("spell_element = " + string(spell_element))
	//show_debug_message("platform_element = " + string(platform_element))
	
	// Used to create and throw flaming oil droplets when in contact with water based spells
	function func_throw_oil_droplet()
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
	

	if(spell_id.element == "Fire")
	{
		// Fire + Ice/Oil
		if(platform_id.is_ice == true && platform_id.oil_level > 0)
		{
			// Remove ice
			platform_id.is_ice = true
			
			// Set as flaming
			platform_id.is_flaming = true
			
		}else
		
		// Fire + Ice
		if(platform_id.is_ice == true)
		{
			// Remove Ice
			platform_id.is_ice = false
			
			// If spell level is >1, start steam
			if(spell_id.level > 1)
			{
				platform_id.is_steaming = true
			}
		}else
		
		// Fire + Oil/Water
		if(platform_id.oil_level > 0 && platform_id.water_level > 0)
		{
			// Interaction when both water and oil are present
			platform_id.is_flaming = true;
			
		}else
		
		// Fire + Water
		if(platform_id.is_ice == false && platform_id.water_level > 0 && platform_id.oil_level == 0)
		{
			// Start steam
			platform_id.is_steaming = true;
		}else
		
		// Fire + Oil
		if(platform_id.oil_level > 0 && platform_id.water_level == 0)
		{
			// Start flames
			platform_id.is_flaming = true
		}
		

		
	}else
	
	if(spell_id.element == "Water")
	{

		// Water + Ice
		if(platform_id.is_ice == true)
		{
			// Transfer level as water level
			platform_id.water_level += spell_id.level;
		}else
		
		// Water + Flaming Oil
		if(platform_id.is_flaming == true)
		{
			func_throw_oil_droplet();
			
		}else // Water + Water or Water + Empty
		{
			// Transfer level as water level
			platform_id.water_level += spell_id.level;
		}
		
		
	}else
	
	if(spell_id.element == "Oil")
	{
		
		// Oil + Oil or Oil + Empty

		// Transfer level as oil level
		platform_id.oil_level += spell_id.level;
		
	}else
	
	if(spell_id.element == "Ice")
	{
		// Ice + Water
		if(platform_id.water_level > 0)
		{
			// Create Ice
			platform_id.is_ice = true
			
			// Remove steam
			platform_id.is_steaming = false
		}else
		
		// Ice + Flaming Oil
		if(platform_id.is_flaming == true)
		{
			func_throw_oil_droplet();
		}
		
		
	}else
	
	if(spell_id.element == "Steam")
	{
		// Steam + Water
		if(platform_id.water_level > 0)
		{
			// Start steam
			platform_id.is_steaming = true;
		}
		
		// Steam + Flaming Oil
		if(platform_id.is_flaming == true)
		{
			func_throw_oil_droplet();
		}
		
	}else
	
	if(spell_id.element == "Shock")
	{
		// Shock + Water && Not Ice
		if(platform_id.water_level > 0 && platform_id.is_ice == false)
		{
			// Create charge
			platform_id.is_charged = true;
		}
		
	}
	
	
	
}