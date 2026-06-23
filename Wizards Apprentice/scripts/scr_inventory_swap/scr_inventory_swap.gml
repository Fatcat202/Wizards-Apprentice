
function scr_inventory_swap(object_from, slot_from, object_to, slot_to)
{
	var item_from = object_from.inventory[slot_from];
	object_from.inventory[slot_from] = object_to.inventory[slot_to];
	object_to.inventory[slot_to] = item_from;
}