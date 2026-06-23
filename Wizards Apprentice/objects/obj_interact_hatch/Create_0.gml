/// @description OVERRIDE

// Inherit the parent event
event_inherited();

above_free = !place_meeting(x, y - global.cell_size, obj_platform_parent)

below_free = !place_meeting(x, y + global.cell_size, obj_platform_parent)

// X and Y coords setting where in next room player should be placed on transfer
// Set in instance creation code
target_x = -1
target_y = -1

if(above_free == true)
{
//	show_debug_message("Above Free")
	text_y = y - (sprite_height);
}else

if(below_free == true)
{
//	show_debug_message("Below Free")
	text_y = y + (sprite_height);
}else
{
	show_error("Error: Hatch Has No Free Space", true)
}