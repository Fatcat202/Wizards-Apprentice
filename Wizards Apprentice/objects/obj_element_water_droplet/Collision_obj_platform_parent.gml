/// @description Platform Interactions

// Change platform to water if empty
if(other.element == "Empty" || other.element == "Water")
{
	// Change element to water
	other.element = "Water"
	// Decrease level
	level -= 1;
	// Increment water level
	other.water_level += level;
	
	
	// Debug
	//show_debug_message("other.water_level: " + string(other.water_level))

// Store water level when Ice to release when thawed
}else if(other.element == "Ice")
{
	other.water_level += level;
}


// Destroy self upon contact
instance_destroy()