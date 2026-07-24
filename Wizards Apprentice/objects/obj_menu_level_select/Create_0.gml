/// @description


spacer = 12;

cell_width = 64

row_length = 4;

// Offset used to ignore wizard tower levels in array, set as first three rooms
slot_offset = 3

slots = array_length(global.arr_levels) - slot_offset

// Width and height of inventory
width = 24 + row_length * cell_width;
height = cell_width + ((slots div row_length)+2) * cell_width;

// Menu Pos
x_pos = global.cam_target_x + (global.res_w / 2) - (width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (height / 2) + (spacer * 2) - 20;


level_select_x = x_pos + (width/2) - spacer;
level_select_y = y_pos + 20;

level_start_x = x_pos + (width/2) - spacer;
level_start_y = y_pos + (height) - 48


