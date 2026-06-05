/// @description Platform Interactions

// If platform has no oil level, transfer existing fuel left
if(other.oil_level == 0)
{
	// Increment oil level
	other.oil_level += level;
	
	// Transfer fuel left
	other.fuel_left = fuel_left;
	
	// Transfer flaming state
	other.is_flaming = is_flaming;
	
}else
// If oil, transfer level but not fuel left
if(other.oil_level > 0)
{
	// Increment oil level
	other.oil_level += level;
	
	// Transfer flaming state
	if(is_flaming == true) other.is_flaming = true;
}


// If water, cause platform to steam
if(other.water_level > 0 && is_flaming == true)
{
	other.is_steaming = true
}

// Debug
//show_debug_message("other.oil_level: " + string(other.oil_level))


// Destroy self upon contact
instance_destroy()