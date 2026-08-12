/// @description


if(instance_exists(obj_dialogue_wizard)) instance_destroy(obj_dialogue_wizard)
if(instance_exists(obj_menu_spell_learning)) instance_destroy(obj_menu_spell_learning)
if(instance_exists(obj_inventory_player_spell_learning)) instance_destroy(obj_inventory_player_spell_learning)

if(instance_exists(obj_spell_learn_slot)) instance_destroy(obj_spell_learn_slot)

if(instance_exists(obj_button_wizard_dialogue_page)) instance_destroy(obj_button_wizard_dialogue_page)
if(instance_exists(obj_button_wizard_spell_learn_page)) instance_destroy(obj_button_wizard_spell_learn_page)


if(sprite_exists(global.pause_image)) sprite_delete(global.pause_image)

scr_wizard_resume()