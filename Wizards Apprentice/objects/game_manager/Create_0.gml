// Destroy self if game_manager already exists
if(instance_number(game_manager) > 1)
{
	instance_destroy()
	exit;
}


// Randomise variables in testing
randomise()


#region Enums
	
	enum item_names // Positions of items in database array
	{
		empty,
		health_potion_light,
		health_potion_moderate,
		health_potion_severe,
		health_potion_critical,
		scroll_level_1,
		scroll_level_2,
		scroll_level_3,
		scroll_level_4
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
			
			// Maximum a stat may be
			global.stat_max = 20;
			
			// Total number of assigned levels
			global.player_level = 1;
			
			// Holds levels to be assigned
			global.player_free_level = 0;
			
			// Total player xp
			global.player_xp = 0;
			
			// XP earned within a level, to be distributed at level end
			global.player_earned_xp = 0;
			
			// Name set by player
			global.player_name = "Apprentice"
			
			// XP needed for next level
			global.player_xp_next_level = global.player_level * 1000;
			
			// File number of current save. Set when either saving or loading a file
			global.file_num = 0;
			
			// "Average" charisma. If charisma is over number, player is given bonus. If under, player is given penalty
			global.charisma_average = global.stat_max/2;
			
			// Percentage price should increase or decrease per charisma point away from average
			global.price_mod = 0.075;
			
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
		
		#region Dialogue
		
			// Shows current position in wizard dialogue order. 0 Used as default message position
			global.dialogue_wizard_order = 1
			
			// Shows current position in shop dialogue order. 0 Used as default message position
			global.dialogue_shop_order = 1
			
			// Holds data for wizard dialogue, created when interacting with wizard
			global.arr_dialogue_wizard = -1
			
			// Holds data for wizard dialogue, created when interacting with shop
			global.arr_dialogue_shop = -1
			
			
		
		#endregion Dialogue


		
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
				function spell_stats(_level = -1, _water_level = -1, _oil_level = -1, _is_ice = -1, _is_flaming = -1, _is_steaming = -1, _is_charged = -1, _damage = -1, _move_spd = -1, _cooldown = -1, _mana = -1, _memory = -1, _uses = -1, _duration = -1, _title = "Empty", _desc = "Empty", _spr = -1, _script = -1) constructor {
				
					level = _level					// Level of spell, used for some calculations
					water_level = _water_level		// Water level of spell
					oil_level = _oil_level			// Oil level of spell
					is_ice = _is_ice				// Declares if made of ice
					is_flaming = _is_flaming		// Declares if flaming
					is_steaming = _is_steaming		// Declare if steaming
					is_charged = _is_charged		// Declares if electrically charged
					damage = _damage				// Sets damage of spell
					move_spd = _move_spd			// Sets movement speed of spell, -1 is melee
					cooldown = _cooldown			// Sets cooldown between attacks
					mana = _mana					// Sets mana cost of spell
					memory = _memory				// Sets memory cost of spell
					uses = _uses					// Sets number of times spell may be used per "casting"
					duration = _duration			// Sets duration before attack deletes itself. -1 is end of animation
					title = _title					// Sets spell title
					desc = _desc					// Sets spell description
					spr = _spr						// Sets spell icon sprite
					scr = _script					// Script for spell functionality

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
					global.spell_stats[yy].water_level = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].oil_level = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].is_ice = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].is_flaming = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].is_steaming = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].is_charged = bool(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].damage = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].move_spd = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].cooldown = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].mana = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].memory = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].uses = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
					global.spell_stats[yy].duration = real(ds_grid_get(ds_spell_stats_csv, xx, yy)); xx++;
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
				function enemy_stats(_hp = -1, _move_spd = -1, _flies = -1, _can_jump = -1, _min_range = -1, _vision_range = -1, _caster = -1, _xp = -1, _attack_scr = -1) constructor {
				
					hp = _hp
					move_spd = _move_spd
					flies = _flies
					can_jump = _can_jump
					min_range = _min_range
					vision_range = _vision_range
					caster = _caster
					xp = _xp
					attack_scr = _attack_scr

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
					global.enemy_stats[yy].move_spd = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].flies = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].can_jump = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].min_range = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].vision_range = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].caster = bool(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].xp = real(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					global.enemy_stats[yy].attack_scr = asset_get_index(ds_grid_get(ds_enemy_stats_csv, xx, yy)); xx++;
					
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
				function item_stats(_spr = spr_placeholder, _scr = -1, _main_var = -1, _duration = -1, _price = -1, _min_level = -1, _is_scroll = false, _is_consumable = false, _title = "No Title", _desc = "No Description") constructor {
				
					spr = _spr							// Item sprite to trigger on use
					scr = _scr							// Item script to trigger on use
					main_var = _main_var				// Primary variable used, such as healing or mana recieved
					duration = _duration				// Duration of effect, if any
					price = _price						// Price of item to buy in shop
					min_level = _min_level				// Minimum level required to buy item
					is_scroll = _is_scroll				// Declares if item is a scroll
					is_consumable = _is_consumable		// Declares if item is consumable, like a potion
					title = _title						// Title of item
					desc = _desc						// Description of item

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
					global.item_stats[yy].is_scroll = bool(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
					global.item_stats[yy].is_consumable = bool(ds_grid_get(ds_item_stats_csv, xx, yy)); xx++;
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
			
			#region Enemy Attack Stats
				
				// Create enemy_attack_index_length for tracking total number of enemy_attack in csv
				global.enemy_attack_index_length = 0;

				// Create enemy_attack_stats array for tracking stats
				global.enemy_attack_stats[0] = 0;

				// Initialize enemy_attack index arrays
				global.arr_enemy_attack_index_name[0] = "No valid enemy_attack name";
	

				var ds_enemy_attack_stats_csv = load_csv("enemy_attack_data.csv");

				// Ensure the grid is valid
				if (ds_enemy_attack_stats_csv == -1) {
				    show_error("Failed to load CSV file.", true);
				    exit;
				}

				// Initialize stats dictionary constructor
				function enemy_attack_stats(_damage = -1, _water_level = -1, _oil_level = -1, _is_ice = -1, _is_flaming = -1, _is_steaming = -1, _is_charged = -1, _atk_spd = -1, _atk_range = -1, _duration = -1, _level = -1, _xp = -1, _attack_scr = -1, _sprite = -1, _is_visible = -1, _move_spd = -1) constructor {
				
					damage = _damage				// Sets damage of attack
					water_level = _water_level		// Sets water level, defining if water is present
					oil_level = _oil_level			// Sets oil level, defining if oil is present
					is_ice = _is_ice				// Declares if ice
					is_flaming = _is_flaming		// Declares if fire
					is_steaming = _is_steaming		// Declares if steaming
					is_charged = _is_charged		// Declares if electrically charged
					atk_spd = _atk_spd				// Declares time between attacks
					atk_range = _atk_range			// Declares range of attack
					duration = _duration			// Declares time before attack is destroyed, -1 means end of animation
					level = _level					// Declares level of spell for some calculations
					attack_scr = _attack_scr		// Allows pass through of unique qualities of attack
					sprite = _sprite				// Sprite of attack
					is_visible = _is_visible		// Declares if attack is invisible or now
					move_spd = _move_spd			// Sets movement speed of attack, -1 makes attack a melee attack
				}

				// Declare length of enemy_attack index based on adjusted CSV height
				global.enemy_attack_index_length = ds_grid_height(ds_enemy_attack_stats_csv) - 1
			
				// Create enemy_attack_stats struct array
				for(var i = 1; i <= global.enemy_attack_index_length; i++)
				{
					global.enemy_attack_stats[i] = new enemy_attack_stats();
				}

				// Assign all values from CSV file into stats database structs
				for(var i = 0; i < global.enemy_attack_index_length; i++)
				{
					var yy = i + 1;
					var xx = 1;
				
					global.enemy_attack_stats[yy].damage = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;	
					global.enemy_attack_stats[yy].water_level = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].oil_level = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].is_ice = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].is_flaming = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].is_steaming = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].is_charged = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].atk_spd = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].atk_range = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].duration = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].level = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].attack_scr = asset_get_index(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].sprite = asset_get_index(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].is_visible = bool(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
					global.enemy_attack_stats[yy].move_spd = real(ds_grid_get(ds_enemy_attack_stats_csv, xx, yy)); xx++;
								
				}


				// Assign data to enemy_attack index arrays
				for(var p = 0; p < global.enemy_attack_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_enemy_attack_index_name[n] = ds_grid_get(ds_enemy_attack_stats_csv, 0, n);
				}
				
	
				// Cleanup DS grid
				ds_grid_destroy(ds_enemy_attack_stats_csv);
			
				// Debug testing
				
				//	show_debug_message("enemy_attack Constructor List: " + string(global.enemy_attack_stats))
				//	show_debug_message("global.enemy_attack_index_length: " + string(global.enemy_attack_index_length))
				//	show_debug_message("global.arr_enemy_attack_index_name: " + string(global.arr_enemy_attack_index_name))
				
				
			#endregion Enemy Attack Stats
			
			#region Level Stats
			
				// Create level_index_length for tracking total number of level in csv
				global.level_index_length = 0;

				// Create level_stats array for tracking stats
				global.level_stats[0] = 0;

				// Initialize level index arrays
				global.arr_level_index_name[0] = "No valid level name";
	

				var ds_level_stats_csv = load_csv("level_data.csv");

				// Ensure the grid is valid
				if (ds_level_stats_csv == -1) {
				    show_error("Failed to load CSV file.", true);
				    exit;
				}

				// Initialize stats dictionary constructor
				function level_stats(_level_name = -1, _room_name = -1, _reward_gold = -1, _reward_xp = -1, _level_completed = false, _level_chests = -1, _level_chests_empty = false, _level_unlocked = false) constructor {
				
					// GATHERED FROM CSV
					level_name = _level_name					// Holds name of level
					room_name = _room_name						// Holds name of room
					reward_gold = _reward_gold					// Holds gold reward for completing level
					reward_xp = _reward_xp						// Holds xp reward for completing level
					
					
					// NOT GATHERED FROM CSV
					level_completed = _level_completed			// Marks if level is completed previously
					level_chests = _level_chests				// Holds data for chests in level
					level_chests_empty = _level_chests_empty	// Declares if all chests in the room are empty
					level_unlocked = _level_unlocked			// Declares if the level is unlocked

				}

				// Declare length of level index based on adjusted CSV height
				global.level_index_length = ds_grid_height(ds_level_stats_csv) - 1
			
				// Create level_stats struct array
				for(var i = 1; i <= global.level_index_length; i++)
				{
					global.level_stats[i] = new level_stats();
				}

				// Assign all values from CSV file into stats database structs
				for(var i = 0; i < global.level_index_length; i++)
				{
					var yy = i;
					var xx = 0;

					global.level_stats[yy].level_name = string(ds_grid_get(ds_level_stats_csv, xx, yy+1)); xx++;
					global.level_stats[yy].room_name = string(ds_grid_get(ds_level_stats_csv, xx, yy+1)); xx++;
					global.level_stats[yy].reward_gold = real(ds_grid_get(ds_level_stats_csv, xx, yy+1)); xx++;
					global.level_stats[yy].reward_xp = real(ds_grid_get(ds_level_stats_csv, xx, yy+1)); xx++;
				}

				// Assign data to level index arrays
				for(var p = 0; p < global.level_index_length; p++)
				{
					var n = p + 1;
					// Sets 1st place in array as names
					global.arr_level_index_name[n] = ds_grid_get(ds_level_stats_csv, 0, n);
				}
			
				// Cleanup DS grid
				ds_grid_destroy(ds_level_stats_csv);

			
			// Holds position of room in global.level_stats
			global.active_level_num = -1;
			
			// Offset used to ignore wizard tower levels in array, set as first three rooms
			global.level_offset = 3
			


//			show_debug_message("global.level_stats: " + string(global.level_stats))

				// Debug testing
				
			//	show_debug_message("level Constructor List: " + string(global.level_stats))
			//	show_debug_message("global.level_index_length: " + string(global.level_index_length))
			//	show_debug_message("global.arr_level_index_name: " + string(global.arr_level_index_name))
				
			#endregion Level Stats

			
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
				global.inventory[5] = global.item_stats[item_names.scroll_level_3];
				global.inventory[6] = global.item_stats[item_names.scroll_level_1];
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
					global.spellbook[page, slot] = -1
					slot++
					global.spellbook[page, slot] = -1
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


