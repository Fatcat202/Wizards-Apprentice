/// @description Insert description here
// You can write your code in this editor

if(!position_meeting(mouse_x, mouse_y, obj_button_main_menu_parent)
&& !point_in_rectangle(mouse_x, mouse_y, xpos-width/2, ypos-height/2, xpos+width/2, ypos+height/2))
{
	state = "none";
	
	layer_destroy_instances("Menu_Buttons")
}