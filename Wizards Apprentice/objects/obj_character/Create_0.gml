

event_inherited()

// Used to decide if character can take damage
can_damage = true

// Used for deciding if the character is able to attack
can_attack = true;
	
// Determines if the character is stunned
is_stunned = false

// Determines if the player is stunned by a platform
plat_stunned = false;

// Determines if the character can be stunned
can_be_stunned = true

// Tells the object is not semi solid, can be changed to pass through other semi solid
semi_solid = false;

// Character current health
active_health = 1;

// Stores the type of element shield the character has, default "Empty"
element_shield = "Empty";

// Base health of shield
shield_health = 4;

// Active health of shield
active_shield_health = 0;

// Default time for timers, in seconds
plat_stun_time = 1
stun_cooldown_time = 2
stun_time = 1
ignite_time = 1
knockback_time = 1
poison_time = 1
freeze_time = 1
slow_time = 1
shield_time = 1

//Ticks
// Used for counting down certain effects, eg. DOT
poison_ticks = 0;
ignite_ticks = 0;
shield_ticks = 4;


// Stun timer from charged platforms
plat_stun_length_base = game_get_speed(gamespeed_fps) * plat_stun_time;
plat_stun_length = plat_stun_length_base
plat_stun_timer = plat_stun_length;
		
// Used for timer for cooldown between being stunned
stun_cooldown_timer = 0;
stun_cooldown_length_base = game_get_speed(gamespeed_fps) * stun_cooldown_time;
stun_cooldown_length = stun_cooldown_length_base;

// Used for timer for duration of stun
is_stunned = false;
stun_timer = 0;
stun_length_base = game_get_speed(gamespeed_fps) * stun_time;
stun_length = stun_length_base;

// Used for timer for duration of knockback
is_knockedback = false;
knockback_timer = 0;
knockback_length_base = game_get_speed(gamespeed_fps) * knockback_time;
knockback_length = knockback_length_base;

// Used for timer for duration of ignite
is_ignited = false;
ignite_timer = 0;
ignite_length_base = game_get_speed(gamespeed_fps) * ignite_time;
ignite_length = ignite_length_base;

// Used for timer for duration of poison
is_poisoned = false;
poison_timer = 0;
poison_length_base = game_get_speed(gamespeed_fps) * poison_time;
poison_length = poison_length_base;

// Used for timer for duration of freeze
is_frozen = false;
freeze_timer = 0;
freeze_length_base = game_get_speed(gamespeed_fps) * freeze_time;
freeze_length = freeze_length_base;

// Used for timer for duration of slow
is_slowed = false;
slow_timer = 0;
slow_length_base = game_get_speed(gamespeed_fps) * slow_time;
slow_length = slow_length_base;

// Used for timer for duration of shield
is_shielded = false;
shield_timer = 0;
shield_length_base = game_get_speed(gamespeed_fps) * shield_time;
shield_length = shield_length_base;










