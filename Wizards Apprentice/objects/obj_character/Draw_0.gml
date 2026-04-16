/// @description Element Shields

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
			draw_sprite(spr_element_shield_fire, 0, x, y)
		}else if(element_shield == "Ice")
		{
			
			var ratio_h = sprite_get_width(spr_element_shield_ice) / spr_width
			var ratio_v = sprite_get_height(spr_element_shield_ice) / spr_height
			
			draw_sprite_ext(spr_element_shield_ice, 0, x, y, ratio_h, ratio_v, 0, c_white, 1)
		}else if(element_shield == "Shock")
		{
			draw_sprite(spr_element_shield_shock, 0, x, y)
		}else
		{
			show_debug_message("Error: Element Shield Cannot Be Displayed");
		}
	}
#endregion Element Shields

// Draw own sprite
draw_self()