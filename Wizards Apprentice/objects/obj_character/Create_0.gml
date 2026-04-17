

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


		
// Stun timer from charged platforms
plat_stun_length = game_get_speed(gamespeed_fps) * 1
plat_stun_timer = plat_stun_length;
		
// Used for timer for cooldown between being stunned
stun_cooldown_timer = 0
stun_cooldown_length = game_get_speed(gamespeed_fps) * 2