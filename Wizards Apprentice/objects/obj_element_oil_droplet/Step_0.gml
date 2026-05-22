/// @description Gravity

#region Gravity

	// Increment gravity
	move_spd_v -= global.grav;

	// Set max speed of droplet
	if(move_spd_v > move_spd_max) move_spd_v = move_spd_max

	// Move object
	y -= move_spd_v

#endregion Gravity

#region Flaming

	if(is_flaming == true && flames_spawned == false)
	{
	scr_test()
		// Spawn flame
		flame_0 = instance_create_layer(x, y - (sprite_height / 4), "Spells", obj_element_flaming,
		{
			platform_id : id
		});
	
		// State flames are now spawned to prevent duplication
		flames_spawned = true;
		
	}
	
	// Flames follow oil droplet
	if(flames_spawned == true)
	{
		if(instance_exists(flame_0))
		{
			flame_0.x = x;
			flame_0.y = y - (sprite_height / 4);
		}
	}
	
#endregion Flaming