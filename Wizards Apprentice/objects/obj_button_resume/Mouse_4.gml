/// @description Resume Game

global.game_esc_paused = false;
scr_esc_resume();

instance_destroy(obj_esc_menu)
layer_destroy_instances("Menu_Buttons")