
function scr_element_platform_interactions(spell_id, platform_id)
{
	// Used for interactions between spells and platforms
	
	if(platform_id.object_index == obj_platform_void_parent) exit;
	if(!instance_exists(spell_id) || !instance_exists(platform_id)) exit;
	
	if(spell_id.water_level > 0 && spell_id.is_ice == false)
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
			platform_id.water_level += spell_id.water_level
		}
		
		if(platform_id.is_steaming)
		{
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
