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

search = 1
// Used for corners
top_left = place_meeting(x - search, y - search, obj_platform_parent)
top_right = place_meeting(x + search, y - search, obj_platform_parent)
bottom_left = place_meeting(x - search, y + search, obj_platform_parent)
bottom_right = place_meeting(x + search, y + search, obj_platform_parent)




#region Ground Sprite Functions

	rotation = 0
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
	
	function ground_top_left()
	{
		if(top_left == true)
		{
			var corner_top_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_left");
			texture_set_stage(corner_top_left, sprite_get_texture(spr_plat_aa_corner, 1));

		}else
		{
			var corner_top_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_left");
			texture_set_stage(corner_top_left, sprite_get_texture(spr_plat_aa_corner, 0));
		}
	}
	
	function ground_top_right()
	{
		if(top_right == true)
		{
			var corner_top_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_right");
			texture_set_stage(corner_top_right, sprite_get_texture(spr_plat_aa_corner, 2));

		}else
		{
			var corner_top_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_right");
			texture_set_stage(corner_top_right, sprite_get_texture(spr_plat_aa_corner, 0));
		}
	}
	
	function ground_bottom_right()
	{
		if(bottom_right == true)
		{
			var corner_bottom_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_right");
			texture_set_stage(corner_bottom_right, sprite_get_texture(spr_plat_aa_corner, 3));

		}else
		{
			var corner_bottom_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_right");
			texture_set_stage(corner_bottom_right, sprite_get_texture(spr_plat_aa_corner, 0));
		}
	}
	
	function ground_bottom_left()
	{
		if(bottom_left == true)
		{
			var corner_bottom_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_left");
			texture_set_stage(corner_bottom_left, sprite_get_texture(spr_plat_aa_corner, 4));

		}else
		{
			var corner_bottom_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_left");
			texture_set_stage(corner_bottom_left, sprite_get_texture(spr_plat_aa_corner, 0));
		}
	}
#endregion Ground Sprite Functions


