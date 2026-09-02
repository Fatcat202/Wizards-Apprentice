// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spell_lightning_bolt()
{
	// Pull relevant details for easier to use variables
	scr_pull_spell_data("lightning bolt")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit;
	
	
	var player_x = obj_player_parent.x
	var player_y = obj_player_parent.y
	
	// Direction spell is being used
	var dir = point_direction(player_x, player_y, mouse_x, mouse_y)
	
	// Base length
	var _length = global.cam_w;
	
	// Find location to target
	var xx = player_x + lengthdir_x(_length, dir)
	var yy = player_y + lengthdir_y(_length, dir)
	
	// Find first platform in a line using direction and length
	var ds_plats = ds_list_create()
	var num_plats = collision_line_list(player_x, player_y, xx, yy, obj_platform_parent, false, true, ds_plats, true)
	
	// Place first instance found into variable, else set as noone
	var plat_id = noone
	if(!ds_list_empty(ds_plats))
	{
		plat_id = ds_plats[| 0]
	}
	
	// Memory reset
	ds_list_destroy(ds_plats)
	
	// If a platform is found, use its coords to create a new length
	if(plat_id != noone)
	{
		_length = point_distance(player_x, player_y, plat_id.x, plat_id.y);
	}
	// Prevent overflow
	if(_length < 0)
	{
		_length = 0;
	}
	

	// Spawn object
	var spell = instance_create_layer(player_x, player_y, "Spells", obj_spell_lightning_bolt,
	{
		direction : point_direction(player_x, player_y, xx, yy),
		image_angle : point_direction(player_x, player_y, xx, yy)
	})
	scr_push_spell_data(spell)
	
	// Gather x_scale
	var x_scale = (_length/sprite_get_width(spell.sprite_index))
	spell.image_xscale = x_scale;
	
	/*
	// Debug
	show_debug_message("dir: " + string(dir))
	show_debug_message("_length: " + string(_length))
	show_debug_message("plat_id: " + string(plat_id))
	show_debug_message("xx: " + string(xx))
	show_debug_message("yy: " + string(yy))
	show_debug_message("x_scale: " + string(x_scale))
	show_debug_message("sprite_get_width(spr): " + string(sprite_get_width(spr)))
	*/

	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
}