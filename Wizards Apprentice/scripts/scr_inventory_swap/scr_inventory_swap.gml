
function scr_inventory_swap(slot_from, slot_to)
{
	var item_from = global.inventory[slot_from];
	global.inventory[slot_from] = global.inventory[slot_to];
	global.inventory[slot_to] = item_from;
}