/// @description Platform Interactions

// Change platform to oil if empty, transfer remaining oil level
if(other.element == "Empty")
{
	// Change element to oil
	other.element = "Oil"

	// Increment oil level
	other.oil_level += level;
	
	// Transfer fuel left
	other.fuel_left = fuel_left;
	
	// Transfer flaming state
	if(is_flaming == true) other.is_flaming = true;
	
}else

// If oil, transfer level
if(other.element == "Oil")
{
	// Increment oil level
	other.oil_level += level;
	
	// Transfer flaming state
	if(is_flaming == true) other.is_flaming = true;
}

// Debug
//show_debug_message("other.oil_level: " + string(other.oil_level))


// Destroy self upon contact
instance_destroy()