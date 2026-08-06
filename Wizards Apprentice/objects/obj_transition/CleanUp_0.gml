/// @description On End

// Ensure pause is undone
scr_esc_resume()
scr_inventory_resume()
scr_spellbook_resume()
scr_wizard_resume()
scr_shop_resume()

// Reset variables
global.can_control_player = true

if(instance_exists(obj_player_parent))
{
	obj_player_parent.can_damage = true
	obj_player_parent.can_be_stunned = true
	obj_player_parent.can_attack = true
}