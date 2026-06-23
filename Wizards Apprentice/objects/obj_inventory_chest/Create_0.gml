/// @description Insert description here
// You can write your code in this editor


// Manually set inventory in creation event in room using:
// inventory["Inventory Slot Here"] = global.item_stats[item_names."Item Name Here"]

// Manually set gold in create event using:
// chest_gold = "Set Gold Here"


// Gap between slots and edge of inventory
spacer = 12;

inventory_row_length = 4;

// Width and height of inventory
inv_width = 24 + inventory_row_length * 64;
inv_height = 64 + (((inventory_slots) div inventory_row_length) + 1) * 64;

// Take Gold button
take_gold = noone

// Menu Pos
x_pos = global.cam_target_x + (global.res_w) - ((global.res_w / 2) / 2) - (inv_width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (inv_height / 2) + (spacer * 2) - 20;
