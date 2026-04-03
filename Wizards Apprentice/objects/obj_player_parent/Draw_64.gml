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
			draw_sprite(spr_heart_half, 0, margin_x + (_spacing * i), margin_y)
		}else if (empty_hearts > 0)
		{
			draw_sprite(spr_heart_empty, 0, margin_x + (_spacing * i), margin_y)
		}
	}
#endregion Hearts


#region Mana //FUNCTIONS PROPERLY IF BOTH base_max_mana AND mana_drain ARE EVEN

	// Mana location
	margin_y = margin_y * 3;
	_spacing = _spacing;
	margin_x = margin_x;
	
	// Total number of crystals to be displayed
	var total_crystals = ceil(base_max_mana / 2);
	
	// Presence of a half crystal
	var half_crystal = base_max_mana % 2;
	
	// Total number of whole drained crystals
	var drained_crystals = floor(mana_drain / 2);
	
	// Presence of a split drained/empty crystal
	var partial_drained_crystal = mana_drain % 2;
	
	// Presence of a split full/empty crystal
	var partial_full_crystal = (active_mana % 2);
	
	// Total number of whole full crystals
	var full_crystals = floor(active_mana / 2);

	// Total number of whole empty crystals
	var empty_crystals = floor((base_max_mana - mana_drain - active_mana) / 2);

	// Counter for number of crystals displayed
	var num_displayed = 1;
	
	
	// Display all fully drained crystals
	for(var i = 0; i < drained_crystals; i++)
	{
		draw_sprite(spr_mana_double_drained, 0, margin_x + (_spacing * num_displayed), margin_y)
		num_displayed++;
	}
	
	// Display half drained half full/empty crystal, if one exists
	if(partial_drained_crystal == true)
	{
		if(active_mana > 0)
		{
			draw_sprite(spr_mana_double_half_drained_full, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++
			
			if(active_mana == 1) partial_full_crystal = false
			
			
		} else if(active_mana + mana_drain != base_max_mana)
		{
			draw_sprite(spr_mana_double_half_drained_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++;
		}
	}
	
	// Display all full mana crystals
	for(var i = 0; i < full_crystals; i++)
	{
		draw_sprite(spr_mana_double_full, 0, margin_x + (_spacing * num_displayed), margin_y)
		num_displayed++;
	}
	
	// Display half full/empty crystal, if one exists
	if(partial_full_crystal == true)
	{	
		draw_sprite(spr_mana_double_half, 0, margin_x + (_spacing * num_displayed), margin_y)
		num_displayed++;
	}
	
	// Display all fully empty crystals
	for(var i = 0; i < empty_crystals; i++)
	{
		draw_sprite(spr_mana_double_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
		num_displayed++;
	}

	
	// Display last half crystal
	if(half_crystal == true)
	{
		if(mana_drain == base_max_mana)
		{
			draw_sprite(spr_mana_single_drained, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++;
		} else if(mana_drain + active_mana == base_max_mana)
		{
			draw_sprite(spr_mana_single_full, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++;
		} else
		{
			draw_sprite(spr_mana_single_empty, 0, margin_x + (_spacing * num_displayed), margin_y)
			num_displayed++;
		}
	}
	
	
	#region Debug
	
		
		show_debug_message("num_displayed - 1 = " + string(num_displayed - 1))
		show_debug_message("total_crystals = " + string(total_crystals))
		show_debug_message("full_crystals = " + string(full_crystals))
		show_debug_message("drained_crystals = " + string(drained_crystals))
		show_debug_message("empty_crystals = " + string(empty_crystals))
		show_debug_message("partial_drained_crystal = " + string(partial_drained_crystal))
		show_debug_message("partial_full_crystal = " + string(partial_full_crystal))
		show_debug_message("half_crystal = " + string(half_crystal))
		
		
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


