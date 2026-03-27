// Used to hold all game controls


function scr_get_controls()
{
	// Movement
	global.cont_left = keyboard_check(ord("A"));
	global.cont_right = keyboard_check(ord("D"));
	global.cont_jump_pressed = keyboard_check_pressed(vk_space);
		
	//Misc
	global.cont_attack = mouse_check_button(mb_left)
	global.cont_block = mouse_check_button(mb_right)
	global.cont_menu = keyboard_check(ord(vk_escape));
}