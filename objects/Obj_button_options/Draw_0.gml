depth = -room_height-16
if (collision_rectangle(x-32,y,x+32,y+16,Obj_cursor,false,true)) {
	if (mouse_check_button(mb_left)) {draw_sprite(Spr_button_menu,8,x,y)}
	else {draw_sprite(Spr_button_menu,7,x,y)}
	if (mouse_check_button_released(mb_left)) {
		room_goto(Room_menu_options)
	}
} else {draw_sprite(Spr_button_menu,6,x,y)}