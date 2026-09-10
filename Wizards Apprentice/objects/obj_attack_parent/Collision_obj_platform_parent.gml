/// @description Elements

if(object_is_ancestor(other.object_index, obj_platform_void_parent)) instance_destroy()

if(interact_delay_active == false)
{
	scr_element_platform_interactions(id, other.id)
	
	if(move_spd != -1) instance_destroy()
}
