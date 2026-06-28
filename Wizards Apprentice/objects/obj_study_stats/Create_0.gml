/// @description Coords



inv_width = 300
inv_height = 320

inv_x = global.cam_target_x + ((global.res_w - inv_width)/2)
inv_y = global.cam_target_y + ((global.res_h - inv_height)/2)


inv_middle = inv_x + (inv_width/2)
inv_top = inv_y


player_level_x = inv_middle
player_level_y = inv_top + 30

xp_x = inv_middle
xp_y = inv_top + 60
xp_for_next_x = inv_middle
xp_for_next_y = inv_top + 80

stats_x = inv_middle
stats_start_y = inv_top + 110
stats_gap = 27

available_level_x = inv_middle
available_level_y = inv_top + 250

apply_button_x = inv_middle
apply_button_y = inv_top + 290

add_button_x = inv_middle + 75
subtract_button_x = inv_middle - 75


temp_vit = global.vitality;
temp_dex = global.dexterity;
temp_int = global.intelligence;
temp_mem = global.memory;
temp_cha = global.charisma;

temp_free_level = global.player_free_level;

// Buttons
add_vit = noone;
sub_vit = noone;
add_dex = noone;
sub_dex = noone;
add_int = noone;
sub_int = noone;
add_mem = noone;
sub_mem = noone;
add_cha = noone;
sub_cha = noone;

