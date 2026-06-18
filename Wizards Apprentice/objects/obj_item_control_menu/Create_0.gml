/// @description Variables


spr_width = sprite_get_width(sprite_index);
spr_height = sprite_get_height(sprite_index);

xx = x + spr_width / 2;
yy = y + spr_height / 2;

title_y = y - 80;
description_y = title_y + 30;

h_align = draw_get_halign();
v_align = draw_get_valign();