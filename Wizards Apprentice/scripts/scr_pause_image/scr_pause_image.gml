function scr_pause_image()
{
	layer_create(600, "Pause_Sprites");
	with(obj_attack_parent)
	{

		var sprite = layer_sprite_create("Pause_Sprites", x, y, sprite_index);
			layer_sprite_xscale(sprite, image_xscale);
			layer_sprite_yscale(sprite, image_yscale);
			layer_sprite_angle(sprite, image_angle);
			layer_sprite_index(sprite, image_index);
			layer_sprite_speed(sprite, 0);
			layer_sprite_blend(sprite, image_blend)
			
	}

}