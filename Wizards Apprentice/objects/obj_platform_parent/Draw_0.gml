/// @description


// Draws own sprite
draw_self()



#region Elements

	// Check for elements, and draw if activated

	// Stores sprite of element to draw
	var element_draw = noone
	
	// Used for scaling element sprite
	element_xscale = image_xscale
	element_yscale = image_yscale

	if(element == "Water")
	{
		// Check if water is charged
		if(is_charged == true)
		{
			element_draw = spr_element_water_charged
		}else
		{
			element_draw = spr_element_water
		}
	}else if(element == "Ice")
	{
		element_draw = spr_element_ice
	
	}else if(element == "Oil")
	{
		element_draw = spr_element_oil
	}
	
	if(element_draw != noone) draw_sprite_ext(element_draw, 0, x, y, element_xscale, element_yscale, 0, c_white, 1)

#endregion Elements

