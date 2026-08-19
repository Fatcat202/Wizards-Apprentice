event_inherited()

scr_memory_used()

#region Loading instance stats


	// Health
		// Normal max health
		base_max_health = 1 + global.vitality;
		// Adjusted max health after drain
		max_health = base_max_health;
		// Total health drained from normal max
		health_drain = 0;
		// Current health
		active_health = max_health;

	// Mana
		// Normal max mana
		base_max_mana = 1 + global.intelligence
		// Adjusted max mana after drain
		max_mana = base_max_mana;
		// Total mana drained from normal max
		mana_drain = 0;
		// Current mana
		active_mana = max_mana;
	

	// Max speed
		// Default modifier
		move_spd_max_default = 3.9 + (global.dexterity * 0.1);
		// Used to modify speeds
		move_spd_max = move_spd_max_default;
		// Movement speed when jumping
		jump_speed = 5.4 + (global.dexterity * 0.1);
		//Terminal Velocity
		term_vel = -(jump_speed + 2)
		// Horizontal movement acceleration rate. 0 is instant, 1 is nothing
			// Default modifier
			h_acel_default = 0.5
			// Modifier to be used
			h_acel = h_acel_default
		// Horizontal movement deceleration rate. 0 is instant, 1 is nothing
			// Default modifier
			h_decel_default = 0.4
			// Modifier to be used
			h_decel = h_decel_default
	
	// Current horizontal move speed, used for acceleraton/deceleration
	move_spd_h = 0;
	// Current vertical move speed, used for acceleraton/deceleration
	move_spd_v = 0;
	
	// Used for modifying movement speed when the player is on a specific platform element
	
		// Sets default
		plat_spd_default = 1
	
		// Used to modify speeds
		plat_spd_mod = plat_spd_default
	
		// Modifies move speed when on oil
		plat_spd_oil = 0.4
		
		// Modifies acceleration on ice
		plat_spd_acel_ice = 0.6
		// Modifies deceleration on ice
		plat_spd_decel_ice = 2.3
	
	
	// Determines if the player is invisible
	invisible = false
	
	// Blank surface to assignment
	surf = -1
	
	// Variable to determine if player is walking
	is_walking = false;
	
	// Sets initial default for state_move to idle
	state_move_free = noone
	
	// Collision speed, used for collision logic
	collision_speed = global.collision_distance
	
	// Used to determine if the player is solid for the purposes of semi solid objects
	semi_solid = false
	
	// Normal max jumps
	base_max_jumps = 0;
	// Adjusted jumps
	max_jumps = 1;
	// Jumps remaining
	jumps_left = max_jumps
	
	// Actively selected spell
	active_spell = 1;
	
	// Variable determining total spells player will be able to select between in spellbook, alongside spell cost
	memory = global.memory;
	
	// Total number of spells memorised
	total_spells = 10


	#region Timers
	
		// Coyote timer
		coyote_time_timer = 0;
		// Length of coyote time, measured in cycles
		coyote_time_length = 3;
	
		// Jump buffer timer
		jump_buffer_timer = 0;
		// Length of jump buffer, measured in cycles
		jump_buffer_length = 5
		// Used to determine if a jump has been buffered
		jump_key_buffered = false
	
		// Holding jump timer
		jump_hold_timer = 0;
		// Maximum number of cycles for held jump before gravity kicks in
		jump_hold_frames = 12;
		
		// Timer for mana regen
		mana_regen_timer = 0
		// Time between mana regenerating in seconds
		mana_regen_length = game_get_speed(gamespeed_fps) * 0.5;
		
		mana_regen_delay_timer = 0;
		// Time before mana starts to regenerate after last use in seconds. Subtract mana_regen_length to prevent doubling up timers
		mana_regen_delay_length = (game_get_speed(gamespeed_fps) * 4) - mana_regen_length;

	
		#region Spell Slot Timers
			
			// Constructor holding timer variables for active spells
			function func_spell_timers(_cooldown = false, _timer = 0, _length = 0) constructor
			{
				cooldown = _cooldown
				timer = _timer
				length = _length
			}
			
			// Hold within variables for each active spell
			global.arr_spell_timers = []
			
			// Place structs into array
			for(var i = 1; i <= global.max_spell_slots; i++)
			{
				global.arr_spell_timers[i] = new func_spell_timers(false, 0 , global.active_spells[0,i].cooldown)
			}


		#endregion Spell Slot Timers
		
	
		#region Effect Timers
	
			// Jump spell timers
				spell_jump_duration = 0;
				spell_jump_timer = 0;
				// Determines if spell if active
				spell_jump_active = false;
				// Used for passing through spell slot when duration is over
				spell_jump_slot = -1;



		#endregion Effect Timers
	
#endregion Loading instance stats


#region Jump States

	// Applies when the player is not jumping or falling
	state_idle = function()
	{

		state_move_free = state_idle;
		//show_debug_message("Jump State: Idle");
	}

	// Applies when player is jumping
	state_jumping = function()
	{

		state_move_free = state_jumping;
		//show_debug_message("Jump State: Jumping");
	}

	// Applies when player is falling
	state_falling = function()
	{

		state_move_free = state_falling;
		//show_debug_message("Jump State: Falling");
	}
	
	// Applies when player is falling
	state_crouch = function()
	{
		

		state_move_free = state_crouch;
		//show_debug_message("Jump State: Falling");
	}

	state_move = state_idle;
	
#endregion Jump States

spell_surf = -1

function func_spell_slot_icon(sprite, xx, yy, subimage, i, r = 255, g = 255, b = 255, cooldown_timer, cooldown_length)
{
	// Called in Draw GUI - Spells
	
	// Display surface with spell slot icon drawn to it
	// Pass through RGB values of background colour of icon (default is white)

	
	var spell_width = sprite_get_width(spr_spell_slot_template)
	var spell_height = sprite_get_height(spr_spell_slot_template)
	var spell_spacing = (spell_width);
	var spell_margin_x =  xx - (((total_spells + 1) * spell_width))/2
	var spell_margin_y = ((yy * 2) - (spell_height / 2)) - 35;
	
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
	texture_set_stage(0, surface_get_texture(spell_surf));
		
	// Create surface
	if(!surface_exists(spell_surf))
	{
		spell_surf = surface_create(spell_width, spell_height);
		
		// Set surface target
		surface_set_target(spell_surf)
			draw_clear_alpha(c_black, 0)
	}else draw_clear_alpha(c_black, 0)


	// Draw texture to the surface
	draw_sprite(sprite, subimage, 0, 0);
	
	// Apply cooldown circle
	scr_draw_circ_healthbar(spell_width/2, spell_height/2, cooldown_timer, cooldown_length, c_black, spell_width, 0.5)


	// Reset surface target
	surface_reset_target()

	// Draw surface
	draw_surface(spell_surf, spell_margin_x + (i * spell_spacing), spell_margin_y);

	// Free memory
	surface_free(spell_surf)

	// End shader
	shader_reset();
	
}

