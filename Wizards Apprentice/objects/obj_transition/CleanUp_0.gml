/// @description On End

// Ensure pause is undone
scr_esc_resume()

// Reset variables
global.can_control_player = true
obj_player_parent.can_damage = true
obj_player_parent.can_be_stunned = true
obj_player_parent.can_attack = true