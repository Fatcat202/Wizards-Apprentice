/// @description Platform Interactions

// Change platform to water if empty, transfer remaining water level
if(other.element == "Empty")
{
	// Change element to water
	other.element = "Water"
	// Decrease level
	level -= 1;
	// Increment water level
	other.water_level += level;
	
}else

// If water, transfer level
if(other.element == "Water")
{
	// Increment water level
	other.water_level += level;
		
}else

// Store water level when Ice to release when thawed
if(other.element == "Ice")
{
	other.water_level += level;
}

// Debug
//show_debug_message("other.water_level: " + string(other.water_level))


// Destroy self upon contact
instance_destroy()