/// @description

// Create shader
shader_set(shd_platform_display);

// Send shape to the shader
var sampler_other = shader_get_sampler_index(shd_platform_display, "shape_texture");
texture_set_stage(sampler_other, sprite_get_texture(sprite_index, 0));

// Ensure base texture is set for the surface drawing
texture_set_stage(0, surface_get_texture(surf));
		
// Create surface
if(!surface_exists(surf))
{
	surf = surface_create(sprite_width, sprite_height);
		
	// Set surface target
	surface_set_target(surf)
		draw_clear_alpha(c_black, 0)
}
	
// Set surface target
surface_set_target(surf);
	draw_clear_alpha(c_black, 0)

// Draw texture to the surface
draw_sprite_ext(sprite_index, 0, 0 + sprite_xoffset, 0 + sprite_yoffset, image_xscale, image_yscale, 0, c_white, 1);


// Draw elements
func_elements(0, 0, image_xscale, image_yscale, 0)


// Reset surface target
surface_reset_target()

// Draw surface
draw_surface(surf, x - sprite_xoffset, y - sprite_yoffset);

// Free memory
//surface_free(surf)

// End shader
shader_reset();

