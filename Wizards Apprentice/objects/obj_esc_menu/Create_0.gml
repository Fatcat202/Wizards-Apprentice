/// @description Create Buttons

var cam_x = camera_get_view_x(CAMERA);
var cam_y = camera_get_view_y(CAMERA);

var esc_button_x = cam_x + 320;
var esc_button_y = cam_y + 80;
var esc_button_gap = 50;
	

if(!instance_exists(obj_help_screen))
{
	if !instance_exists(obj_button_resume) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_resume);
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_save_game) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_save_game);
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_help) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_help);
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_main_menu) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_main_menu);
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_quit_game) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_quit_game);
	}
}



