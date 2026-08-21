/// @description 


draw_self()

		
// Base color
var r = 255;
var g = 255;
var b = 255;
		
// If all chests found, turn blue
if(global.level_stats[room_num].level_chests_empty = true)
{
	r = 180;
	g = 180;
	b = 255;
}else

// If level completed, turn green
if(global.level_stats[room_num].level_completed = true)
{
	r = 180;
	g = 255;
	b = 180;
}

	
func_colour = function(r, g, b) constructor
{
	red = r;
	green = g;
	blue = b;
		
	// Quick gml to shader conversion
	static to_shader_value = function(value)
	{
		return value / 255;
	}
};
	
// Colour to search for for replacement
colour_match = new func_colour(255, 255, 255) // White
	
// Colour to replace matched colour with
colour_replace = new func_colour(r, g, b)
	
// Declare uniform values
shd_handle_range = shader_get_uniform(shd_replace_colour, "range");
shd_handle_match = shader_get_uniform(shd_replace_colour, "colour_match");
shd_handle_replace = shader_get_uniform(shd_replace_colour, "colour_replace");
	
	
// Create shader
shader_set(shd_replace_colour);
	
// Set range
shader_set_uniform_f(shd_handle_range, 1);
	
// Set colour match value
shader_set_uniform_f(shd_handle_match,
	colour_match.to_shader_value(colour_match.red),
	colour_match.to_shader_value(colour_match.green),
	colour_match.to_shader_value(colour_match.blue),
	);
	
// Set colour replace value
shader_set_uniform_f(shd_handle_replace,
	colour_replace.to_shader_value(colour_replace.red),
	colour_replace.to_shader_value(colour_replace.green),
	colour_replace.to_shader_value(colour_replace.blue),
	);

// Ensure base texture is set for the surface drawing
texture_set_stage(0, surface_get_texture(surf));
		
// Create surface
if(!surface_exists(surf))
{
	surf = surface_create(width, height);
		
	// Set surface target
	surface_set_target(surf)
		draw_clear_alpha(c_black, 0)
}else draw_clear_alpha(c_black, 0)


// Draw texture to the surface
draw_sprite(sprite, subimage, 0, 0);


// Reset surface target
surface_reset_target()

// Draw surface
draw_surface(surf, x, y);

// Free memory
surface_free(surf)

// End shader
shader_reset();


