/// @description On Click


// Remove spell from slot
global.active_spells[0, slot] = -1

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy()