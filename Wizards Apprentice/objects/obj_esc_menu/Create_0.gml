/// @description Create Buttons

width = 250
height = 320


var cam_x = global.cam_target_x;
var cam_y = global.cam_target_y;

var esc_button_x = cam_x + 320;
var esc_button_y = cam_y + 55;
var esc_button_gap = 50;


// Only allow game to be saved if in wizard tower
var _can_save = false
if(room == rm_wizard_tower || room == rm_wizard_tower_top || room == rm_wizard_tower_cellar)
{
	_can_save = true;
}
	

if(!instance_exists(obj_help_screen))
{
	if !instance_exists(obj_button_resume) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_resume);
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_save_game) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_save_game,
		{
			can_save : _can_save
		});
	}
	esc_button_y += esc_button_gap;
	if !instance_exists(obj_button_load_game) {
	    instance_create_layer(esc_button_x, esc_button_y, "Menu_Buttons", obj_button_load_game);
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



