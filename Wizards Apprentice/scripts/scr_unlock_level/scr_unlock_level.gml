// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unlock_level(room_num)
{
	// Sets level to unlocked
	// Pass through room number without offset applied
	
	// Apply offset
	level = room_num + global.level_offset - 1
	
	// Set as unlocked
	global.level_stats[level].level_unlocked = true;
}