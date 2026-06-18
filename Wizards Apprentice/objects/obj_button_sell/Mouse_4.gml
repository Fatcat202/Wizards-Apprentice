/// @description Insert description here
// You can write your code in this editor


// Sell item for 1/2 price
global.party_gold += floor((global.inventory[item].price / 2))

// Remove item from inventory
scr_inventory_remove(global.inventory, global.inventory_slots, item)

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy(obj_button_use)