/// @description Insert description here
// You can write your code in this editor


// Set selected room of level start button to number assigned to level_select button
if(instance_exists(obj_button_level_start)) obj_button_level_start.selected_level = room_num

//show_debug_message("room_num: " +string(room_num))

//show_debug_message(string(global.level_stats[room_num]))