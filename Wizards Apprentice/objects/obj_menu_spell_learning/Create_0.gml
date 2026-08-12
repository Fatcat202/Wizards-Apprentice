/// @description 

// Determines if spell has been learned
spell_learned = -1

inv_width = 250
inv_height = 300

display_middle = global.cam_target_x + (global.res_w/2)
display_center = global.cam_target_y + (global.res_h/2)

// Used for placing menu location
x_pos_offset = 175

inv_x = display_middle - (inv_width/2) + x_pos_offset
inv_y = display_center - inv_height/2

top = inv_y
bottom = inv_y + inv_height
middle = inv_x + inv_width/2
center = inv_y + inv_height/2


title_x = middle
title_y = top + 25
title_text = "Spell Learning"

spell_title_x = middle
spell_title_y = center - 25
spell_title_text = "";
	
spell_desc_x = middle
spell_desc_y = center + 25
spell_desc_text = "";



learn_button_x = middle
learn_button_y = center + 100

spell_slot_x = middle - sprite_get_width(spr_inventory_slot)/2
spell_slot_y = center - 100