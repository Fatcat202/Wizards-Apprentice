/// @description Element Delay


// Timer to prevent doubling up on element interactions
if(element_delay_timer > element_delay_length)
{
	element_delay_timer = 0;
	element_delay_active = false;
}else element_delay_timer++;


// Destroying self if level decreases under zero for the purposes of spell interactions
if(level < 0) instance_destroy()