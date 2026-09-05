/// @description Positioning

// When creating instance, pass through:
// title_text
// body_text
// button text

// Pause game if not already paused
if(global.game_paused == false)
{
	scr_message_pause();
}


// Alert positioning
width = 300;
height = 300;
x_pos = (global.cam_x + global.cam_w/2) - width/2;
y_pos = global.cam_y + global.cam_h/2 - height/2;

// Positioning offset due to unsymmetrical sprite
offset = 15;


// Main body text
body_text = "Empty";
body_line_sep = 14;
body_line_width = 200;

// Body positioning
body_x = x_pos + 75;
body_y = y_pos + 25;

// Text of exit button
button_text = "Continue"

// Button Positioning
button_x = x_pos + width/2 + offset;
button_y = y_pos + 265;

// Typewriter timer
typewriter_timer = 0
typewriter_time = 2
	
// Text displayed to screen
text_display = "";

// Position of character to gather from body_text
str_pos = 1