/// @description Draw money GUI
if (room == rm_title) exit;
var padding = 8;
draw_sprite_ext(spr_coinPile, 0, padding, 1, 1.5, 1.5, 0, c_white, 1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(dialogue)
draw_text(padding + sprite_get_width(spr_coinPile) + 12, 15, "= " + string(global.item_array[99]));
