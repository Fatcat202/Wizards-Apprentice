// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spell_jolt(target_x = mouse_x, target_y = mouse_y)
{
	scr_pull_spell_data("jolt")
	
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit
	

	jolt = instance_create_layer(x, y, "Spells", obj_spell_jolt)
	
		scr_push_spell_data(jolt)
		
		jolt.speed = 6
		jolt.direction = point_direction(x, y, target_x, target_y)
		jolt.image_angle = point_direction(x, y, target_x, target_y)


	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
}