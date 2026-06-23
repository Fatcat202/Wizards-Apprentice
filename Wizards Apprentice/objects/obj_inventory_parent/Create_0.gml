// Gap between slots and edge of inventory
spacer = 12;
		
inventory_row_length = 5;


inventory_slots = global.inventory_slots
		
// Width and height of inventory
inv_width = 24 + inventory_row_length * 64;
inv_height = 64 + (((inventory_slots - 1) div inventory_row_length) + 1) * 64;

x_pos = global.cam_target_x + (global.res_w / 2) - (inv_width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (inv_height / 2) + (spacer * 2) - 20;

