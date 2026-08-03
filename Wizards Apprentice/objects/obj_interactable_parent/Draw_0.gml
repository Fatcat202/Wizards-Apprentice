/// @description E to Interact

draw_self()

if(within_range == true
	&& !layer_has_instance("Inventory", obj_inventory_parent)
	&& !layer_has_instance("Inventory", obj_dialogue_parent))
{
	draw_set_font(fnt_interact)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_center)
	draw_text(text_x, text_y, "E to Interact")
	
	scr_text_reset()
}
