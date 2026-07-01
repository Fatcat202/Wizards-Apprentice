
function scr_element_platform_interactions(spell_id, platform_id)
{
	// Used for interactions between spells and platforms
	
	if(platform_id.object_index == obj_platform_void) exit;

	
	if(spell_id.water_level > 0)
	{
		platform_id.water_level += spell_id.water_level
	}
	
	if(spell_id.oil_level > 0)
	{
		platform_id.oil_level += spell_id.oil_level
	}
	
	if(spell_id.is_ice == true)
	{
		if(platform_id.water_level > 0)
		{
			platform_id.is_ice = true;
		}
		
		if(platform_id.is_steaming)
		{scr_test()
			platform_id.is_steaming = false;
		}
	}
	
	if(spell_id.is_steaming == true)
	{
		if(platform_id.water_level > 0) platform_id.is_steaming = true;
	}
	
	
	if(spell_id.is_flaming == true)
	{

		if(platform_id.water_level > 0)
		{
			if(platform_id.is_ice == true)
			{
				// Remove Ice
				platform_id.is_ice = false
			
				// Subtract level by 1
				spell_id.level--
			}
			
			if(spell_id.level > 0)
			{
				platform_id.is_steaming = true
			}
			
		}
		
		if(platform_id.oil_level > 0) platform_id.is_flaming = true;
		
	}
	
	if(spell_id.is_charged == true)
	{
		// Shock + Water && Not Ice
		if(platform_id.water_level > 0 && platform_id.is_ice == false) platform_id.is_charged = true;

	}



	
} 
// ** PREVIOUS LOGIC BEFORE MAJOR ELEMENT REFACTOR **
/*
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
			scr_throw_oil_droplet(spell_id, platform_id);
			
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
			scr_throw_oil_droplet(spell_id, platform_id);
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
			scr_throw_oil_droplet(spell_id, platform_id);
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