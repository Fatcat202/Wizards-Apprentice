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

#region Mana
	// Total number of mana crystals
	var total_mana = ceil(max_mana / 2);
	// Total number of full double mana crystals
	var double_mana = floor(active_mana / 2);
	// Total number of single mana crystals
	var single_mana = max_mana % 2
	// Remainder of current crystals after full mana crystals
	var partial_double_mana = active_mana - (double_mana * 2)
	// Total number of empty crystals
	var empty_double_mana = total_mana - double_mana


	// Mana location
	margin_y = margin_y * 3
	_spacing = _spacing
	margin_x = margin_x
	
	// Display Mana Crystals
	for(var i = 1; i <= total_mana; i++)
	{
		if (i <= double_mana) 
		{
			// Display all full double mana crystals
			draw_sprite(spr_mana_double_full, 0, margin_x + (_spacing * i), margin_y)
			
		}else if (i == double_mana + 1 && partial_double_mana != 0 && max_mana != active_mana)
		{
			// Display all half double mana crystals
			draw_sprite(spr_mana_double_half, 0, margin_x + (_spacing * i), margin_y)
			
		}else if (empty_double_mana > 0 && i < total_mana)
		{
			// Display all empty double mana crystals
			draw_sprite(spr_mana_double_empty, 0, margin_x + (_spacing * i), margin_y)
			
		}else if(i == total_mana)
		{
			if(single_mana > 0)
			{
				if(active_mana == max_mana)
				{
					// Display full single mana crystal
					draw_sprite(spr_mana_single_full, 0, margin_x + (_spacing * i), margin_y)
				
				}else
				{
					// Display empty single mana crystal
					draw_sprite(spr_mana_single_empty, 0, margin_x + (_spacing * i), margin_y)
				}
			}else
			{
				draw_sprite(spr_mana_double_empty, 0, margin_x + (_spacing * i), margin_y)
			}
			
		}
		
	}
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


