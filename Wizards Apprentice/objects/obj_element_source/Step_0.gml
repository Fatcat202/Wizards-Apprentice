
// Ensure spawn frequency is up to date
if(spawn_length != game_get_speed(gamespeed_fps) * frequency)
{
	spawn_length = game_get_speed(gamespeed_fps) * frequency;
}


// Timer to spawn new object
if(spawn_timer > spawn_length)
{	// Reset
	spawn_timer = 0;
	spawn_length = game_get_speed(gamespeed_fps) * frequency;
	
	// Spawn matching type of element
	if(element == "Oil")
	{
		var oil = instance_create_layer(x, y, "Spells", obj_element_oil_droplet)
			oil.is_flaming = is_flaming;
	}else
	
	if(element == "Ice")
	{
		instance_create_layer(x, y, "Spells", obj_element_icicle)
	}else
	
	if(element == "Water")
	{
		instance_create_layer(x, y, "Spells", obj_element_water_droplet)
	}else
	{
		show_debug_message("No Element Set: " + string(id))
	}
}else spawn_timer++