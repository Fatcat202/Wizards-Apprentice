/// @description


if(instance_exists(obj_button_page_1)) instance_destroy(obj_button_page_1)
if(instance_exists(obj_button_page_2)) instance_destroy(obj_button_page_2)
if(instance_exists(obj_button_page_3)) instance_destroy(obj_button_page_3)
if(instance_exists(obj_button_page_4)) instance_destroy(obj_button_page_4)

if(instance_exists(obj_study_spellbook)) instance_destroy(obj_study_spellbook)
if(instance_exists(obj_study_active_spells)) instance_destroy(obj_study_active_spells)
if(instance_exists(obj_study_stats)) instance_destroy(obj_study_stats)

if(instance_exists(obj_button_spellbook_page)) instance_destroy(obj_button_spellbook_page)
if(instance_exists(obj_button_stat_page)) instance_destroy(obj_button_stat_page)

if(sprite_exists(global.pause_image)) sprite_delete(global.pause_image)