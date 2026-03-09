depth = -room_height-16
locked = 0
if (Obj_cursor.human_resiliance <= 0) {locked = 1}
if (Obj_cursor.human_resiliance >= 1) {locked = 2}
if (collision_rectangle(x-48,y,x-32,y+16,Obj_cursor,false,true)) {
	if (mouse_check_button(mb_left)) {draw_sprite(Spr_button_menu,26+5*locked,x,y)}
	else {draw_sprite(Spr_button_menu,25+5*locked,x,y)}
	if (mouse_check_button_released(mb_left)) {
		if (locked != 1) {Obj_cursor.human_resiliance -= 0.1}
	}
} else if (collision_rectangle(x+32,y,x+48,y+16,Obj_cursor,false,true)) {
	if (mouse_check_button(mb_left)) {draw_sprite(Spr_button_menu,28+5*locked,x,y)}
	else {draw_sprite(Spr_button_menu,27+5*locked,x,y)}
	if (mouse_check_button_released(mb_left)) {
		if (locked != 2) {Obj_cursor.human_resiliance += 0.1}
	}
} else {draw_sprite(Spr_button_menu,24+5*locked,x,y)}
draw_set_font(Obj_cursor.font_txt)
draw_text(x-30,y+5,"h. power:"+string(Obj_cursor.human_resiliance))