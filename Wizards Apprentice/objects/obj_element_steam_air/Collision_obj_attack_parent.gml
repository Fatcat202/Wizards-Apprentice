/// @description Spell Interactions

// Interacting with ice spell
if(other.element == "Ice")
{
	// Create water droplet
	water_drop = instance_create_layer(x, y, "Spells", obj_element_water_droplet,
	{	
		move_spd_v : move_spd_v
	})
	
	// Decrease level of other fire spell
	other.level--;
	
	// Destroy self
	instance_destroy()
}