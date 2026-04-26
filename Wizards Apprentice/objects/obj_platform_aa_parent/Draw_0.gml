/// @description Apply Texture



#region Dynamic Textures

	platform_texture = spr_tex_stone

	shader_set(shd_platform_multi_texture);

	var sampler_other = shader_get_sampler_index(shd_platform_multi_texture, "shape_texture");
	texture_set_stage(sampler_other, sprite_get_texture(sprite_index, 0));

	draw_sprite_ext(platform_texture, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);



	shader_reset();

#endregion Dynamic Textures

// Inherit the parent event
event_inherited();