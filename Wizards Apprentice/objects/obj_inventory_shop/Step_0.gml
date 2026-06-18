/// @description Run State and Page Buttons


// Always run state_free()
state_free()


var xx = x_pos + (0 + shop_slots mod inventory_row_length) * 64;
var yy = y_pos + (0 + shop_slots div inventory_row_length) * 64 + 40;

if(!instance_exists(obj_shop_page_1) && pages >= 1) instance_create_layer(xx, yy, "Menu_Buttons", obj_shop_page_1)
xx = x_pos + (1 + shop_slots mod inventory_row_length) * 64;
if(!instance_exists(obj_shop_page_2) && pages >= 2) instance_create_layer(xx, yy, "Menu_Buttons", obj_shop_page_2)
xx = x_pos + (2 + shop_slots mod inventory_row_length) * 64;
if(!instance_exists(obj_shop_page_3) && pages >= 3) instance_create_layer(xx, yy, "Menu_Buttons", obj_shop_page_3)
xx = x_pos + (3 + shop_slots mod inventory_row_length) * 64;
if(!instance_exists(obj_shop_page_4) && pages >= 4) instance_create_layer(xx, yy, "Menu_Buttons", obj_shop_page_4)
