/// @description State machine

draw_self()

// Draw inventory image
draw_sprite_stretched
(
	spr_main_menu_popup,
	0,
	xpos - width/2,
	ypos - height/2,
	width,
	height
);


// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_small);


	switch (state)
	{	
		#region New Game
		
			case "new_game": // Start a new game
			
			
				#region Positioning
				
					width = 350
					xpos = default_xpos - (width - default_width)/2;
					ypos = default_ypos;
	
					#region Name Creation
	
						x_pos_text_box = xpos
						y_pos_text_box = y - 95
	
					#endregion Name Creation
	
					#region Start Game
		
						x_pos_start = x - 100
						y_pos_start = y + 110
		
					#endregion Start Game

					#region Stats
						
						// Offset to place stats left
						stats_x_offset = 65

						stats_x = xpos - stats_x_offset
						stats_start_y = y_top + 90
						stats_gap = 27

						available_level_x = xpos - stats_x_offset
						available_level_y = y_top + 220

						add_button_x = xpos + 80 - stats_x_offset
						subtract_button_x = xpos - 80 - stats_x_offset
		
					#endregion Stats
					
					#region Spells
						
						
						spell_select_x = xpos + 95
						spell_select_y = y_top + 85
						
						spell_select_start_x = xpos + 40
						spell_select_start_y = y_top + 100
						spell_select_gap = 52
					
					#endregion Spells
	
				#endregion Positioning
			
				draw_text(xpos, save_slot_y_title, "Name:")
		
		
				var stats_y_count = 0;

				#region Name Creation
				
					// Character name creation
				
					if(!instance_exists(obj_text_box_player_name))
					{
						instance_create_layer(x_pos_text_box, y_pos_text_box,"Menu_Buttons" , obj_text_box_player_name)
					}
				
				
				#endregion Name Creation
				
				
				#region Spell Selection


					scr_draw_set_text(fa_center, fa_middle, fnt_menu_small, c_white)
						draw_text(spell_select_x, spell_select_y, "Select Spell:")
					scr_text_reset()
					
					if(!instance_exists(obj_button_spell_select))
					{		
						
						var total_spells = array_length(arr_starter_spells)
						var count = 0;
						
						var button_x_pos = spell_select_start_x
						var button_y_pos = spell_select_start_y
						
						for(var i = 0; i < total_spells; i++)
						{
							
							// Order spell in 2 columns
							if(count > 1)
							{
								button_x_pos = spell_select_start_x
								button_y_pos += spell_select_gap
								count = 0
							}
							button_x_pos += count * (spell_select_gap)
							
							// Center last spell
							if((i + 1) >= total_spells && count == 0)
							{
								button_x_pos = spell_select_start_x + (spell_select_gap/2)
							}

							// Create buttons
							var spell = instance_create_layer(button_x_pos, button_y_pos, "Menu_Buttons", obj_button_spell_select)
								spell.spell_data = arr_starter_spells[i]
								spell.menu_id = id
						
						
							count++
						}
					}
					
				
				#endregion Spell Selection
			

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
				
					
					// Only create start button if name is selected and all levels distributed
					if(global.player_name != "" && temp_free_level == 0 && starting_spell != -1)
					{
						// Create start button
						if(!instance_exists(obj_button_start))
						{
							var start = instance_create_layer(x_pos_start, y_pos_start, "Popup_Instances", obj_button_start,
							{
								menu_id : id
							})
						}
					}else
					{
						if(instance_exists(obj_button_start)) instance_destroy(obj_button_start)
					}
				
				#endregion Start Button
		
		
			break;
			
		#endregion New Game
	
		#region Load Game
			case "load_game": // Load a previous game
				
				width = default_width;
				xpos = default_xpos;
				ypos = default_ypos;
				
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
				
				width = default_width;
				xpos = default_xpos;
				ypos = default_ypos;
				
				
				draw_text(x, y, "Options")
		
			break;
		#endregion Options
		
		#region Credits
			case "credits": // View credits
				
				width = default_width;
				xpos = default_xpos;
				ypos = default_ypos;
				
				
				draw_text(credits_title_x, credits_title_y, "Credits:")
				
				draw_text(credits_text_x, credits_text_y, credits_text)
		
			break;
		#endregion Credits
		
		#region Make Save Slot
		
			case "make_save_slot":
				
				width = default_width;
				xpos = default_xpos;
				ypos = default_ypos;
				
				
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