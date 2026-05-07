/// @description

event_inherited()


// Used for dynamic platform textures
platform_texture = sprite_index

sprite_half_height = sprite_height / 2
sprite_half_width = sprite_width / 2

// Assign textures
scr_texture_auto_assign()

// Used to modify image_index
subimage = 0

// Surface the sprite and all modifications are drawn to
surf = -1;

// Default is set to Empty
// May also be set to "Water", "Ice", or "Oil"
element = "Empty"

// Used for gathering and holding ID of other platform being interacted with
other_id = noone

// Determines if interaction is ongoing 
interacting = false

// Determines if the platform is charged
is_charged = false;

// Amount of time a charged platform will stun a character
shock_duration = game_get_speed(gamespeed_fps) * 2

// Determines if the platform is steaming
is_steaming = false;

// Determines if steam is spawned to prevent duplication
steam_spawned = false;

// Determines if the platform is flaming
is_flaming = false;

// Determines if flames are spawned to prevent duplication
flames_spawned = false

// Used for spreading water effect. Represents number of platforms to spread to
water_level = 0;

// Time for water to freeze
freezing_time = 5;
// Time for fire to spread
spreading_fire_time = 0.5;
// Timer for ice to melt
melting_time = 4;
// Time for water to evaporate
evaporation_time = 4;
// Time for water to spread to other platforms
spreading_water_time = 0.5;

// Used for timer when turning water platform to ice
freeze_length = game_get_speed(gamespeed_fps) * freezing_time
freeze_timer = 0

// Used for timer when spreading flaming oil
spreading_fire_length = game_get_speed(gamespeed_fps) * spreading_fire_time
spreading_fire_timer = 0

// Used for timer when turning ice to water
melting_ice_length = game_get_speed(gamespeed_fps) * melting_time
melting_ice_timer = 0

// Used for timer when turning water platform to steam
evaporation_length = game_get_speed(gamespeed_fps) * evaporation_time
evaporation_timer = 0

spreading_water_length = game_get_speed(gamespeed_fps) * spreading_water_time
spreading_water_timer = 0

// Checks cardinal direction to detect if platform is touching another
above_free = !place_meeting(x, y - sprite_height, obj_platform_parent)
below_free = !place_meeting(x, y + sprite_height, obj_platform_parent)
right_free = !place_meeting(x + sprite_width, y, obj_platform_parent)
left_free = !place_meeting(x - sprite_width, y, obj_platform_parent)

// Check corners to detect if platform is touching another
top_right_free = !place_meeting(x + sprite_width, y - sprite_height, obj_platform_parent)
top_left_free = !place_meeting(x - sprite_width, y - sprite_height, obj_platform_parent)
bottom_right_free = !place_meeting(x + sprite_width, y + sprite_height, obj_platform_parent)
bottom_left_free = !place_meeting(x - sprite_width, y + sprite_height, obj_platform_parent)


function func_elements(xx = 0, yy = 0, xx_scale = image_xscale, yy_scale = image_yscale, rot = 0)
{
	// Used to display element sprites on platforms

	// Check for elements, and draw if activated

	// Stores sprite of element to draw
	var element_draw = noone

	if(element == "Water")
	{
		// Check if water is charged
		if(is_charged == true)
		{
			element_draw = spr_element_water_charged
		}else
		{
			element_draw = spr_element_water
		}
	}else if(element == "Ice")
	{
		element_draw = spr_element_ice
	
	}else if(element == "Oil")
	{
		element_draw = spr_element_oil
	}
	
	if(element_draw != noone)
	{
		draw_sprite_ext(element_draw, 0, xx + sprite_xoffset, yy + sprite_yoffset, xx_scale, yy_scale, rot, c_white, 1)
	}
}
