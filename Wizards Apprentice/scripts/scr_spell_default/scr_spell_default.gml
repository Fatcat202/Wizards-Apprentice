// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spell_default(spell_name)
{
	// Pass through spell name as string
	
	scr_pull_spell_data(spell_name)

	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit
	
	var target_x = mouse_x;
	var target_y = mouse_y;

	// Create instance
	var spell = instance_create_layer(x, y, "Spells", obj_spell_default)
		scr_push_spell_data(spell)
		spell.speed = move_spd
		spell.direction = point_direction(x, y, target_x, target_y)
		spell.image_angle = point_direction(x, y, target_x, target_y)

	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
}