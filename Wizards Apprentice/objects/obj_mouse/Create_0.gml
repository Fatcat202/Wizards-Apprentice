/// @description State Machine

#region Variables


	// Use button position
	x_pos_use = 0;
	y_pos_use = 0;
	// Sell button position
	x_pos_sell = 0;
	y_pos_sell = 0;
	// Give button position
	x_pos_give = 0;
	y_pos_give = 0;
	// Take button position
	x_pos_take = 0;
	y_pos_take = 0;
	// Buy button position
	x_pos_buy = 0;
	y_pos_buy = 0;
	// Forget button position
	x_pos_forget = 0;
	y_pos_forget = 0;
	// Memorize button position
	x_pos_memorize = 0;
	y_pos_memorize = 0;


	// Inventory Controls
	inventory_hover = noone;
	slot_hover = -1;
	inventory_drag = -1;
	slot_drag = -1;
	item_drag = -1;
	state = -1;
	held = false;
	page_hover = 0;
	page_drag = 0;

#endregion Variables


#region States

	function mouse_over()
	{
		slot_hover = -1;
		inventory_hover = noone;
		page_hover = 0;
	
		#region Inventory
			with(obj_inventory_parent)
			{
				if(point_in_rectangle(mouse_x, mouse_y, x_pos - spacer, y_pos - spacer, x_pos + inv_width, y_pos + inv_height))
				{
					// Create mouse over boxes for inventory slots
					for(var i = 0; i < global.inventory_slots; i++)
					{

						var xx = x_pos + (i mod inventory_row_length) * 64;
						var yy = y_pos + (i div inventory_row_length) * 64 + 40;
	
						var spr_width = sprite_get_width(spr_inventory_slot);
	
						if(point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + 64, yy + 64))
						{
							// Inventory slot
							other.slot_hover = i;
			
							// Inventory ID
							other.inventory_hover = id;

						}
					}
				}
			}
		#endregion Inventory
		
		#region Spellbook
		
			with(obj_study_spellbook)
			{
				if(point_in_rectangle(mouse_x, mouse_y, x_pos - spacer, y_pos - spacer, x_pos + inv_width, y_pos + inv_height))
				{
					// Create mouse over boxes for spell slots
					for(var i = 0; i < spell_slots; i++)
					{
						
						var xx = x_pos + (i mod global.spellbook_row_length) * 48;
						var yy = y_pos + (i div global.spellbook_row_length) * 48 + 40;
	
						var spr_width = sprite_get_width(spr_inventory_slot);
	
						if(point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + 64, yy + 64))
						{
							// Inventory slot
							other.slot_hover = i;
			
							// Inventory ID
							other.inventory_hover = id;
							
							other.page_hover = active_page;
						}
					}
				}
			}
			
			with(obj_study_active_spells)
			{
				if(point_in_rectangle(mouse_x, mouse_y, mem_spell_x - spacer, mem_spell_y - spacer, mem_spell_x + inv_width, mem_spell_y + inv_height))
				{
					// Create mouse over boxes for spell slots
					for(var i = 1; i < spell_slots+1; i++)
					{
						
						var xx = mem_spell_x-spacer + (i-1) * 48;
						var yy = mem_spell_y-spacer;
	
						var spr_width = sprite_get_width(spr_inventory_slot);
	
						if(point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + 64, yy + 64))
						{
							// Inventory slot
							other.slot_hover = i;
			
							// Inventory ID
							other.inventory_hover = id;
							
							other.page_hover = 0
						}
					}
				}
			}
		
		#endregion Spellbook
	
	}

	state_free = function()
	{
		#region Inventory
			if(instance_exists(obj_inventory_parent))
			{
				mouse_over();
	
				// Destroy control menu if control menu is active with left click
				if((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && instance_exists(obj_item_control_menu) && !held)
				{
					if(!position_meeting(mouse_x, mouse_y, obj_item_control_menu))
					{
						instance_destroy(obj_item_control_menu);
						if(instance_exists(obj_button_use)) instance_destroy(obj_button_use);
					}
				}
	
				// Begin drag with left click
				if(mouse_check_button(mb_left) && slot_hover != -1 && slot_hover < inventory_hover.inventory_slots 
				&& !position_meeting(mouse_x, mouse_y, obj_item_control_menu)
				&& inventory_hover.object_index != obj_inventory_shop)
				{
				//	show_debug_message("slot_hover" + string(slot_hover))
					if(inventory_hover.inventory[slot_hover] == -1) exit;
			
					//Enter drag state
					state = state_drag;
					item_drag = inventory_hover.inventory[slot_hover];
					inventory_drag = inventory_hover;
					slot_drag = slot_hover;
				}
	
	
				// Create control menu with right click
				if(mouse_check_button(mb_right) && slot_hover != -1 && slot_hover < inventory_hover.inventory_slots)
				{
					if(inventory_hover.inventory[slot_hover] == -1) exit;
			
					// Destroy control menu if active
					if(instance_exists(obj_item_control_menu)) instance_destroy(obj_item_control_menu)
					if(instance_exists(obj_button_use)) instance_destroy(obj_button_use);
		
		
					// Menu Pos
					x_pos = global.cam_target_x + (global.res_w / 2) - (inventory_hover.inv_width / 2) + (inventory_hover.spacer * 2);
					y_pos = global.cam_target_y + (global.res_h / 2) - (inventory_hover.inv_height / 2) + (inventory_hover.spacer * 2) - 20;
			
					var xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
					var yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));
		
					if(inventory_hover.object_index == obj_inventory_shop)
					{
				
						// Create control menu
						var menu = instance_create_layer(xx, yy, "Menu_Buttons", obj_item_control_menu)
							menu.title = inventory_hover.inventory[slot_hover].title;
							menu.description = inventory_hover.inventory[slot_hover].desc;
							menu.item = inventory_hover.inventory[slot_hover]
				
					}else
					{
						// Create control menu
						var menu = instance_create_layer(xx, yy, "Menu_Buttons", obj_item_control_menu)
							menu.title = inventory_hover.inventory[slot_hover].title;
							menu.description = inventory_hover.inventory[slot_hover].desc;
							menu.item = inventory_hover.inventory[slot_hover]
					}


					if(inventory_hover.object_index == obj_inventory_player_chest)
					{
						// Set use button pos
						x_pos_give = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_give = menu.y + 55
		
						// Set use button pos
						x_pos_use = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_use = menu.y + 20
				
						var give = instance_create_layer(x_pos_give, y_pos_give, "Menu_Buttons", obj_button_give)
							give.item = slot_hover;
							give.inventory_slots = obj_inventory_chest.inventory_slots
							give.chest_inventory = obj_inventory_chest.inventory;
			
						var use = instance_create_layer(x_pos_use, y_pos_use, "Menu_Buttons", obj_button_use)
							use.item = slot_hover;
							use.inventory = inventory_hover.inventory
							use.inventory_slots = inventory_hover.inventory_slots
				
					}else
			
					if(inventory_hover.object_index == obj_inventory_player)
					{
						// Set use button pos
						x_pos_use = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_use = menu.y + 40

						var use = instance_create_layer(x_pos_use, y_pos_use, "Menu_Buttons", obj_button_use)
							use.item = slot_hover;
							use.inventory = inventory_hover.inventory
							use.inventory_slots = inventory_hover.inventory_slots
					}else
			
					if(inventory_hover.object_index == obj_inventory_chest)
					{
				
						// Set take button pos
						x_pos_take = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_take = menu.y + 55
		
						// Set use button pos
						x_pos_use = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_use = menu.y + 20
				
						var take = instance_create_layer(x_pos_take, y_pos_take, "Menu_Buttons", obj_button_take)
							take.item = slot_hover;
							take.inventory = inventory_hover.inventory
							take.inventory_slots = inventory_hover.inventory_slots
			
						var use = instance_create_layer(x_pos_use, y_pos_use, "Menu_Buttons", obj_button_use)
							use.item = slot_hover;
							use.inventory = inventory_hover.inventory
							use.inventory_slots = inventory_hover.inventory_slots
				
					}else
			
					if(inventory_hover.object_index == obj_inventory_player_shop)
					{
						// Set use button pos
						x_pos_sell = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_sell = menu.y + 55
		
						// Set use button pos
						x_pos_use = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_use = menu.y + 20
			
			
						var sell = instance_create_layer(x_pos_sell, y_pos_sell, "Menu_Buttons", obj_button_sell)
							sell.item = slot_hover;
			
						var use = instance_create_layer(x_pos_use, y_pos_use, "Menu_Buttons", obj_button_use)
							use.item = slot_hover;
							use.inventory = inventory_hover.inventory
							use.inventory_slots = inventory_hover.inventory_slots
					}else
				
					if(inventory_hover.object_index == obj_inventory_shop)
					{
						// Set buy button pos
						x_pos_buy = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_buy = menu.y + 40
			
			
						var buy = instance_create_layer(x_pos_buy, y_pos_buy, "Menu_Buttons", obj_button_buy)
							buy.item = slot_hover;
							buy.inventory = inventory_hover.inventory;
					}else
					{
						show_debug_message("No Inventory Found");
					}
			

			
					// Indicate mb_right is being held
					held = true;

				}
	
				// Set held to false when no longer held
				if(!mouse_check_button(mb_right) || !position_meeting(x, y, obj_inventory_shop))
				{
					held = false;	
				}
	
				// Update positions when held
				if(mouse_check_button(mb_right) && instance_exists(obj_item_control_menu) && held)
				{
					// Clamp pos
					xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
					yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));
		
					// Menu
					obj_item_control_menu.x = xx
					obj_item_control_menu.y = yy

				}
			}
		#endregion Inventory
		
		
		#region Spellbook
		
			if(instance_exists(obj_spellbook_parent))
			{
				mouse_over()
				
				// Destroy control menu if control menu is active with left click
				if((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && instance_exists(obj_item_control_menu) && !held)
				{
					if(!position_meeting(mouse_x, mouse_y, obj_item_control_menu))
					{
						instance_destroy(obj_item_control_menu);
					}
				}
	
				// Begin drag with left click
				if(mouse_check_button(mb_left) && slot_hover != -1 && slot_hover < inventory_hover.spell_slots+1 
				&& !position_meeting(mouse_x, mouse_y, obj_item_control_menu))
				{
				//	show_debug_message("slot_hover" + string(slot_hover))
					if(inventory_hover.inventory[page_hover, slot_hover] == -1) exit;

					//Enter drag state
					state = state_drag;
					item_drag = inventory_hover.inventory[page_hover, slot_hover];
					inventory_drag = inventory_hover;
					slot_drag = slot_hover;
					page_drag = page_hover
				}
	
	
				// Create control menu with right click
				if(mouse_check_button(mb_right) && slot_hover != -1 && slot_hover < inventory_hover.spell_slots+1)
				{
					if(inventory_hover.inventory[page_hover, slot_hover] == -1) exit;
			
					// Destroy control menu if active
					if(instance_exists(obj_item_control_menu)) instance_destroy(obj_item_control_menu)
					if(instance_exists(obj_button_use)) instance_destroy(obj_button_use);
		
		
					// Menu Pos
					x_pos = global.cam_target_x + (global.res_w / 2) - (inventory_hover.inv_width / 2) + (inventory_hover.spacer * 2);
					y_pos = global.cam_target_y + (global.res_h / 2) - (inventory_hover.inv_height / 2) + (inventory_hover.spacer * 2) - 20;
			
					var xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
					var yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));

					if(!instance_exists(obj_item_control_menu))
					{
						// Create control menu
						var menu = instance_create_layer(xx, yy, "Menu_Buttons", obj_item_control_menu)
							menu.title = inventory_hover.inventory[page_hover, slot_hover].title;
							menu.description = inventory_hover.inventory[page_hover, slot_hover].desc;
							menu.spell = inventory_hover.inventory[page_hover, slot_hover]
					}
					


					if(inventory_hover.object_index == obj_study_spellbook)
					{
						// Set memorize button pos
						x_pos_memorize = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_memorize = menu.y + 55
				
						var memorize = instance_create_layer(x_pos_memorize, y_pos_memorize, "Menu_Buttons", obj_button_memorize)
							memorize.spell = inventory_hover.inventory[page_hover, slot_hover]
							memorize.inventory_hover = inventory_hover
							memorize.slot_hover = slot_hover;
							memorize.page_hover = page_hover;
							memorize.slot_hover = slot_hover;
							
					}else
			
					if(inventory_hover.object_index == obj_study_active_spells)
					{
						// Set use forget pos
						x_pos_forget = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
						y_pos_forget = menu.y + 55

						var forget = instance_create_layer(x_pos_forget, y_pos_forget, "Menu_Buttons", obj_button_forget)
							forget.slot = slot_hover

					}else
					{
						show_debug_message("No Inventory Found");
					}

					// Indicate mb_right is being held
					held = true;
				}
	
				// Set held to false when no longer held
				if(!mouse_check_button(mb_right))
				{
					held = false;	
				}
	
				// Update positions when held
				if(mouse_check_button(mb_right) && instance_exists(obj_item_control_menu) && held)
				{
					// Clamp pos
					xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
					yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));
		
					// Menu
					obj_item_control_menu.x = xx
					obj_item_control_menu.y = yy

				}
				
			}
		
		#region Spellbook
		
	}

	state_drag = function()
	{
		mouse_over();
	
		if(!mouse_check_button(mb_left))
		{
			/*
			show_debug_message("inventory_drag" + string(inventory_drag))
			show_debug_message("slot_drag" + string(slot_drag))
			show_debug_message("inventory_hover" + string(inventory_hover))
			show_debug_message("slot_hover" + string(slot_hover))
			*/
			
			if(instance_exists(obj_inventory_parent))
			{
				//Swap with slot if hovering
				if(slot_hover != -1 && inventory_hover.object_index != obj_inventory_shop) scr_inventory_swap(inventory_drag, slot_drag, inventory_hover, slot_hover)
			}else
			
			if(instance_exists(obj_study_menu))
			{
				// Add or remove selected spell from active spell list
				
				if(slot_hover != -1)
				{
					// From spellbook
					if(inventory_drag.object_index == obj_study_spellbook)
					{
						// Total of memory used and memory of spell being dragged
						var memory_to_use = global.memory_used + inventory_drag.inventory[page_drag, slot_drag].memory;
						
						// Check if the selected spell has already been memorized
						var duplicate = false;
						for(var i = 1; i < global.max_spell_slots+1; i++)
						{
							if(inventory_drag.inventory[page_drag, slot_drag] == inventory_hover.inventory[0, i])
							{
								duplicate = true;
							}
						}
						

						if(memory_to_use <= global.memory && duplicate == false)
						{
							// If slot is open, transfer
							if(inventory_hover.inventory[0, slot_hover] == -1)
							{
								// Transfer to active spells
								inventory_hover.inventory[0, slot_hover] = inventory_drag.inventory[page_drag, slot_drag]
							}else
							
							// If slot is not open, search for open slot
							if(inventory_hover.inventory[0, slot_hover] != -1)
							{
								for(var i = 1; i < inventory_hover.spell_slots+1; i++)
								{
									if(inventory_hover.inventory[0, i] == -1)
									{
										// Transfer to active spells
										inventory_hover.inventory[0, i] = inventory_drag.inventory[page_drag, slot_drag]
										break;
									}
								}
							}
						}
						
						
						
					}else
					
					// From active spells
					if(inventory_drag.object_index == obj_study_active_spells)
					{
						// To spellbook
						if(inventory_hover.object_index == obj_study_spellbook) 
						{
							// Clear slot
							inventory_drag.inventory[0, slot_drag] = -1
						}
						
						// To active spells
						if(inventory_hover.object_index == obj_study_active_spells)
						{
							// Swap slot
							var item_from = inventory_drag.inventory[0, slot_drag];
							inventory_drag.inventory[0, slot_drag] = inventory_hover.inventory[0, slot_hover];
							inventory_hover.inventory[0, slot_hover] = item_from;
						}
						
					}
				}

			}
		
		
			//Return to free state
			state = state_free;
			item_drag = -1;
			inventory_drag = -1;
			slot_drag = -1;
			page_hover = 0;
			page_drag = 0;
			
		}
	}

#endregion States


// Set state
state = state_free;