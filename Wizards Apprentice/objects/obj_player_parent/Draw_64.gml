/// @description HUD


var xx = display_get_gui_width() / 2
var yy = display_get_gui_height() / 2

#region Hearts
	// Total number of hearts
	var total_hearts = max_health / 2;
	// Total number of full hearts
	var current_hearts = floor(active_health / 2);
	// Remainder of current hp after full hearts
	var partial_heart = active_health - (current_hearts * 2)
	// Total number of empty hearts
	var empty_hearts = total_hearts - current_hearts
	
	// True-false if base_max_health is a round number
	var half_heart = base_max_health % 2;


	// Hearts location
	var margin_y = sprite_get_height(spr_heart_full) / 1.5
	var _spacing = sprite_get_width(spr_heart_full) + 2
	var margin_x = -10

	// Display hearts
	for(var i = 1; i <= total_hearts; i++)
	{
		if (i <= current_hearts) 
		{
			draw_sprite(spr_heart_full, 0, margin_x + (_spacing * i), margin_y)
		}else if (i = current_hearts + 1 && partial_heart != 0)
		{
			draw_sprite(spr_heart_partial, 0, margin_x + (_spacing * i), margin_y)
		}else if (empty_hearts > 0)
		{
			draw_sprite(spr_heart_empty, 0, margin_x + (_spacing * i), margin_y)
		}
	}
	
	// Check if total health is a round number
	if(half_heart == true)
	{
		// Check if at full hp to determine what sprite to show
		if(active_health == max_health)
		{
			draw_sprite(spr_heart_half_full, 0, margin_x + (_spacing * total_hearts) + (_spacing/2), margin_y)
		} else draw_sprite(spr_heart_half_empty, 0, margin_x + (_spacing * total_hearts) + (_spacing/2), margin_y)
	}
	
	
	
#endregion Hearts


#region Mana

	// Mana location
	margin_y = margin_y * 3;
	_spacing = _spacing;
	margin_x = margin_x;

	// Used for placing crystals in order
	var num_displayed = 1;
	
	// Signifies presense of ending half crystal
	var half_crystal = base_max_mana % 2
	
	// Total number of drained crystals
	var fully_drained = floor(mana_drain / 2)
	
	// Signifies presense of half-drained crystal
	var half_drained = mana_drain % 2
	
	// Total number of full crystals
	var full = floor((active_mana - half_drained) / 2)
	
	// Total number of empty crystals
	var empty = floor((max_mana - active_mana - half_crystal) / 2)
	
	// Signifies presense of half-full/half-empty crystal
	var half_full = 0
	
	// Decide if there will be a half-full/half empty crystal
	if(active_mana > 0 && active_mana != max_mana)
	{
		if((active_mana - half_drained) % 2 == 1)
		{
			half_full = 1
		}else half_full = 0
	}else half_full = 0
	
	
	
	#region Display
	
		// Display all fully drained crystals
		for(var i = 0; i < fully_drained; i++)
		{
			draw_sprite(spr_mana_double_drained, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++
		}
	
		// Check for half drained
		if(half_drained == true)
		{
			// Select what version to display based on mana
			if(active_mana > 0)
			{
				draw_sprite(spr_mana_double_half_drained_full, 0, margin_x + (_spacing * num_displayed), margin_y)
				num_displayed++
			}else
			{
				draw_sprite(spr_mana_double_half_drained_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
				num_displayed++
			}
		}
	
		// Display full crystals
		for(var i = 0; i < full; i++)
		{
			draw_sprite(spr_mana_double_full, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++
		}
	
		// Display half ful/empty crystal
		if(half_full == true)
		{
			draw_sprite(spr_mana_double_half, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++
		}
	
		// Display empty crystals
		for(var i = 0; i < empty; i++)
		{
			draw_sprite(spr_mana_double_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++
		}
	
		// Check for half crystal
		if(half_crystal == true)
		{
		
			// Check if mana is max
			if(active_mana == max_mana)
			{
				draw_sprite(spr_mana_single_full, 0, margin_x + (_spacing * num_displayed), margin_y)
				num_displayed++
			}else
		
			// Check if drain is equal to max mana
			if(mana_drain == max_mana)
			{
				draw_sprite(spr_mana_single_drained, 0, margin_x + (_spacing * num_displayed), margin_y)
				num_displayed++
			}else
			{
		
			// Default option of empty half crystal
				draw_sprite(spr_mana_single_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
				num_displayed++
			}
		}
	#endregion Display
	
	
	#region Debug
	/*
		show_debug_message("mana_drain = " + string(mana_drain))
		show_debug_message("base_max_mana = " + string(base_max_mana))
		show_debug_message("active_mana = " + string(active_mana))
		
		show_debug_message("fully_drained = " + string(fully_drained))
		show_debug_message("half_drained = " + string(half_drained))
		show_debug_message("full = " + string(full))
		show_debug_message("half_full = " + string(half_full))
		show_debug_message("empty = " + string(empty))
		show_debug_message("half_crystal = " + string(half_crystal))
		
		show_debug_message("*****************************")
	*/
	#endregion Debug
	

#endregion Mana

#region Spells

	var spell_width = sprite_get_width(spr_spell_slot_template)
	var spell_height = sprite_get_height(spr_spell_slot_template)
	var spell_spacing = (spell_width);
	var spell_margin_x =  xx - (((total_spells + 1) * spell_width))/2
	var spell_margin_y = yy * 2 - (spell_height / 2) - 5;


	
	for(var i = 1; i <= total_spells; i++)
	{
		// Swap sprite image depending on if spell is selected
		if(active_spell == i)
		{
			draw_sprite(arr_active_spells[i].spr, 0, spell_margin_x + (i * spell_spacing), spell_margin_y)
		} else
		{
			draw_sprite(arr_active_spells[i].spr, 1, spell_margin_x + (i * spell_spacing), spell_margin_y)
		}
	}


#endregion Spells


