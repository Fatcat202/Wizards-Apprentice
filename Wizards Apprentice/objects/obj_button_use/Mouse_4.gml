/// @description Use



// Execute script and remove from inventory
script_execute(inventory[item].scr)
scr_inventory_remove(inventory, inventory_slots, item)

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy(obj_button_use)

