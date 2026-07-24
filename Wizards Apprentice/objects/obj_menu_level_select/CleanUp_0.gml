/// @description 

if(instance_exists(obj_button_level_select)) instance_destroy(obj_button_level_select)
if(instance_exists(obj_button_level_start)) instance_destroy(obj_button_level_start)
if(instance_exists(obj_item_control_menu)) instance_destroy(obj_item_control_menu)

if(sprite_exists(global.pause_image)) sprite_delete(global.pause_image)