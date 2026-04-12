/// @description

event_inherited()


// ** Used for elemental mechanics **

// Default is set to Empty
// May also be set to "Water", "Ice", or "Oil"
element = "Empty"

// Determines if the platform is flaming
is_flaming = false;

// Determines if flames are spawned to prevent duplication
flames_spawned = false



// Used for timer when turning water platform to ice
water_to_ice_length = game_get_speed(gamespeed_fps) * 5
water_to_ice_timer = 0
