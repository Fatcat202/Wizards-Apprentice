/// @description Enable Camera

view_enabled = true;
view_visible[0] = true

scr_load_room_chests()


// MP Grid used for pathing
global.mp_grid = mp_grid_create(0, 0, room_width / (global.cell_size/2), room_height / (global.cell_size/2), (global.cell_size/2), (global.cell_size/2));
	// Update grid to show positions of obstacles
	mp_grid_clear_all(global.mp_grid)
	mp_grid_add_instances(global.mp_grid, obj_platform_solid_parent, true);