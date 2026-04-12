/// @description


// Draws own sprite
draw_self()



#region Elements

	// Check for elements, and draw if activated

	if(element == "Water")
	{
		draw_sprite(spr_element_water, 0, x, y)
	}else if(element == "Ice")
	{
		draw_sprite(spr_element_ice, 0, x, y)
	
	}else if(element == "Oil")
	{
		draw_sprite(spr_element_oil, 0, x, y)	
	}

#endregion Elements

