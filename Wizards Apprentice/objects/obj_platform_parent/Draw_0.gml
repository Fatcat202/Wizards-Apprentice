/// @description


// Draws own sprite
draw_self()



#region Elements

	// Check for elements, and draw if activated

	if(is_wet == true)
	{
		draw_sprite(spr_element_water, 0, x, y)
	}else if(is_icy == true)
	{
		draw_sprite(spr_element_ice, 0, x, y)
	
	}else if(is_oily == true)
	{
		draw_sprite(spr_element_oil, 0, x, y)	
	}

#endregion Elements

