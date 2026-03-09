// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button(c_x,c_y,o_x,o_y,index,pre_index){
	draw_sprite(Spr_button,index,c_x+o_x,c_y+o_y)
	if (upgrades[pre_index]) {
		if (!upgrades[index]) {
			if (point_in_rectangle(x,y,c_x+o_x,c_y+o_y,c_x+o_x+16,c_y+o_y+16)) {
				if (converted >= cost[index]) {
					draw_sprite(Spr_color,0,c_x+o_x,c_y+o_y)
					if (mouse_check_button_pressed(mb_left)) {
						upgrades[index] = true
						converted -= cost[index]
					}
				} else {draw_sprite(Spr_color,3,c_x+o_x,c_y+o_y)}
				draw_text(c_x+o_x+2,c_y+o_y+4,cost[index])
			}
		} else {draw_sprite(Spr_color,2,c_x+o_x,c_y+o_y)}
	} else {draw_sprite(Spr_color,1,c_x+o_x,c_y+o_y)}
}