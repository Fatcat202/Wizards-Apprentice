// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_file_name(number)
{
	// Pass through number of file
	// Returns generated filename
	
	return "savegame" + string(number) + ".sav";
}