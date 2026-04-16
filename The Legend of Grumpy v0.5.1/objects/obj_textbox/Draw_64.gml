/// @description Draw textbox

// Get the GUI canvas size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Draw the sprite centered horizontally, near the bottom
//draw_sprite(spr_textbox, 0, gui_w / 2, gui_h - 65); old size
var margin = 25;  // gap from left/right edges
var box_h = 120;  // height
var box_x = margin;
var box_y = gui_h - box_h - 10;
draw_sprite_stretched(spr_textbox, 0, box_x, box_y, gui_w - (margin * 2), box_h);

// Draw the text on top
draw_set_font(dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(gui_w / 2, box_y + box_h / 2, textToShow, line_height, gui_w - (margin * 2) - 40, c_white, c_white, c_white, c_white, image_alpha);
//draw_text_ext_color(gui_w / 2, gui_h - 65, textToShow, line_height, text_width, c_white, c_white, c_white, c_white, image_alpha); old text placement