
function scr_inventory_swap(slot_from, slot_to, inventory = global.inventory)
{
	var item_from = inventory[slot_from];
	inventory[slot_from] = inventory[slot_to];
	inventory[slot_to] = item_from;
}