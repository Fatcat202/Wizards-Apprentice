/// @description Draw Menu

// Draw black rectangle to darken background
draw_set_alpha(0.5)
	draw_set_color(c_black);
		draw_rectangle(0, 0, global.cam_target_x + (global.res_w), global.cam_target_y + (global.res_h), false)
	draw_set_color(c_white)
draw_set_alpha(1);
	

// Pause background image
draw_sprite(spr_menu_esc_background, 0, global.cam_target_x + (global.res_w / 2), global.cam_target_y + (global.res_h / 2));

