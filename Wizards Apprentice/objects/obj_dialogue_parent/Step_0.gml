/// @description Buttons


// Skip typewriter effect
if(global.cont_attack == true && next_pressed == false) text_display = arr_dialogue[position].text;


#region Buttons


	if(!instance_exists(obj_button_dialogue_leave))
	{
		instance_create_layer(button_leave_x, button_leave_y, "Menu_Buttons", obj_button_dialogue_leave)
	}
	
	// Display "Remind Me" Button
	if(arr_dialogue[position].order == 0)
	{
		// Destroy "Next" button
		if(instance_exists(obj_button_dialogue_next)) instance_destroy(obj_button_dialogue_next)
		
		if(!instance_exists(obj_button_dialogue_remind))
		{
			instance_create_layer(button_next_x, button_next_y, "Menu_Buttons", obj_button_dialogue_remind)
		}
	}else
	
	// Display "Next" button
	if(arr_dialogue[position].order != 0)
	{
		// Destroy "Remind Me" button
		if(instance_exists(obj_button_dialogue_remind)) instance_destroy(obj_button_dialogue_remind)
		
		if(!instance_exists(obj_button_dialogue_next))
		{
			instance_create_layer(button_next_x, button_next_y, "Menu_Buttons", obj_button_dialogue_next)
		}
	}
	
#endregion Buttons


#region Timer
	
	#region Typewriter
	
		// Typewriter timer							Check string of text_display is not larger or equal to dialogue text
		if(typewriter_timer >= typewriter_time && string_length(arr_dialogue[position].text) > string_length(text_display))
		{
			// Reset timer
			typewriter_timer = 0;
		
			// Gather next character in dialogue text
			var char = string_char_at(arr_dialogue[position].text, str_pos)
		
		
			// Increment position to gather next timer
			str_pos++
		
			// If next character exists, add to text_display string
			if(char != 1)
			{

				text_display += char;
			}

		
		}else typewriter_timer++;
	
		// Prevent overflow
		if(typewriter_timer > typewriter_time) typewriter_timer = 0;
	
		//show_debug_message(text_display)
	
	#endregion Typewriter
	
	
	#region Deactive Skip
	
		if(next_pressed == true)
		{
			if(deactive_skip_timer > deactive_skip_length)
			{
				next_pressed = false;
				deactive_skip_timer = 0;
			}else deactive_skip_timer++;
		}
	
	#endregion Deactive Skip
	
	
#endregion Timer




