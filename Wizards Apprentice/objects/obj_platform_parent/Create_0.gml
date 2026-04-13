/// @description

event_inherited()


// ** Used for elemental mechanics **

// Default is set to Empty
// May also be set to "Water", "Ice", or "Oil"
element = "Empty"

// Determines if the platform is steaming
is_steaming = false;

// Determines if steam is spawned to prevent duplication
steam_spawned = false;

// Determines if the platform is flaming
is_flaming = false;

// Determines if flames are spawned to prevent duplication
flames_spawned = false

// Time for water to freeze
freezing_time = 5
// Time for fire to spread
spreading_fire_time = 0.5
// Timer for ice to melt
melting_time = 4
// Time for water to evaporate
evaporation_time = 4


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
