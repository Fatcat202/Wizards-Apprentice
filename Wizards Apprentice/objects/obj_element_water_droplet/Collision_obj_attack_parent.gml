/// @description Spell Interactions

// Interacting with fire spell
if(other.element == "Fire")
{
	// Create steam in air
	steam = instance_create_layer(x, y, "Spells", obj_element_steam_air,
	{	
		
	})
	
	// Decrease level of other fire spell
	other.level--;
	
	// Destroy self
	instance_destroy()
}else

// Interacting with ice spell
if(other.element == "Ice")
{
	// Create icicle
	icicle = instance_create_layer(x, y, "Spells", obj_element_icicle,
	{	
		move_spd_v : move_spd_v
	})
	
	// Decrease level of other ice spell
	other.level--;
	
	// Destroy self
	instance_destroy()
}