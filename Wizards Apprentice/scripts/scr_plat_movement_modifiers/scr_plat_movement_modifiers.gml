// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_plat_movement_modifiers()
{
	// Detects platform ID below player
	var plat_id = instance_place(x, y + 1, obj_platform_parent)
	if(plat_id != noone && !object_is_ancestor(plat_id.object_index, obj_platform_void_parent))
	{
				
		if(plat_id.oil_level > 0)
		{
			// Rest any changes
			scr_reset_move_modifiers();
				
			// Change move speed to match
			plat_spd_mod = plat_spd_oil;
			
			// Change acceleration/deceleration
			h_acel = h_acel_default * plat_spd_mod;
			h_decel = h_decel_default * plat_spd_mod;
			// Change max move speed
			move_spd_max = move_spd_max_default * plat_spd_mod;
			
			
		}else
					
		if(plat_id.is_ice == true)
		{
			// Rest any changes
			scr_reset_move_modifiers();
				
			// Change acceleration/deceleration
			h_acel = h_acel_default * plat_spd_acel_ice;
			h_decel = h_decel_default * plat_spd_decel_ice;
				
				
		}else
					
		if(plat_id.water_level > 0)
		{
			// Rest any changes
			scr_reset_move_modifiers();
						
			// If the character is standing on a charged water platform
			if(plat_id.is_charged)
			{
	
				// Determines if the character can be stunned
				if(can_be_stunned == true)
				{
					// Declares the player platform stunned, starting timer until no longer stunned
					plat_stunned = true
				}
							
			}
		}else scr_reset_move_modifiers() // Rest any changes when on the ground
					
				
	}else scr_reset_move_modifiers() // Rest any changes when not on the ground
			
}