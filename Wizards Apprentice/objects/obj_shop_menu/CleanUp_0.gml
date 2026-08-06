/// @description


if(instance_exists(obj_inventory_player_shop)) instance_destroy(obj_inventory_player_shop)
if(instance_exists(obj_inventory_shop)) instance_destroy(obj_inventory_shop)
if(instance_exists(obj_dialogue_shop)) instance_destroy(obj_dialogue_shop)

if(instance_exists(obj_button_shop_dialogue_page)) instance_destroy(obj_button_shop_dialogue_page)
if(instance_exists(obj_button_shop_shop_page)) instance_destroy(obj_button_shop_shop_page)

if(sprite_exists(global.pause_image)) sprite_delete(global.pause_image)

scr_shop_resume()