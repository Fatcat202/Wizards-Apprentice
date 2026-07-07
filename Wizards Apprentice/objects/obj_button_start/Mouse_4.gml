/// @description Start Game


with(menu_id)
{


	if(temp_free_level == 0)
	{
		layer_destroy_instances("Menu_Buttons")
		
		state = "make_save_slot"
		
		instance_destroy(obj_button_start)
	}
}
