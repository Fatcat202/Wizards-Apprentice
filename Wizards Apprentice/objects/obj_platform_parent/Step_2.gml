/// @description Droplets / Reset

#region Water Droplets
	if(water_level > 0 && above_free == false)
	{
		// Instantly create droplet
		water_drop_timer = water_drop_length;
	
		if(below_free)
		{
			func_create_water_droplet(2)
		}else
	
		if(right_free)
		{
			func_create_water_droplet(0)
		}else
	
		if(left_free)
		{
			func_create_water_droplet(1)
		}else
		{
			scr_element_reset_variables()
		}
#endregion Water Droplets
	
}else

#region Oil Droplets

	if(oil_level > 0 && above_free == false)
	{
		// Instantly create droplet
		oil_drop_timer = oil_drop_length;
	
		if(below_free)
		{
			func_create_oil_droplet(2)
		}else
	
		if(right_free)
		{
			func_create_oil_droplet(0)
		}else
	
		if(left_free)
		{
			func_create_oil_droplet(1)
		}else
		{
			scr_element_reset_variables()
		}
	}

#endregion Oil Droplets

// Check if previous frame there was an element, and now there is none
if(previous_frame_had_element == true && scr_has_no_element(id))
{
	// Reset all variables
	scr_element_reset_variables()
}else previous_frame_had_element = !scr_has_no_element(id)


