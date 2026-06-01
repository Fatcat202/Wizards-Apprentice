/// @description

// Set position
xpos = 499
ypos = 191
x = xpos
y = ypos

// State used for detemining what menu options to show in step
state = "none"

// Menu positions for placing buttons
width = sprite_get_width(sprite_index)
height = sprite_get_height(sprite_index)

x_left = x - (width / 2);
x_right = x + (width / 2);
y_top = y - (height / 2);
y_bottom = y + (height / 2);

