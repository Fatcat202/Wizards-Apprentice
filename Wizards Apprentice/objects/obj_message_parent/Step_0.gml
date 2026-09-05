/// @description Create Button


// Skip typewriter effect
if(global.cont_attack == true) text_display = body_text;

// Create button
if(!instance_exists(obj_button_message_exit) && body_text == text_display)
{
	var _button = instance_create_layer(button_x, button_y, "Menu_Buttons", obj_button_message_exit)
		_button.button_text = button_text;
}

#region Timer
	
	// Typewriter timer							Check string of text_display is not larger or equal to dialogue text
	if(typewriter_timer >= typewriter_time && string_length(body_text) > string_length(text_display))
	{
		// Reset timer
		typewriter_timer = 0;
		
		// Gather next character in dialogue text
		var char = string_char_at(body_text, str_pos)
		
		
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
	
#endregion Timer