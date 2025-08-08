/// @description draw textbox

draw_self();

draw_set_font(dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
draw_text_ext_color(x,y,textToShow,line_height,text_width,c_white,c_white,c_white,c_white,image_alpha);
