/// @description Insert description here
// You can write your code in this editor

var price = scr_get_sell_price(item)

// Sell item for 1/2 price
global.player_gold += price

// Remove item from inventory
scr_inventory_remove(global.inventory, global.inventory_slots, item)

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy(obj_button_use)