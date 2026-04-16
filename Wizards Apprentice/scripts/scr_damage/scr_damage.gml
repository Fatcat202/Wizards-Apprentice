function scr_damage(dmg, _element = element)
{
	// Deals damage to other object, designed to be used in collision events of attacks
	// Pass through damage and element of attack
	with(other)
	{
	
		if(element_shield == _element || element_shield == "Empty")
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
		}else
		{
			// If element shield does not match attack element
		
			// Do nothing
		}	
	}
	
	
	// Debug
	show_debug_message("Damage Element: " + string(_element))
}