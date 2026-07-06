/// @description State machine

draw_self()


// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


	switch (state)
	{	
		#region New Game
		
			case "new_game": // Start a new game
		
		
				var stats_y_count = 0;

				#region Name Creation
				
					// Character name creation
				
				
				
				
				#endregion Name Creation
			

				#region Stat Selection
					// Stat Selection
				
					#region Stats

						#region Vitality
	
							draw_set_font(fnt_menu_small)
							draw_set_halign(fa_middle)
							draw_set_valign(fa_center)
							draw_text(stats_x, stats_start_y + stats_y_count, "Vitality: " + string(temp_vit))

							// Check if levels can be added
							if(temp_free_level > 0)
							{
								if(!instance_exists(add_vit))
								{
									add_vit = instance_create_layer(add_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_add,
									{
										stat : stats.VITALITY,
										menu_id : id
									})
								}
							}else
							{	// Remove button if no levels can be added
								if(instance_exists(add_vit)) instance_destroy(add_vit)
							}
			
							// If levels have been added, create button to show levels can be removed
							if(temp_vit > global.vitality)
							{
								if(!instance_exists(sub_vit))
								{
									sub_vit = instance_create_layer(subtract_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_sub,
									{
										stat : stats.VITALITY,
										menu_id : id
									})
								}
							}else
							{
								// Remove button if no levels can be removed
								if(instance_exists(sub_vit)) instance_destroy(sub_vit)
							}
		

							stats_y_count += stats_gap;

							scr_text_reset()
	
						#endregion Vitality
	
						#region Dexterity
	
							draw_set_font(fnt_menu_small)
							draw_set_halign(fa_middle)
							draw_set_valign(fa_center)
							draw_text(stats_x, stats_start_y + stats_y_count, "Dexterity: " + string(temp_dex))

							// Check if levels can be added
							if(temp_free_level > 0)
							{
								if(!instance_exists(add_dex))
								{
									add_dex = instance_create_layer(add_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_add,
									{
										stat : stats.DEXTERITY,
										menu_id : id
									})
								}
							}else
							{	// Remove button if no levels can be added
								if(instance_exists(add_dex)) instance_destroy(add_dex)
							}
			
							// If levels have been added, create button to show levels can be removed
							if(temp_dex > global.dexterity)
							{
								if(!instance_exists(sub_dex))
								{
									sub_dex = instance_create_layer(subtract_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_sub,
									{
										stat : stats.DEXTERITY,
										menu_id : id
									})
								}
							}else
							{
								// Remove button if no levels can be removed
								if(instance_exists(sub_dex)) instance_destroy(sub_dex)
							}

							stats_y_count += stats_gap;

							scr_text_reset()
						#endregion Dexterity
	
						#region Intelligence
							draw_set_font(fnt_menu_small)
							draw_set_halign(fa_middle)
							draw_set_valign(fa_center)
							draw_text(stats_x, stats_start_y + stats_y_count, "Intelligence: " + string(temp_int))

							// Check if levels can be added
							if(temp_free_level > 0)
							{
								if(!instance_exists(add_int))
								{
									add_int = instance_create_layer(add_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_add,
									{
										stat : stats.INTELLIGENCE,
										menu_id : id
									})
								}
							}else
							{	// Remove button if no levels can be added
								if(instance_exists(add_int)) instance_destroy(add_int)
							}
			
							// If levels have been added, create button to show levels can be removed
							if(temp_int > global.intelligence)
							{
								if(!instance_exists(sub_int))
								{
									sub_int = instance_create_layer(subtract_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_sub,
									{
										stat : stats.INTELLIGENCE,
										menu_id : id
									})
								}
							}else
							{
								// Remove button if no levels can be removed
								if(instance_exists(sub_int)) instance_destroy(sub_int)
							}

							stats_y_count += stats_gap;

							scr_text_reset()
						#endregion Intelligence
	
						#region Memory
							draw_set_font(fnt_menu_small)
							draw_set_halign(fa_middle)
							draw_set_valign(fa_center)
							draw_text(stats_x, stats_start_y + stats_y_count, "Memory: " + string(temp_mem))

							// Check if levels can be added
							if(temp_free_level > 0)
							{
								if(!instance_exists(add_mem))
								{
									add_mem = instance_create_layer(add_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_add,
									{
										stat : stats.MEMORY,
										menu_id : id
									})
								}
							}else
							{	// Remove button if no levels can be added
								if(instance_exists(add_mem)) instance_destroy(add_mem)
							}
			
							// If levels have been added, create button to show levels can be removed
							if(temp_mem > global.memory)
							{
								if(!instance_exists(sub_mem))
								{
									sub_mem = instance_create_layer(subtract_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_sub,
									{
										stat : stats.MEMORY,
										menu_id : id
									})
								}
							}else
							{
								// Remove button if no levels can be removed
								if(instance_exists(sub_mem)) instance_destroy(sub_mem)
							}

							stats_y_count += stats_gap;

							scr_text_reset()
						#endregion Memory
	
						#region Charisma
							draw_set_font(fnt_menu_small)
							draw_set_halign(fa_middle)
							draw_set_valign(fa_center)
							draw_text(stats_x, stats_start_y + stats_y_count, "Charisma: " + string(temp_cha))

							// Check if levels can be added
							if(temp_free_level > 0)
							{
								if(!instance_exists(add_cha))
								{
									add_cha = instance_create_layer(add_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_add,
									{
										stat : stats.CHARISMA,
										menu_id : id
									})
								}
							}else
							{	// Remove button if no levels can be added
								if(instance_exists(add_cha)) instance_destroy(add_cha)
							}
			
							// If levels have been added, create button to show levels can be removed
							if(temp_cha > global.charisma)
							{
								if(!instance_exists(sub_cha))
								{
									sub_cha = instance_create_layer(subtract_button_x, stats_start_y + stats_y_count, "Menu_Buttons", obj_button_sub,
									{
										stat : stats.CHARISMA,
										menu_id : id
									})
								}
							}else
							{
								// Remove button if no levels can be removed
								if(instance_exists(sub_cha)) instance_destroy(sub_cha)
							}

							stats_y_count += stats_gap;

							scr_text_reset()
						#endregion Charisma

					#endregion Stats


					#region Available Levels

						draw_set_font(fnt_menu_small)
						draw_set_halign(fa_middle)
						draw_set_valign(fa_center)
							draw_text(available_level_x, available_level_y, "Available Levels: " + string(temp_free_level))

						scr_text_reset()

					#endregion Available Levels
				
				
				#endregion Stat Selection
			
			
				#region Start Button
				
					// Create start button
					if(!instance_exists(obj_button_start))
					{
						var start = instance_create_layer(x, y + 100, "Popup_Instances", obj_button_start,
						{
							menu_id : id
						})
					}
				
				#endregion Start Button
		
		
			break;
			
		#endregion New Game
	
		#region Load Game
			case "load_game": // Load a previous game
		
				draw_text(x, y, "Load Game")
		
			break;
		#endregion Load Game
	
		#region Options
			case "options": // View and change game settings
		
				draw_text(x, y, "Options")
		
			break;
		#endregion Options
		
		#region Credits
			case "credits": // View credits
		
				draw_text(x, y, "Credits")
		
			break;
		#endregion Credits
	
		case "none": // Initial empty state before assigning other state
		
		break;
	}

// Reset Location
draw_set_halign(fa_left);
draw_set_valign(fa_top);