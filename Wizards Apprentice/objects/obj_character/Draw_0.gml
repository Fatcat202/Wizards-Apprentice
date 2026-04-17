/// @description Effects

// Sprite width
var spr_width = sprite_get_width(sprite_index)
	var spr_width_half = spr_width / 2
// Sprite height
var spr_height = sprite_get_height(sprite_index)
	var spr_height_half = spr_height / 2


#region Element Shields
	if(element_shield != "Empty")
	{
		if(element_shield == "Fire")
		{
			var ratio_h = sprite_get_width(spr_element_shield_fire) / spr_width
			var ratio_v = sprite_get_height(spr_element_shield_fire) / spr_height
			
			draw_sprite_ext(spr_element_shield_fire, 0, x, y, ratio_h, ratio_v, 0, c_white, 1)
		}else if(element_shield == "Ice")
		{
			
			var ratio_h = sprite_get_width(spr_element_shield_ice) / spr_width
			var ratio_v = sprite_get_height(spr_element_shield_ice) / spr_height
			
			draw_sprite_ext(spr_element_shield_ice, 0, x, y, ratio_h, ratio_v, 0, c_white, 1)
		}else if(element_shield == "Shock")
		{
			var ratio_h = sprite_get_width(spr_element_shield_shock) / spr_width
			var ratio_v = sprite_get_height(spr_element_shield_shock) / spr_height
			
			draw_sprite_ext(spr_element_shield_shock, 0, x, y, ratio_h, ratio_v, 0, c_white, 1)
		}else
		{
			show_debug_message("Error: Element Shield Cannot Be Displayed");
		}
	}
#endregion Element Shields

#region Stunned
	
	if(is_stunned == true)
	{
		var ratio_h = sprite_get_width(spr_stunned) / spr_width
		var ratio_v = sprite_get_height(spr_stunned) / spr_height
		
		draw_sprite_ext(spr_stunned, image_index, x, y, ratio_h, ratio_v, 0, c_white, 1)
	}
	
#endregion Stunned

// Draw own sprite
draw_self()