/// @description

event_inherited()


// Used for dynamic platform textures
platform_texture = sprite_index

sprite_half_height = sprite_height / 2
sprite_half_width = sprite_width / 2

// Assign textures
scr_texture_auto_assign()

// Distance to check for other platforms or objects
check_distance = 1

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

// Used for spreading oil effect. Represents number of platforms to spread to
oil_level = 0;

// Used to store id of platform water level will be transfered to
transfer_id = noone;
				
// Stores id of last platform water level was transfered from
transferred_from = noone


// Used to determine the amount of time platform will burn for if flaming oil, calculated with frames
// Default burn time in seconds
fuel_default = game_get_speed(gamespeed_fps) * 10;
// Number of frames remaining
fuel_left = fuel_default;
// Rate at which fuel will burn, stored in frames. Modified dynamically
fuel_burn_rate = 0;

// Store variables for flame objects
flame_0 = noone;
flame_1 = noone;
				


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
// Time for oil to spread to other platforms
spreading_oil_time = 0.5;
// Time for last platform transfered to to be saved
transfer_time = 1
// Time for a platform to create a water droplet
water_drop_time = 0.5
// Time for a platform to create a oil droplet
oil_drop_time = 0.5

// Time before last_transferred stored id is reset
transfer_timer_length = game_get_speed(gamespeed_fps) * transfer_time
transfer_timer = 0;

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

// Used for timer for spreading water between platforms
spreading_water_length = game_get_speed(gamespeed_fps) * spreading_water_time
spreading_water_timer = 0

// Used for timer for creating water droplets
water_drop_length = game_get_speed(gamespeed_fps) * water_drop_time;
water_drop_timer = 0;

// Used for timer for spreading oil between platforms
spreading_oil_length = game_get_speed(gamespeed_fps) * spreading_oil_time
spreading_oil_timer = 0

// Used for timer for creating oil droplets
oil_drop_length = game_get_speed(gamespeed_fps) * oil_drop_time;
oil_drop_timer = 0;

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

function func_create_water_droplet(dir)
{

	// Must pass through direction of water droplet in relation to platform
	// 0 is right, 1 is left
	
	// Start timer to create a droplet, based on spreading water timer
	if(water_drop_timer >= water_drop_length)
	{

		// Create right
		if(!place_meeting(x + check_distance, y, obj_platform_parent) && interacting == false && dir == 0)
		{
			water_droplet = instance_create_layer(x + sprite_get_width(sprite_index), y, "Spells", obj_element_water_droplet,
			{
				level : 1
			})
		}else
	
		// Create left
		if(!place_meeting(x - check_distance, y, obj_platform_parent) && interacting == false && dir == 1)
		{
			water_droplet = instance_create_layer(x - sprite_get_width(sprite_index), y, "Spells", obj_element_water_droplet,
			{
				level : 1
			})
		}
		
		// Decrease own water level by 1
		water_level--;
		
		// If water level reaches under 0
		if(water_level < 0)
		{
			// Set element to empty
			element = "Empty"
			
			// Reset water level to 0
			water_level = 0;
		}

		// Reset timer
		water_drop_timer = 0;
							
	// Increment timer
	} water_drop_timer++

}

function func_create_oil_droplet(dir)
{

	// Must pass through direction of oil droplet in relation to platform
	// 0 is right, 1 is left
	
	// Start timer to create a droplet, based on spreading oil timer
	if(oil_drop_timer >= oil_drop_length)
	{

		// Create right
		if(!place_meeting(x + check_distance, y, obj_platform_parent) && interacting == false && dir == 0)
		{
			oil_droplet = instance_create_layer(x + sprite_get_width(sprite_index), y, "Spells", obj_element_oil_droplet,
			{
				level : 1,
				is_flaming : is_flaming
			})
		}else
	
		// Create left
		if(!place_meeting(x - check_distance, y, obj_platform_parent) && interacting == false && dir == 1)
		{
			oil_droplet = instance_create_layer(x - sprite_get_width(sprite_index), y, "Spells", obj_element_oil_droplet,
			{
				level : 1,
				is_flaming : is_flaming
			})
		}
		
		// Decrease own oil level by 1
		oil_level--;
		
		// If oil level reaches under 0
		if(oil_level < 0)
		{
			// Set element to empty
			element = "Empty"
			
			// Reset oil level to 0
			oil_level = 0;
		}

		// Reset timer
		oil_drop_timer = 0;
							
	// Increment timer
	} oil_drop_timer++

}
