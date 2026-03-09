draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,1)
if (global.debug && instance_exists(target) && target != noone) {
	draw_set_color(c_red)
	draw_set_font(asset_font)
	draw_text(target.x,target.y,"x")
	draw_set_color(c_white)
}