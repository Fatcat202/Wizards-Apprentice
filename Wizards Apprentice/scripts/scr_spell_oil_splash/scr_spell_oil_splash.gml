
function scr_spell_oil_splash(target_x = mouse_x, target_y = mouse_y)
{

	// Pull relevant details for easier to use variables
	scr_pull_spell_data("oil splash")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit
	

	oil_splash = instance_create_layer(x, y, "Spells", obj_spell_oil_splash)
		scr_push_spell_data(oil_splash)
		
		oil_splash.speed = 6
		oil_splash.direction = point_direction(x, y, target_x, target_y)
		oil_splash.image_angle = point_direction(x, y, target_x, target_y)

	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
	
	
}