/// @description

event_inherited()

// Surface to draw to
surf = -1


// Used to determine if a platform is adjacent, booleans
search = 1
left = place_meeting(x - search, y, obj_platform_parent)
right = place_meeting(x + search, y, obj_platform_parent)
above = place_meeting(x, y - search, obj_platform_parent)
below = place_meeting(x, y + search, obj_platform_parent)


#region Ground Sprite Functions
	function ground_left()
	{
		if(left == false)
		{
			rotation = 90
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	function ground_right()
	{
		if(right == false)
		{
			rotation = 270
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	function ground_above()
	{
		if(above == false)
		{
			rotation = 0
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}
	function ground_below()
	{
		if(below == false)
		{
			rotation = 180
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}
#endregion Ground Sprite Functions