/// @description Controls

scr_get_controls();

#region Pausing

	#region ESC Pause

		if(global.cont_esc_menu == true)
		{
			// Start Pause
			if(global.game_esc_paused == false && instance_exists(obj_player_parent) && global.show_inventory == false)
			{
				global.game_esc_paused = true;
				scr_esc_pause();
		
				// Create ESC Menu object
				instance_create_layer(0, 0, "Game_Manager", obj_esc_menu);
				instance_activate_object(obj_esc_menu)
				
			}else
		
			// End Pause
			if(global.game_esc_paused == true && instance_exists(obj_esc_menu))
			{
				global.game_esc_paused = false;
				scr_esc_resume();

				instance_destroy(obj_esc_menu)
				layer_destroy_instances("Menu_Buttons")
			}
		}
	
	#endregion ESC Pause
	
	#region Inventory Pause
	
		// Prevent menus on main menu and level end screen
		if(room != rm_main_menu && room != rm_level_end)
		{
			// Activate Inventory Pause
			if(global.cont_inventory == true && global.show_inventory == false && global.game_esc_paused == false)
			{
				
				scr_inventory_pause()
				
				if(!instance_exists(obj_study_menu))
				{
					instance_create_layer(x, y, "Inventory", obj_inventory_player)
				}

			}else
				
			// Deactivate Inventory Pause
			if(global.show_inventory == true
			&& (global.cont_inventory == true || global.cont_esc_menu == true || global.cont_interact == true)
			&& (instance_exists(obj_inventory_player) || instance_exists(obj_inventory_player_chest)))
			{
				scr_inventory_resume()
			}
		}
	
	#endregion Inventory Pause
	
	#region Exit Shop
	
		if((global.show_inventory == true && (instance_exists(obj_shop_menu)))
		&& (global.cont_inventory == true || global.cont_esc_menu == true || global.cont_interact == true))
		{
			scr_shop_resume()
				
		}
		
	#endregion Exit Shop
	
	#region Exit Study
		
		if((global.show_inventory == true && instance_exists(obj_study_menu))
		&& (global.cont_inventory == true || global.cont_esc_menu == true || global.cont_interact == true))
		{

			scr_spellbook_resume()

		}
		
	#endregion Exit Study
	
	#region Exit Level Select
		
		if((global.show_inventory == true && instance_exists(obj_menu_level_select))
		&& (global.cont_inventory == true || global.cont_esc_menu == true || global.cont_interact == true))
		{

			scr_level_select_resume()

		}
		
	#endregion Exit Study
	
	#region Exit Wizard
		
		if((global.show_inventory == true && instance_exists(obj_wizard_menu))
		&& (global.cont_inventory == true || global.cont_esc_menu == true || global.cont_interact == true))
		{

			scr_wizard_resume()

		}
		
	#endregion Exit Study
	
	
	// Declare if game is paused
	if(global.show_inventory || global.game_esc_paused)
	{
		global.game_paused = true;
	}else global.game_paused = false;

	
#endregion Pausing