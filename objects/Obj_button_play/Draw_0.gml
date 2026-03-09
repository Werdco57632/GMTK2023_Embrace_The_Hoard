depth = -room_height-16
if (collision_rectangle(x-32,y,x+32,y+16,Obj_cursor,false,true)) {
	if (mouse_check_button(mb_left)) {draw_sprite(Spr_button_menu,2,x,y)}
	else {draw_sprite(Spr_button_menu,1,x,y)}
	if (mouse_check_button_released(mb_left)) {
		audio_stop_all()
		audio_play_sound(Snd_mus,41,true)
		if (Obj_cursor.game_room = 0) {room_goto(Room_city_big)}
		else {room_goto(Room_crowd)}
	}
} else {draw_sprite(Spr_button_menu,0,x,y)}
