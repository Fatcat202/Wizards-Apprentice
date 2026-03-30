

#region Global Variables

	#region Variables
	
	
		// Sets how many pixel away objects must be from another object to collide 
		// (x2 if both move towards each other)
		global.collision_distance = 0.5;
		
		// Number of frames to apply invincibility after taking damage
		global.i_frames = 15;
	
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
				function spell_stats(_spell_level = -1, _spell_damage = -1, _spell_atk_speed = -1, _spell_cooldown = -1, _spell_mana = -1, _spell_memory = -1, _spell_uses = -1, _spell_duration = -1, _spell_element = -1, _spell_title = "Empty", _spell_desc = "Empty", _spell_spr = spr_spell_placeholder, _spell_script = scr_test()) constructor {
				
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
			
				var grid_height = ds_grid_height(ds_spell_stats_csv)	
	
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
				function enemy_stats(_hp = -1, _damage = -1, _atk_spd = -1, _move_spd = -1, _element_shield = -1) constructor {
				
					hp = _hp
					damage = _damage
					atk_spd = _atk_spd
					move_spd = _move_spd
					element_shield = _element_shield

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
					global.enemy_stats[yy].element_shield = string(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					
	
				}


				// Assign data to enemy index arrays
				for(var p = 0; p < global.enemy_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_enemy_index_name[n] = ds_grid_get(ds_enemy_stats_csv, 0, n);
				}
			
				var grid_height = ds_grid_height(ds_enemy_stats_csv)	
	
				// Cleanup DS grid
				ds_grid_destroy(ds_enemy_stats_csv);
			
				// Debug testing
				
				//	show_debug_message("enemy Constructor List: " + string(global.enemy_stats))
				//	show_debug_message("global.enemy_index_length: " + string(global.enemy_index_length))
				//	show_debug_message("global.arr_enemy_index_name: " + string(global.arr_enemy_index_name))
				
				
			#endregion Enemy Stats
	
	
		#endregion Database

	
	#endregion Variables


#endregion Global Variables

#region Camera

	// Resolution
		// Default resolution
		view_width = 640;
		view_height = 360;
	
		// Used for full screen
		//view_width = 1960;
		//view_height = 1080;

	// Scaling (hardcoded for now)
	window_scale = 1;
	
	//window_set_fullscreen(true)

	// Set size of window and center it
	window_set_size(view_width * window_scale, view_height * window_scale);
	alarm[0] = 1;

	surface_resize(application_surface, view_width * window_scale, view_height * window_scale);

#endregion Camera