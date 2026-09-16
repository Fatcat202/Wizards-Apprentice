/// @description Optimisation

var xx = global.cam_x-global.disable_range/2
var yy = global.cam_y - global.disable_range/2
instance_deactivate_region(xx, yy, global.disable_range*2, global.disable_range*2, false, true)
instance_activate_object(game_manager)
instance_activate_object(obj_transition)
instance_activate_object(obj_mouse)
instance_activate_object(obj_death_menu)
instance_activate_object(obj_level_end)
instance_activate_object(obj_player_parent)
instance_activate_region(xx, yy, global.disable_range*2, global.disable_range*2, false)
