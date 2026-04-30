/// @description Surface Creation Backup

// Inherit the parent event
event_inherited();

// Recreate surface if destroyed
if(!surface_exists(surf))
{
	surf = surface_create(sprite_width, sprite_height);
}