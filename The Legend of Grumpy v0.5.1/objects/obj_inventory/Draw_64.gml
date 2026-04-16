/// @description Draw inventory (GUI layer)

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Same position/size as the textbox
var margin = 25;
var box_h = 200;
var box_x = margin;
var box_y = gui_h - box_h - 10;
draw_sprite_stretched(spr_inventory, 0, box_x, box_y, gui_w - (margin * 2), box_h);

draw_set_font(dialogue);

// Corners derived from box position
var top_left_x = box_x;
var top_left_y = box_y;
var top_right_x = gui_w - margin;
var top_right_y = box_y;
var xpadding = 20;
var ypadding = 10;

//First column
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Item 1 (sword)
if (!global.item_known[0])
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding,$"???: {global.item_array[0]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding,$"Swords: {global.item_array[0]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 2 (berries)
if (!global.item_known[1])
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 38,$"???: {global.item_array[1]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 38,$"Berries: {global.item_array[1]}",line_height, text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 3 (key piece)
if (!global.item_known[2])
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 76,$"???: {global.item_array[2]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 76,$"Key pieces: {global.item_array[2]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 4 (key)
if (!global.item_known[3])
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 114,$"???: {global.item_array[3]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 114,$"Keys: {global.item_array[3]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 5 (special key)
if (!global.item_known[4])
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 152,$"???: {global.item_array[4]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 152,$"Special Keys: {global.item_array[4]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Second column
draw_set_halign(fa_right);

//Item 6 (note)
if (!global.item_known[5])
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding,$"???: {global.item_array[5]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding,$"Notes: {global.item_array[5]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 7 (???)
if (!global.item_known[6])
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 38,$"???: {global.item_array[6]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 38,$"???: {global.item_array[6]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 8 (???)
if (!global.item_known[7])
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 76,$"???: {global.item_array[7]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 76,$"???: {global.item_array[7]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 9 (???)
if (!global.item_known[8])
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 114,$"???: {global.item_array[8]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 114,$"???: {global.item_array[8]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 10 (???)
if (!global.item_known[9])
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 152,$"???: {global.item_array[9]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 152,$"???: {global.item_array[9]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);