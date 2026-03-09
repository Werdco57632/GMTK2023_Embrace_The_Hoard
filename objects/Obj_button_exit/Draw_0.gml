depth = -room_height-16
if (collision_rectangle(x-32,y,x+32,y+16,Obj_cursor,false,true)) {
	if (mouse_check_button(mb_left)) {draw_sprite(Spr_button_menu,11,x,y)}
	else {draw_sprite(Spr_button_menu,10,x,y)}
	if (mouse_check_button_released(mb_left)) {
		game_end()
	}
} else {draw_sprite(Spr_button_menu,9,x,y)}