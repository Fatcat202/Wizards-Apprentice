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
		
		if(global.cont_inventory == true)
		{
			// Prevent inventory pausing
			if(!global.game_esc_paused && !instance_exists(obj_inventory_player_shop))
			{
				// Activate Inventory Pause
				if(global.show_inventory = false)
				{
					global.show_inventory = true;
						
					scr_inventory_pause()
		
					// Create Inventory Menu object
					instance_create_layer(0, 0, "Inventory", obj_inventory_player);

				}else // Deactivate Inventory Pause
				{
					global.show_inventory = false;
		
					// Resume (Rest located in obj_player_parent Create)
					global.end_inventory_pause = true;
		
					instance_activate_all()
		
					// Create Inventory Menu object
					instance_destroy(obj_inventory_player);
					layer_destroy_instances("Inventory");
				}
			}
		}
	
	#endregion Inventory Pause
	
	#region Exit Shop
	
		if((global.show_inventory == true && !instance_exists(obj_inventory_player)) 
		&& (global.cont_inventory == true || global.cont_esc_menu || global.cont_interact))
		{
			
			global.show_inventory = false;
		
			// Resume (Rest located in obj_player_parent Create)
			global.end_inventory_pause = true;
		
			instance_activate_all()
		
			// Create Inventory Menu object
			instance_destroy(obj_inventory_player);
			layer_destroy_instances("Inventory");
			
		}
	#endregion Exit Shop
	
	
	// Declare if game is paused
	if(global.show_inventory || global.game_esc_paused)
	{
		global.game_paused = true;
	}else global.game_paused = false;
	
#endregion Pausing