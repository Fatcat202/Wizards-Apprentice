// Gap between slots and edge of inventory
spacer = 12;
		
inventory_row_length = 5;
		
// Width and height of inventory
inv_width = 24 + inventory_row_length * 64;
inv_height = 64 + (((global.inventory_slots - 1) div inventory_row_length) + 1) * 64;

// Menu Pos
x_pos = global.cam_target_x + (global.res_w / 2) - (inv_width / 2) + (spacer * 2);
y_pos = global.cam_target_y + (global.res_h / 2) - (inv_height / 2) + (spacer * 2) - 20;

// Use button pos
x_pos_use = 0;
y_pos_use = 0;


// Inventory Controls
inventory_hover = -1;
slot_hover = -1;
inventory_drag = -1;
slot_drag = -1;
item_drag = -1;
state = -1;
held = false;


	
function mouse_over()
{
	slot_hover = -1;
	inventory_hover = -1;
	
	
	// Create mouse over boxes for inventory slots
	for(var i = 0; i < global.inventory_slots; i++)
	{
		var xx = x_pos + (i mod inventory_row_length) * 64;
		var yy = y_pos + (i div inventory_row_length) * 64 + 40;
	
		var spr_width = sprite_get_width(spr_inventory_slot);
	
		if(point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + 64, yy + 64))
		{
			// Inventory slot
			slot_hover = i;
			
			// Inventory ID
			inventory_hover = id;
		}
	}
}


state_free = function()
{
	mouse_over();
	
	// Destroy control menu if control menu is active with left click
	if((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && instance_exists(obj_item_control_menu) && !held)
	{
		if(!position_meeting(mouse_x, mouse_y, obj_item_control_menu))
		{
			instance_destroy(obj_item_control_menu);
			if(instance_exists(obj_button_use)) instance_destroy(obj_button_use);
		}
	}
	
	// Begin drag with left click
	if(mouse_check_button(mb_left) && slot_hover != -1 && inventory_hover != -1 && !position_meeting(mouse_x, mouse_y, obj_item_control_menu))
	{
		
		//Enter drag state
		state = state_drag;
		item_drag = inventory_hover;
		inventory_drag = inventory_hover;
		slot_drag = slot_hover;
	}
	
	
	// Create control menu with right click
	if(mouse_check_button(mb_right) && slot_hover != -1 && inventory_hover != -1 && global.inventory[slot_hover] != -1)
	{
		// Destroy control menu if active
		if(instance_exists(obj_item_control_menu)) instance_destroy(obj_item_control_menu)
		if(instance_exists(obj_button_use)) instance_destroy(obj_button_use);
		
		xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
		yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));
		
		
		// Create control menu
		var menu = instance_create_layer(xx, yy, "Menu_Buttons", obj_item_control_menu)
			menu.title = global.inventory[slot_hover].title;
			menu.description = global.inventory[slot_hover].desc;
			menu.item = slot_hover
			
		// Set use button pos
		x_pos_use = menu.x + (sprite_get_width(spr_item_control_menu) / 2)
		y_pos_use = menu.y + 40
			
			
		var use = instance_create_layer(x_pos_use, y_pos_use, "Menu_Buttons", obj_button_use)
			use.item = slot_hover;

			
		// Indicate mb_right is being held
		held = true;

	}
	
	// Set held to false when no longer held
	if(!mouse_check_button(mb_right) || !position_meeting(x, y, obj_inventory_shop))
	{
		held = false;	
	}
	
	// Update positions when held
	if(mouse_check_button(mb_right) && instance_exists(obj_item_control_menu) && held)
	{
		// Clamp pos
		xx = clamp(mouse_x, global.cam_x, global.cam_x + global.res_w - (sprite_get_width(spr_item_control_menu)));
		yy = clamp(mouse_y, global.cam_y + (sprite_get_height(spr_item_control_menu) / 2), global.cam_y + global.res_h - (sprite_get_height(spr_item_control_menu) / 2));
		
		
		// Menu
		obj_item_control_menu.x = xx
		obj_item_control_menu.y = yy
		
		
		// Use button
		obj_button_use.x = xx + (sprite_get_width(spr_item_control_menu) / 2);
		obj_button_use.y = yy + 40;
		
	}
}
	

state_drag = function()
{
	mouse_over();
	
	if(!mouse_check_button(mb_left))
	{
		//Swap with slot if hovering
		if(slot_hover != -1) scr_inventory_swap(slot_drag, slot_hover)
		
		//Return to free state
		state = state_free;
		item_drag = -1;
		inventory_drag = -1;
		slot_drag = -1;
	}
}

// Set state
state = state_free;

