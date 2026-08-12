/// @description Insert description here
// You can write your code in this editor


// Gap between slots and edge of inventory
spacer = 12;

inventory_row_length = 4;

inventory_slots = global.inventory_slots
		
// Width and height of inventory
inv_width = 24 + inventory_row_length * 64;
inv_height = 64 + (((global.inventory_slots - 1) div inventory_row_length) + 1) * 64;

// Used for placing specific inventory menu
x_pos_offset = 50

x_pos = global.cam_target_x + ((global.res_w / 2) / 2) - (inv_width / 2) + (spacer * 2) + x_pos_offset;
y_pos = global.cam_target_y + (global.res_h / 2) - (inv_height / 2) + (spacer * 2) - 20;

inventory = global.inventory


title_x = x_pos + inv_width/2 - spacer
title_y = y_pos + spacer
title_text = "Inventory"

