
function scr_spell_water_splash(target_x = mouse_x, target_y = mouse_y)
{

	// Pull relevant details for easier to use variables
	scr_pull_spell_data("water splash")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit
	show_debug_message(duration)

	water_splash = instance_create_layer(x, y, "Spells", obj_spell_water_splash)
	
		scr_push_spell_data(water_splash)
		
		water_splash.speed = 6
		water_splash.direction = point_direction(x, y, target_x, target_y)
		water_splash.image_angle = point_direction(x, y, target_x, target_y)

	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)

}