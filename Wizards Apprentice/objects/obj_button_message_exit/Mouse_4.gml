/// @description When Pressed


// Destroy message parent
if(instance_exists(obj_message_parent)) instance_destroy(obj_message_parent)

// Resume game
scr_message_resume()

// Destroy self
instance_destroy()
