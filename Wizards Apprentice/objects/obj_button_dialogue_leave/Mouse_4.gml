/// @description When Pressed

if(!instance_exists(obj_shop_menu) && !instance_exists(obj_wizard_menu))
{
	if(instance_exists(obj_dialogue_parent)) instance_destroy(obj_dialogue_parent)
}
if(instance_exists(obj_shop_menu)) instance_destroy(obj_shop_menu)
if(instance_exists(obj_wizard_menu)) instance_destroy(obj_wizard_menu)
