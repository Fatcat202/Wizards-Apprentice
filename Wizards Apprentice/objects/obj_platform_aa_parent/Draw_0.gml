/// @description Apply Texture


// Create shader
shader_set(shd_platform_multi_texture);

// Send shape to the shader
var sampler_other = shader_get_sampler_index(shd_platform_multi_texture, "shape_texture");
texture_set_stage(sampler_other, sprite_get_texture(sprite_index, subimage));

// Ensure base texture is set for the surface drawing
texture_set_stage(0, surface_get_texture(surf));
		
// Create surface
if(!surface_exists(surf))
{
	surf = surface_create(sprite_width, sprite_height);
		
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0);
}
	
// Set surface target
surface_set_target(surf);
	

// Draw texture to the surface
draw_sprite_ext(platform_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, 0, c_white, 1);


// If platform is a slope
if(object_is_ancestor(object_index, obj_platform_aa_slope_parent))
{
	// Variables to offset location of sprites
	var x_shift = 0
	var y_shift = 16
	

	if(object_index == obj_platform_aa_slope_left)
	{
		ground_left()
		ground_below()
		

		if(top_right == false)
		{
			var rotation = 135
			// Used to offset location of sprite
			var xx = x_shift
			var yy = -y_shift
		
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	if(object_index == obj_platform_aa_slope_right)
	{
		ground_right()
		ground_below()
		
		if(top_left == false)
		{
			var rotation = 225
			var xx = -x_shift
			var yy = -y_shift

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale, image_yscale, rotation, c_white, 1);
		}
	}

	if(object_index == obj_platform_aa_slope_top_left) // **NOT WORKING**
	{
		ground_above()
		ground_left()
		

		if(bottom_right == false)
		{
			var rotation = 45
			// Used to offset location of sprite
			var xx = x_shift
			var yy = y_shift

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale, image_yscale, rotation, c_white, 1);	
		
		}
	}
		
	if(object_index == obj_platform_aa_slope_top_right) // **NOT WORKING**
	{
		ground_above()
		ground_right()


		if(bottom_left == false)
		{
			var rotation = 315
			// Used to offset location of sprite
			var xx = -x_shift
			var yy = y_shift

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale, image_yscale, rotation, c_white, 1);
		}
		
	}
	
	
	// Default blank corners
	var corner_top_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_left");
	texture_set_stage(corner_top_left, sprite_get_texture(spr_plat_aa_corner, 0));
	
	var corner_top_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_top_right");
	texture_set_stage(corner_top_right, sprite_get_texture(spr_plat_aa_corner, 0));
	
	var corner_bottom_left = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_left");
	texture_set_stage(corner_bottom_left, sprite_get_texture(spr_plat_aa_corner, 0));
	
	var corner_bottom_right = shader_get_sampler_index(shd_platform_multi_texture, "corner_bottom_right");
	texture_set_stage(corner_bottom_right, sprite_get_texture(spr_plat_aa_corner, 0));
	
		
}else if(obj_platform_aa_square)// If the platform is not a slope
{
	// Default sides
	ground_left()
	ground_right()
	ground_above()
	ground_below()
	
	// Corners
	ground_top_left()
	ground_top_right()
	ground_bottom_left()
	ground_bottom_right()
}

// Reset surface target
surface_reset_target()

// Draw surface
draw_surface(surf, x - sprite_xoffset, y - sprite_yoffset);

// End shader
shader_reset();


// Inherit the parent event
event_inherited();	