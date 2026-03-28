// Used to hold all game controls


function scr_get_controls()
{
	// Horizontal Movement
	global.cont_left = keyboard_check(ord("A"));
	global.cont_right = keyboard_check(ord("D"));
	
	// Jumping
	global.cont_jump_pressed = keyboard_check_pressed(vk_space);
	global.cont_jump_held = keyboard_check(vk_space);
	
	// Selecting Spells
	global.cont_spell_1 = keyboard_check_pressed(ord("1"))
	global.cont_spell_2 = keyboard_check_pressed(ord("2"))
	global.cont_spell_3 = keyboard_check_pressed(ord("3"))
	global.cont_spell_4 = keyboard_check_pressed(ord("4"))
	global.cont_spell_5 = keyboard_check_pressed(ord("5"))
	global.cont_spell_6 = keyboard_check_pressed(ord("6"))
	global.cont_spell_7 = keyboard_check_pressed(ord("7"))
	global.cont_spell_8 = keyboard_check_pressed(ord("8"))
	global.cont_spell_9 = keyboard_check_pressed(ord("9"))
	global.cont_spell_10 = keyboard_check_pressed(ord("0"))
		
	//Misc
	global.cont_attack = mouse_check_button(mb_left)
	global.cont_block = mouse_check_button(mb_right)
	global.cont_menu = keyboard_check(ord(vk_escape));
	
}