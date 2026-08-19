
function scr_get_sell_price(item)
{
	// Check if sell price should be added or subtracted from base item price
	// Position of item in array must be passed through
	// Returns adjusted price
	
	
	// Base price of item, before charisma modifiers
	base_price = inventory[item].price / 2
	
	// Total number to be added or subtracted to base price
	total_price_mod = (base_price * ((global.charisma-global.charisma_average) * global.price_mod))
	
	// Calculate new price
	price = floor(base_price + total_price_mod);

	
	
	show_debug_message("base_price: " + string(base_price))
	show_debug_message("total_price_mod: " + string(total_price_mod))
	show_debug_message("global.charisma: " + string(global.charisma))
	show_debug_message("global.charisma_average: " + string(global.charisma_average))
	show_debug_message("price: " + string(price))
	
	return price;
}