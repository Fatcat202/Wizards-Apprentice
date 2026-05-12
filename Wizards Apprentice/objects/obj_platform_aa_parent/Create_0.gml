/// @description

event_inherited()

// Surface to draw to
surf = -1

// X scale modifier for ground sprites
ground_x_scale = .5

half_sprite_width = sprite_width / 2
half_sprite_height = sprite_height / 2

ground_height = sprite_get_height(spr_tex_ground_testing)

// Used to determine if a platform is adjacent, booleans
search = 1
left = place_meeting(x - search, y, obj_platform_parent)
right = place_meeting(x + search, y, obj_platform_parent)
above = place_meeting(x, y - search, obj_platform_parent)
below = place_meeting(x, y + search, obj_platform_parent)


// Used for corners, booleans
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
			draw_sprite_ext(ground_texture, 0, 0, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	function ground_right()
	{
		if(right == false)
		{
			rotation = 270
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_width, 0 + sprite_yoffset, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	function ground_above()
	{
		if(above == false)
		{
			rotation = 0
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}
	
	function ground_below()
	{
		if(below == false)
		{
			rotation = 180
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset, 0 + sprite_height, image_xscale, image_yscale, rotation, c_white, 1);
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
		
		#region Ground Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x - sprite_width, y - sprite_height, obj_platform_parent)  && (left == true && above == true))
			{
				// Used to offset location of sprite
				var xx = -half_sprite_width
				var yy = -half_sprite_height
				var rotation = 45
				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
			}
		
		#endregion Ground Corner
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
		
		#region Ground Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x + sprite_width, y - sprite_height, obj_platform_parent)  && (right == true && above == true))
			{
				// Used to offset location of sprite
				var xx = half_sprite_width
				var yy = -half_sprite_height
				var rotation = 315
				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
			}
		
		#endregion Ground Corner
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
		
		#region Ground Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x + sprite_width, y + sprite_height, obj_platform_parent)  && (right == true && below == true))
			{scr_test()
				// Used to offset location of sprite
				var xx = half_sprite_width
				var yy = half_sprite_height
				var rotation = 225
				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
			}
		
		#endregion Ground Corner
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
		
		#region Ground Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x - sprite_width, y + sprite_height, obj_platform_parent)  && (left == true && below == true))
			{scr_test()
				// Used to offset location of sprite
				var xx = -half_sprite_width
				var yy = half_sprite_height
				var rotation = 135
				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
			}
		
		#endregion Ground Corner
	}
	
#endregion Ground Sprite Functions


