/// @description Insert description here
//Get camera location
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);
//get textbox location
inv_x = cam_x + (cam_width / 2); // Center textbox
inv_y = cam_y + cam_height - 113; // Offset 65 pixels above the bottom edge