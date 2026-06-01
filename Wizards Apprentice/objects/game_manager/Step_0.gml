/// @description Controls

scr_get_controls();

#region Pausing

	if(global.cont_esc_menu == true)
	{scr_test()
		if(global.game_esc_paused == false && instance_exists(obj_player_parent))
		{
			global.game_esc_paused = true;
			scr_esc_pause();
		
			// Create ESC Menu object
			instance_create_layer(0, 0, "Game_Manager", obj_esc_menu);
			instance_activate_object(obj_esc_menu)
		}else
		
		if(global.game_esc_paused == true && instance_exists(obj_esc_menu))
		{
			global.game_esc_paused = false;
			scr_esc_resume();

			instance_destroy(obj_esc_menu)
			layer_destroy_instances("Menu_Buttons")
		}
	}
	
#endregion Pausing