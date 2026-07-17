function scr_damage(dmg, _water_level = water_level, _oil_level = oil_level, _is_flaming = is_flaming, _is_ice = is_ice, _is_steaming = is_steaming, _is_charged = is_charged)
{
	// Deals damage to other object, designed to be used in collision events of attacks
	// Pass through damage of attack
	with(other)
	{
		
		// Check for shield interaction. If shield matches element, destroy shield and cancel damage
		if((_is_flaming == true && element_shield == "Fire") ||
		(_is_ice == true && element_shield == "Ice") || 
		(_is_ice == false && _is_steaming == false && _water_level > 0 && element_shield == "Water") ||
		(_is_steaming == true && element_shield == "Steam") ||
		(_oil_level > 0 && element_shield == "Oil") ||
		(_is_charged == true && element_shield == "Shock"))
		{
			element_shield = "Empty"
			exit;
		}
		

		if(element_shield == "Empty")
		{
		
			// If enemy has same element shield as attack, or has no element shield then do damage
	
			if(can_damage == true)
			{
				can_damage = false;
				active_health = active_health - dmg;
				// Tint sprite red for 15 frames when damaged
				image_blend = c_red;
				// Activate I frames
				alarm[11] = global.i_frames;
				
				// Remove element shield
				element_shield = "Empty"
			}
		}	
	}
}