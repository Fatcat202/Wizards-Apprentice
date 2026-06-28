
// Randomise variables in testing
randomise()



#region Enums
	
	enum item_names // Positions of items in database array
	{
		empty,
		health_potion_light,
		health_potion_moderate,
		health_potion_severe,
		health_potion_critical
	}
	
	enum stats // Positions of stats
	{
		VITALITY,
		DEXTERITY,
		INTELLIGENCE,
		MEMORY,
		CHARISMA
	}

#endregion Enums



#region Global Variables

	#region Variables
	
	
		// Sets how many pixel away objects must be from another object to collide 
		// (x2 if both move towards each other)
		global.collision_distance = 0.5;
		
		// Number of frames to apply invincibility after taking damage
		global.i_frames = 15;
		
		// Gravity, used for deceleration when jumping and acceleration when falling
		global.grav = 0.275
		
		// Size of cells used for pathing
		global.cell_size = 32
		
		// Half size of cells
		global.half_cell = global.cell_size/2
		
		// MP Grid used for pathing
		global.mp_grid = mp_grid_create(0, 0, room_width / (global.cell_size/2), room_height / (global.cell_size/2), (global.cell_size/2), (global.cell_size/2));
			// Update grid to show positions of obstacles
			mp_grid_clear_all(global.mp_grid)
			mp_grid_add_instances(global.mp_grid, obj_platform_solid_parent, true);
	
	
		#region Camera
	
			// Storing previous frames mouse location in relation to GUI
			global.mouse_x_previous = device_mouse_x_to_gui(0);
			global.mouse_y_previous = device_mouse_y_to_gui(0);
	
			// Camera smoothing speed
			global.cam_smoothing = 0.3;
		
			// Camera target position
			global.cam_target_x = 0;
			global.cam_target_y = 0;
		
			// Camera origin
			global.cam_x = camera_get_view_x(CAMERA);
			global.cam_y = camera_get_view_y(CAMERA);
		
			// Camera size
			global.cam_w = camera_get_view_width(CAMERA);
			global.cam_h = camera_get_view_height(CAMERA);
	
	
		#endregion Camera
		
		#region Pausing
		
			// Declares a cutscene is active
			global.cutscene_active = false;
			
			// Declares the game is paused
			global.game_paused = false;
			
				// Specify the type of game pause
				global.game_esc_paused = false;
				global.game_death_paused = false;
				global.show_inventory = false;
			
		#endregion Pausing
		
		#region Inventory
		
			// Toggles showing the inventory
			global.show_inventory = false
			
			// Total number of inventory slots
			global.inventory_slots = 15
			
			// Player inventory
			global.inventory = array_create(global.inventory_slots, -1)

			
			// Total player gold
			global.player_gold = 1000;
			
			// Declares if the player can be controlled
			global.can_control_player = true



		#endregion Inventory
		
		#region Player Stats
			
			// Held and created here, used to determine characteristics of the player
			
			// Normally set to 1 when not testing
			global.vitality = 1;
			global.intelligence = 1;
			global.dexterity = 1;
			global.memory = 1;
			global.charisma = 1;
			
			global.stat_max = 20;
			
			
			// Total number of assigned levels
			global.player_level = 1;
			
			// Holds levels to be assigned
			global.player_free_level = 0;
			
			// Total player xp
			global.player_xp = 0;
			
			// XP needed for next level
			global.player_xp_next_level = global.player_level * 1000;
			
		#endregion Player Stats
		
		#region Spellbook
		
			// Number of slots per row
			global.spellbook_row_length = 6;
			
			// Number of rows
			global.spellbook_row_number = 3;
			
			// Number of spells per page
			global.spells_per_page = global.spellbook_row_number * global.spellbook_row_length;
	
			// Total pages in spellbook
			global.spellbook_total_pages = 2;
	
			// Set all slots in spellbook to -1
			// Loop through pages
			for(var p = 0; p <= global.spellbook_total_pages; p++)
			{	
				// Loop through slots on each page
				for(var i = 0; i < global.spells_per_page; i++)
				{
					// Set spellbook slots to -1
					global.spellbook[p, i] = -1;
				}
			}
			
			// Page buttons
			global.arr_page_buttons = [obj_button_page_1, obj_button_page_2, obj_button_page_3, obj_button_page_4];
			
			// Array of usable spells
			global.active_spells = []
			
			// Max number of active spell slots
			global.max_spell_slots = 10;
			
		#endregion Spellbook

		#region Database
	
			#region Spell Stats
			
				// Create spell_index_length for tracking total number of spell in csv
				global.spell_index_length = 0;

				// Create spell_stats array for tracking stats
				global.spell_stats[0] = 0;

				// Initialize spell index arrays
				global.arr_spell_index_name[0] = "No valid spell name";
	
	

				var ds_spell_stats_csv = load_csv("spell_data.csv");

				// Ensure the grid is valid
				if (ds_spell_stats_csv == -1) {
				    show_error("Failed to load CSV file.", true);
				    exit;
				}

				// Initialize stats dictionary constructor
				function spell_stats(_spell_level = -1, _spell_damage = -1, _spell_atk_speed = -1, _spell_cooldown = -1, _spell_mana = -1, _spell_memory = -1, _spell_uses = -1, _spell_duration = -1, _spell_element = -1, _spell_title = "Empty", _spell_desc = "Empty", _spell_spr = -1, _spell_script = -1) constructor {
				
					level = _spell_level
					damage = _spell_damage
					atk_spd = _spell_atk_speed
					cooldown = _spell_cooldown
					mana = _spell_mana
					memory = _spell_memory
					uses = _spell_uses
					duration = _spell_duration
					element = _spell_element
					title = _spell_title
					desc = _spell_desc
					spr = _spell_spr
					scr = _spell_script

				}

				// Declare length of spell index based on adjusted CSV height
				global.spell_index_length = ds_grid_height(ds_spell_stats_csv) - 1
			
				// Create spell_stats struct array
				for(var i = 1; i <= global.spell_index_length; i++)
				{
					global.spell_stats[i] = new spell_stats();
				}

				// Assign all values from CSV file into stats database structs
				for(var i = 0; i < global.spell_index_length; i++)
				{
					var yy = i + 1;
					var xx = 1;
				
					global.spell_stats[yy].level = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].damage = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].atk_speed = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].cooldown = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].mana = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].memory = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].uses = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].duration = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].element = string(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].title = string(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].description = string(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++
					global.spell_stats[yy].spr = asset_get_index(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].scr = asset_get_index(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
	
				}


				// Assign data to spell index arrays
				for(var p = 0; p < global.spell_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_spell_index_name[n] = ds_grid_get(ds_spell_stats_csv, 0, n);
				}
			
	
				// Cleanup DS grid
				ds_grid_destroy(ds_spell_stats_csv);
			
				// Debug testing
				
			//	show_debug_message("Spell Constructor List: " + string(global.spell_stats))
			//	show_debug_message("global.spell_index_length: " + string(global.spell_index_length))
			//	show_debug_message("global.arr_spell_index_name: " + string(global.arr_spell_index_name))
				
	
			#endregion Spell Stats
			
			#region Enemy Stats
				
				// Create enemy_index_length for tracking total number of enemy in csv
				global.enemy_index_length = 0;

				// Create enemy_stats array for tracking stats
				global.enemy_stats[0] = 0;

				// Initialize enemy index arrays
				global.arr_enemy_index_name[0] = "No valid enemy name";
	
	

				var ds_enemy_stats_csv = load_csv("enemy_data.csv");

				// Ensure the grid is valid
				if (ds_enemy_stats_csv == -1) {
				    show_error("Failed to load CSV file.", true);
				    exit;
				}

				// Initialize stats dictionary constructor
				function enemy_stats(_hp = -1, _damage = -1, _atk_spd = -1, _move_spd = -1, _flies = -1, _can_jump = -1, _vision_range = -1, _caster = -1, _xp = -1) constructor {
				
					hp = _hp
					damage = _damage
					atk_spd = _atk_spd
					move_spd = _move_spd
					flies = _flies
					can_jump = _can_jump
					vision_range = _vision_range
					caster = _caster
					xp = _xp

				}

				// Declare length of enemy index based on adjusted CSV height
				global.enemy_index_length = ds_grid_height(ds_enemy_stats_csv) - 1
			
				// Create enemy_stats struct array
				for(var i = 1; i <= global.enemy_index_length; i++)
				{
					global.enemy_stats[i] = new enemy_stats();
				}

				// Assign all values from CSV file into stats database structs
				for(var i = 0; i < global.enemy_index_length; i++)
				{
					var yy = i + 1;
					var xx = 1;
				
					global.enemy_stats[yy].hp = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].damage = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].atk_spd = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].move_spd = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].flies = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].can_jump = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].vision_range = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].caster = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].xp = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					
				}


				// Assign data to enemy index arrays
				for(var p = 0; p < global.enemy_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_enemy_index_name[n] = ds_grid_get(ds_enemy_stats_csv, 0, n);
				}
				
	
				// Cleanup DS grid
				ds_grid_destroy(ds_enemy_stats_csv);
			
				// Debug testing
				
				//	show_debug_message("enemy Constructor List: " + string(global.enemy_stats))
				//	show_debug_message("global.enemy_index_length: " + string(global.enemy_index_length))
				//	show_debug_message("global.arr_enemy_index_name: " + string(global.arr_enemy_index_name))
				
				
			#endregion Enemy Stats

			#region Item Stats
				
				// Create item_index_length for tracking total number of item in csv
				global.item_index_length = 0;

				// Create item_stats array for tracking stats
				global.item_stats[0] = 0;

				// Initialize item index arrays
				global.arr_item_index_name[0] = "No valid item name";
	
	

				var ds_item_stats_csv = load_csv("item_data.csv");

				// Ensure the grid is valid
				if (ds_item_stats_csv == -1) {
				    show_error("Failed to load CSV file.", true);
				    exit;
				}

				// Initialize stats dictionary constructor
				function item_stats(_spr = spr_placeholder, _scr = -1, _main_var = -1, _duration = -1, _price = -1, _min_level = -1, _title = "No Title", _desc = "No Description") constructor {
				
					spr = _spr
					scr = _scr
					main_var = _main_var
					duration = _duration
					price = _price
					min_level = _min_level
					title = _title
					desc = _desc

				}

				// Declare length of item index based on adjusted CSV height
				global.item_index_length = ds_grid_height(ds_item_stats_csv) - 1
			
				// Create item_stats struct array
				for(var i = 1; i <= global.item_index_length; i++)
				{
					global.item_stats[i] = new item_stats();
				}

				// Assign all values from CSV file into stats database structs
				for(var i = 0; i < global.item_index_length; i++)
				{
					var yy = i + 1;
					var xx = 1;
					global.item_stats[yy].spr = asset_get_index(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].scr = asset_get_index(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].main_var = real(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].duration = real(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].price = real(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].min_level = real(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].title = string(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].desc = string(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++
				}


				// Assign data to item index arrays
				for(var p = 0; p < global.item_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_item_index_name[n] = ds_grid_get(ds_item_stats_csv, 0, n);
				}
				
	
				// Cleanup DS grid
				ds_grid_destroy(ds_item_stats_csv);
			
				// Debug testing
				
				//	show_debug_message("item Constructor List: " + string(global.item_stats))
				//	show_debug_message("global.item_index_length: " + string(global.item_index_length))
				//	show_debug_message("global.arr_item_index_name: " + string(global.arr_item_index_name))
				
				
			#endregion Item Stats
	
		#endregion Database
		
		#region Inventory Contents

			#region Player Inventory Contents
		
				// Row 1
				global.inventory[0] = global.item_stats[item_names.health_potion_light];
				global.inventory[1] = global.item_stats[item_names.health_potion_moderate];
				global.inventory[2] = global.item_stats[item_names.health_potion_severe];
				global.inventory[3] = global.item_stats[item_names.health_potion_critical];
				global.inventory[4] = -1;
	
				// Row 2
				global.inventory[5] = -1;
				global.inventory[6] = -1;
				global.inventory[7] = -1;
				global.inventory[8] = -1;
				global.inventory[9] = -1;

	
				// Row 3
				global.inventory[10] = -1;
				global.inventory[11] = -1;
				global.inventory[12] = -1;
				global.inventory[13] = -1;
				global.inventory[14] = -1;

			#endregion Player Inventory Contents
			
			#region Hard coded spells for testing
			
				global.active_spells[0, 1] = global.spell_stats[scr_find_spell_index("firebolt")]
				global.active_spells[0, 2] = global.spell_stats[scr_find_spell_index("jump")]
				global.active_spells[0, 3] = global.spell_stats[scr_find_spell_index("heal")]
				global.active_spells[0, 4] = global.spell_stats[scr_find_spell_index("icicle")]
				global.active_spells[0, 5] = global.spell_stats[scr_find_spell_index("jolt")]
				global.active_spells[0, 6] = global.spell_stats[scr_find_spell_index("wall of fire")]
				global.active_spells[0, 7] = global.spell_stats[scr_find_spell_index("wall of ice")]
				global.active_spells[0, 8] = global.spell_stats[scr_find_spell_index("fireball")]
				global.active_spells[0, 9] = global.spell_stats[scr_find_spell_index("water splash")]
				global.active_spells[0, 10] = global.spell_stats[scr_find_spell_index("oil splash")]
				//show_debug_message("global.active_spells = " + string(global.active_spells))
				
			#endregion Hard coded spells for testing
			
			#region Spellbook Testing Contents

				#region Page 1
				
					// Page and Slot
					var page = 1
					var slot = 0
				
				
					global.spellbook[page, slot] = global.spell_stats[scr_find_spell_index("firebolt")];
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
				
				#endregion Page 1
				
				#region Page 2
				/*
					page++;
					slot = 0
					
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
					global.spellbook[page, slot] = -1;
					slot++
				*/
				#endregion Page 2
				
			#endregion Spellbook Testing Contents


		#endregion Inventory Contents

	#endregion Variables
	
#endregion Global Variables

#region Camera

	// Resolution
		// Default resolution
			// Game resolution
			global.res_w = 640;
			global.res_h = 360;
	
		// Used for full screen
			// Game resolution
//			global.res_w = 1960;
//			global.res_h = 1080;

	// Scaling (hardcoded for now)
	window_scale = 1;
	
	//window_set_fullscreen(true)

	// Set size of window and center it
	window_set_size(global.res_w * window_scale, global.res_h * window_scale);
	alarm[0] = 1;

	surface_resize(application_surface, global.res_w * window_scale, global.res_h * window_scale);

#endregion Camera


