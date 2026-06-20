/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Total slots in chest. Edit in creation code
inventory_slots = 8

// Total gold stored in chest. Edit in creation code
chest_gold = 0


var num_slots = inventory_slots
// Inventory array
for(var i = 0; i <= num_slots; i++)
{
	arr_inventory_chest[i] = -1;
}



// Can assign items in creation code using:
// arr_inventory_chest["slot"] = global.item_stats[item_names."enter_name_here"]
