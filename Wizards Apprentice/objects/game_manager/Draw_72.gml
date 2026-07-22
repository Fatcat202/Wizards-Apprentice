/// @description Pause Image


// Display Pause Image
if(!layer_exists("Pause_Image") && global.show_inventory)
{
	layer_create(900, "Pause_Image")
	draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)
	layer_set_visible("Background", false)
}else

// Destroy Pause Image
if(layer_exists("Pause_Image") && !global.game_paused)
{
	layer_destroy("Pause_Image")
	sprite_delete(global.pause_image)
	layer_set_visible("Background", true)
	
}