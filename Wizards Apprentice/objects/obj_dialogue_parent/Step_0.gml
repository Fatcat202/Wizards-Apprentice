/// @description Buttons



#region Buttons


	if(!instance_exists(obj_button_dialogue_leave))
	{
		instance_create_layer(button_leave_x, button_leave_y, "Menu_Buttons", obj_button_dialogue_leave)
	}
	
	// Display "Remind Me" Button
	if(position == 0)
	{
		// Destroy "Next" button
		if(instance_exists(obj_button_dialogue_next)) instance_destroy(obj_button_dialogue_next)
		
		if(!instance_exists(obj_button_dialogue_remind))
		{
			instance_create_layer(button_next_x, button_next_y, "Menu_Buttons", obj_button_dialogue_remind)
		}
	}else
	
	// Display "Next" button
	if(position != 0)
	{
		// Destroy "Remind Me" button
		if(instance_exists(obj_button_dialogue_remind)) instance_destroy(obj_button_dialogue_remind)
		
		if(!instance_exists(obj_button_dialogue_next))
		{
			instance_create_layer(button_next_x, button_next_y, "Menu_Buttons", obj_button_dialogue_next)
		}
	}
	



#endregion Buttons