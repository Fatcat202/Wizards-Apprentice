/// @description Insert description here
// You can write your code in this editor


// Gap between slots and edge of inventory
spacer = 12;

inventory_row_length = 4;

inventory_slots = 16
		
// Width and height of inventory
inv_width = 24 + inventory_row_length * 64;
inv_height = 64 + ((inventory_slots) div inventory_row_length) * 64;


x_pos = global.cam_target_x + (global.res_w) - ((global.res_w / 2) / 2) - (inv_width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (inv_height / 2) + (spacer * 2) - 20;


#region Shop Contents

	// Row 1
	inventory[0] = global.item_stats[item_names.health_potion_light];
	inventory[1] = global.item_stats[item_names.health_potion_moderate];
	inventory[2] = global.item_stats[item_names.health_potion_severe];
	inventory[3] = global.item_stats[item_names.health_potion_critical];
	
	// Row 2
	inventory[4] = -1;
	inventory[5] = -1;
	inventory[6] = -1;
	inventory[7] = -1;
	
	// Row 3
	inventory[8] = -1;
	inventory[9] = -1;
	inventory[10] = -1;
	inventory[11] = -1;
		
	// Row 4
	inventory[12] = -1;
	inventory[13] = -1;
	inventory[14] = -1;
	inventory[15] = -1;

#endregion Shop Contents