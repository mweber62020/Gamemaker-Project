/// @description draw textbox

draw_self();
draw_set_font(dialogue);

//First column
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var top_left_x = x - (sprite_width / 2);
var top_left_y = y - (sprite_height / 2);
var xpadding = 20;
var ypadding = 10;
//Item 1 (sword)
if (global.item_array[0] = 0)
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding,$"???: {global.item_array[0]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding,$"Swords: {global.item_array[0]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 2 (berries)
if (global.item_array[1] = 0)
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 38,$"???: {global.item_array[1]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 38,$"Berries: {global.item_array[1]}",line_height, text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 3 (key piece)
if ((global.item_array[2] = 0) && (global.keyknown == false))
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 76,$"???: {global.item_array[2]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 76,$"Key pieces: {global.item_array[2]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 4 (key)
if (global.item_array[3] = 0)
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 114,$"???: {global.item_array[3]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 114,$"Keys: {global.item_array[3]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 5 (???)
if (global.item_array[4] = 0)
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 152,$"???: {global.item_array[4]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_left_x + xpadding,top_left_y + ypadding + 152,$"???: {global.item_array[4]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Second column
draw_set_halign(fa_right);
var top_right_x = x + (sprite_width / 2);
var top_right_y = y - (sprite_height / 2);
//Item 6 (???)
if (global.item_array[5] = 0)
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding,$"???: {global.item_array[5]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding,$"???: {global.item_array[5]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 7 (???)
if (global.item_array[6] = 0)
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 38,$"???: {global.item_array[6]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 38,$"???: {global.item_array[6]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 8 (???)
if (global.item_array[7] = 0)
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 76,$"???: {global.item_array[7]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 76,$"???: {global.item_array[7]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 9 (???)
if (global.item_array[8] = 0)
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 114,$"???: {global.item_array[8]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 114,$"???: {global.item_array[8]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);

//Item 10 (???)
if (global.item_array[9] = 0)
	draw_text_ext_color(top_right_x - xpadding,top_left_y + ypadding + 152,$"???: {global.item_array[9]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
else
	draw_text_ext_color(top_right_x - xpadding, top_right_y + ypadding + 152,$"???: {global.item_array[9]}",line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);