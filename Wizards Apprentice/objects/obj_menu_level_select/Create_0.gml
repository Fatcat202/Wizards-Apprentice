/// @description Insert description here
// You can write your code in this editor




spacer = 12;

cell_width = 64

row_length = 4;

slots = 8

// Width and height of inventory
width = 24 + row_length * cell_width;
height = cell_width + (((slots) div row_length) + 1) * cell_width;

// Menu Pos
x_pos = global.cam_target_x + (global.res_w / 2) - (width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (height / 2) + (spacer * 2) - 20;



level_select_x = x_pos + (width/2) - spacer;
level_select_y = y_pos + 20;
