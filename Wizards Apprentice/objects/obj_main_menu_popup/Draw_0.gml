/// @description State machine

draw_self()


// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_small);


	switch (state)
	{	
		#region New Game
		
			case "new_game": // Start a new game
			
				draw_text(middle, save_slot_y_title, "New Game")
		
		
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
		
				// Save game slots
				
				// Reload data held in save slot array
				scr_reload_save_slot_array()
				
				draw_set_halign(fa_middle)
				draw_set_valign(fa_center)
				draw_set_font(fnt_menu_small)
				
					draw_text(middle, save_slot_y_title, "Load Game")
				
					for(var i = 0; i < global.num_save_slots; i++)
					{
						
						var slot_y = save_slot_y + (save_slot_gap*(1+i))
						
						// Slot number text
						draw_text(save_slot_x, slot_y, "Slot " + string(i+1) + ": ")
						
						if(file_exists(global.arr_save_slots[i].slot_file))
						{
							
							draw_text(save_slot_x + slot_text_gap, slot_y - 10, string(global.arr_save_slots[i].player_level))
							draw_text(save_slot_x + slot_text_gap, slot_y + 10, "Level: " + string(global.arr_save_slots[i].player_name))
						}else
						{
							// If no data, show to be empty
							draw_text(save_slot_x + slot_text_gap, slot_y, "Empty")
						}
						
						// Create save slot button
						instance_create_layer(save_slot_x + 50, slot_y, "Menu_Buttons", obj_button_save_slot,
						{
							save_file_num : i,
							file_name : global.arr_save_slots[i].slot_file
						})
						
						// Create save slot delete button
						if(file_exists(global.arr_save_slots[i].slot_file))
						{
							instance_create_layer(x_right - 32, slot_y, "Menu_Buttons", obj_button_delete_slot,
							{
								save_file_num : i,
								file_name : global.arr_save_slots[i].slot_file
							})
						}
						
					}
					
				scr_text_reset()
		
			break;
		#endregion Load Game
	
		#region Options
			case "options": // View and change game settings
		
				draw_text(x, y, "Options")
		
			break;
		#endregion Options
		
		#region Credits
			case "credits": // View credits
		
				draw_text(credits_title_x, credits_title_y, "Credits:")
				
				draw_text(credits_text_x, credits_text_y, "Made By: Ethan Bayley")
		
			break;
		#endregion Credits
		
		#region Make Save Slot
		
			case "make_save_slot":
				
				
				// Reload data held in save slot array
				scr_reload_save_slot_array()
				
				draw_set_halign(fa_middle)
				draw_set_valign(fa_center)
				draw_set_font(fnt_menu_small)
				
					draw_text(middle, save_slot_y_title, "Select Save Slot")
				
					for(var i = 0; i < global.num_save_slots; i++)
					{
						
						var slot_y = save_slot_y + (save_slot_gap*(1+i))
						
						// Slot number text
						draw_text(save_slot_x, slot_y, "Slot " + string(i+1) + ": ")
						
						if(file_exists(global.arr_save_slots[i].slot_file))
						{
							
							draw_text(save_slot_x + slot_text_gap, slot_y - 10, string(global.arr_save_slots[i].player_level))
							draw_text(save_slot_x + slot_text_gap, slot_y + 10, "Level: " + string(global.arr_save_slots[i].player_name))
						}else
						{
							// If no data, show to be empty
							draw_text(save_slot_x + slot_text_gap, slot_y, "Empty")
						}
						
						// Create new save slot button
						instance_create_layer(save_slot_x + 50, slot_y, "Menu_Buttons", obj_button_new_save_slot,
						{
							save_file_num : i,
							file_name : global.arr_save_slots[i].slot_file,
							menu_id : id
						})
						
			/*			// Create save slot delete button
						if(file_exists(global.arr_save_slots[i].slot_file))
						{
							instance_create_layer(x_right - 32, slot_y, "Menu_Buttons", obj_button_delete_slot,
							{
								save_file_num : i,
								file_name : global.arr_save_slots[i].slot_file
							})
						}
			*/
						
					}
					
				scr_text_reset()
				
				
			break;
			
		#endregion Make Save Slot
	
		case "none": // Initial empty state before assigning other state
		
		break;
	}

// Reset Location
scr_text_reset()