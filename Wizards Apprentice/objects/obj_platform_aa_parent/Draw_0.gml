/// @description Apply Texture


#region Dynamic Textures
	ground_texture = spr_tex_ground_stone
	
	// Create shader
	shader_set(shd_platform_multi_texture);

	var sampler_other = shader_get_sampler_index(shd_platform_multi_texture, "shape_texture");
	texture_set_stage(sampler_other, sprite_get_texture(sprite_index, subimage));
	
	
	// Create surface
	if(!surface_exists(surf))
	{
		surf = surface_create(sprite_width, sprite_height);
		
		surface_set_target(surf)
		draw_clear_alpha(c_black, 0);
	}
	
	// Set surface target
	surface_set_target(surf);
	
	// Draw sprite to surface
	draw_sprite_ext(platform_texture, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, 0, c_white, 1);



	// Rotation of overlap sprite
	var rotation = 0

	// If platform is a slope
	if(object_is_ancestor(object_index, obj_platform_aa_slope_parent))
	{
		
		
		if(obj_platform_aa_slope_left)
		{
			ground_left()
			ground_below()
		}else
		
		if(obj_platform_aa_slope_right)
		{
			ground_right()
			ground_below()
		}else
		
		if(obj_platform_aa_slope_top_left)
		{
			ground_left()
			ground_above()
		}else
		
		if(obj_platform_aa_slope_top_right)
		{
			ground_right()
			ground_above()
		}
		
		
	}else // If the platform is not a slope
	{
		ground_left()
		ground_right()
		ground_above()
		ground_below()
		
	}
	
	
	
	
	
	
	
	
	// Reset surface target
	surface_reset_target()
	
	// Draw surface
	draw_surface(surf, x - sprite_xoffset, y - sprite_yoffset);
	
	// End shader
	shader_reset();

#endregion Dynamic Textures


// Inherit the parent event
event_inherited();