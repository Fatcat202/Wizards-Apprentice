/// @description Apply Texture




/* **TO DO**

Gather element of platform in top right/left and place the same element in top right/left of own platform
Do not display if located below another platform to prevent sprite from showing when platform is part of a wall


*/

function draw_element_above(rotation = 0, x_shift = 0, y_shift = 0)
{
	// ID of platform above
	var above_id = instance_place(x, y - sprite_height, obj_platform_parent);
	if(instance_exists(above_id))
	{
		// If platform above has an element
		if(variable_instance_exists(above_id, "element_draw"))
		{
			// Use same sprite as platform above
			element_draw = above_id.element_draw;

		
			// Draw element sprite
			if(element_draw != noone) draw_sprite_ext(element_draw, 0, 0 + sprite_xoffset + x_shift, 0 + sprite_yoffset + y_shift, image_xscale, image_xscale, rotation, c_white, 1)
		}
	}
}


// ** DOES NOT INHERIT PARENT EVENT**

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
	// Variables to shift ground sprite to position
	var xx = 0
	var y_shift = 16
	
	// image x and y scale shift for elements
	var ele_xscale = image_xscale + 0.5
	var ele_yscale = image_xscale - 0.2
	// x and y shift for elements
	var ele_x_shift = 9
	var ele_y_shift = 9


	if(object_index == obj_platform_aa_slope_right)
	{
		ground_left()
		ground_below()
	
		var rotation = 315

		#region Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x - sprite_width, y + sprite_height, obj_platform_parent) && (left == true && below == true))
			{
				// Used to offset location of sprite
				xx = -half_sprite_width
				var yy = half_sprite_height

				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, 135, c_white, 1);
			}
		
		#endregion Corner
		
		
		if(top_right == false)
		{
			// Used to offset location of sprite
			xx = 0
			var yy = 0
			
			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
		}
		
		// Draw element sprite
		func_elements(0 - ele_x_shift, 0 + ele_y_shift, ele_xscale, ele_yscale, 315)
	}

	if(object_index == obj_platform_aa_slope_left)
	{
		ground_right()
		ground_below()
		
		var rotation = 45
		
		#region Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x + sprite_width, y + sprite_height, obj_platform_parent) && (right == true && below == true))
			{
				// Used to offset location of sprite
				xx = half_sprite_width
				var yy = half_sprite_height

				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, 225, c_white, 1);
			}
		
		#endregion Corner
		
		if(top_left == false)
		{

			xx = 0
			var yy = 0

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
		}
		
		// Draw element sprite
		func_elements(0 + ele_x_shift, 0 + ele_y_shift, ele_xscale, ele_yscale, 45)
	}

	if(object_index == obj_platform_aa_slope_top_left)
	{
		ground_above()
		ground_left()
		
		var rotation = 225
		
		#region Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x - sprite_width, y - sprite_height, obj_platform_parent) && (left == true && above == true))
			{
				// Used to offset location of sprite
				xx = -half_sprite_width
				var yy = -half_sprite_height

				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, 45, c_white, 1);
			}
		
		#endregion Corner

		if(bottom_right == false)
		{

			// Used to offset location of sprite
			var yy = 0
			xx = 0

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);	
		}
		
		// Element of platform above in corner
		draw_element_above(45, -half_sprite_width/2, -half_sprite_height/2 + 1)
		
		// Draw element sprite
		func_elements(0, 0)
	}
		
	if(object_index == obj_platform_aa_slope_top_right)
	{
		ground_above()
		ground_right()
		
		var rotation = 135
	
		
		#region Corner
		
			// Check for and draw ground corner
			if(!place_meeting(x + sprite_width, y - sprite_height, obj_platform_parent)  && (right == true && above == true))
			{
				// Used to offset location of sprite
				xx = half_sprite_width
				var yy = -half_sprite_height

				draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, 315, c_white, 1);
			}
		
		#endregion Corner


		if(bottom_left == false)
		{
			// Used to offset location of sprite
			xx = 0
			var yy = 0

			// Draw ground overlap texture
			draw_sprite_ext(ground_texture, 0, 0 + sprite_xoffset + xx, 0 + sprite_yoffset + yy, image_xscale + ground_x_scale, image_yscale, rotation, c_white, 1);
		}
		
		// Element of platform above in corner
		draw_element_above(315, half_sprite_width/2, -half_sprite_height/2 + 1)
		
		// Draw element spritae
		func_elements(0, 0)
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
	
	// Draw element sprite
	func_elements(0, 0)
	
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

// Free memory
//surface_free(surf)

// End shader
shader_reset();


#region Debug

	// Debug display settings
	draw_set_font(fnt_platform_debug)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_center)

	// Display Water Level
	if(water_level > 0 || oil_level > 0) 
	{
		// Display water level
		draw_text(x, y - 10, "WL: " + string(water_level))
		
		// Displaying oil level
		draw_text(x, y, "OL: " + string(oil_level))
	
		// Displaying fuel_left
		draw_text(x, y + 10, "FL: " + string(fuel_left))
	}

	
#endregion Debug