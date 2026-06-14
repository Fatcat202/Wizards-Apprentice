/// @description MP Grid Pathing Update

// Update grid to show positions of obstacles
mp_grid_clear_all(global.mp_grid)
mp_grid_add_instances(global.mp_grid, obj_platform_solid_parent, true);