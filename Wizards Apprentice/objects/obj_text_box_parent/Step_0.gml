/// @description Text Entry

// Set focused false
if((global.cont_attack && !point_in_rectangle(mouse_x, mouse_y, x - width/2, y - height/2, x + width/2, y + height/2))
	|| keyboard_check_pressed(vk_enter))
{
	focused = false
}else

// Set focused true
if(global.cont_attack && point_in_rectangle(mouse_x, mouse_y, x - width/2, y - height/2, x + width/2, y + height/2))
{
	if(focused == false)
	{
		focused = true;
	}else
	
	if(focused == true)
	{
		focused = false;
	}
}



// If player text input is focused
if(focused == true)
{
	// Apply text input
	
	// Check if a keyboard key is being pressed
	if(keyboard_key != 0 && string_length(entry_text) < max_text_length && !keyboard_check_pressed(ord(vk_backspace)))
	{
		entry_text = keyboard_string
	}else
	
	if(keyboard_check_pressed(ord(vk_backspace)))
	{
		length = string_length(entry_text)
		entry_text = string_delete(entry_text, length, 1)
	}
	
	// Flip image index to show focused
	image_index = 1
}else
{
	// Flip image index to show unfocused
	image_index = 0;
}

// Keep keyboard string as entry text to prevent incorrectly entering characters
keyboard_string = entry_text;

