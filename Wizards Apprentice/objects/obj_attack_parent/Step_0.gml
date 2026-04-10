/// @description Element Delay


// Timer to prevent doubling up on element interactions
if(element_delay_timer > element_delay_length)
{
	element_delay_timer = 0;
	element_delay_active = false;
}else element_delay_timer++;
