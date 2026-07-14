/// @description Display



// Level Complete Text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_menu)
draw_set_colour(c_black)
	draw_text(level_complete_x, level_complete_y, "Level Complete!")


// Player Level
	draw_text(player_level_x, player_level_y, string(global.player_name) + " Level: " + string(global.player_level + global.player_free_level))

// XP gained
draw_set_halign(fa_right)
	draw_text(xp_gained_x, xp_gained_y, "XP Gained: " + string(global.player_earned_xp))
	
// Bonus XP
	draw_text(xp_bonus_x, xp_bonus_y, "Bonus XP: " + string(bonus_xp))
	
	
// XP total
draw_set_halign(fa_left)
	draw_text(xp_total_x, xp_total_y, "Total XP: " + string(global.player_xp))

// Rest alignment to center
draw_set_halign(fa_center)


// Bonus Gold
draw_set_halign(fa_right)
	draw_text(bonus_gold_x, bonus_gold_y, "Bonus Gold: " + string(bonus_gold))

// Total Gold
draw_set_halign(fa_left)
	draw_text(total_gold_x, total_gold_y, "Total Gold: " + string(global.player_gold))


// Reset text changes
scr_text_reset()

