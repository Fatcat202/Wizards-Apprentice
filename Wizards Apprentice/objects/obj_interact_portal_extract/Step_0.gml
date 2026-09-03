/// @description Insert description here
// You can write your code in this editor


event_inherited()

if(collision_circle(x, y, global.cam_w, obj_enemy_parent, false, true))
{
	active = false;
}else active = true;


// Turn off visibility if not active
if(active == true)
{
	visible = true;
}else visible = false;