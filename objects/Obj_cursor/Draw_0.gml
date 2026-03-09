if (room == Room_city_big || room == Room_crowd) {
	var rad = 0
	if (Obj_cursor.upgrades[9]) {rad++}
	if (Obj_cursor.upgrades[10]) {rad++}
	if (Obj_cursor.upgrades[11]) {rad++}
	if (mouse_check_button(mb_left) && !shop_open) {draw_sprite(Spr_cursor_radius,3*rad+floor((global.timer mod 24)/8),x,y)}

	var hover_shop = 0
	var cam_x = camera_get_view_x(camera_get_active())
	var cam_y = camera_get_view_y(camera_get_active())
	if (collision_rectangle(cam_x+16,cam_y+16,cam_x+28,cam_y+28,self,false,false)) {hover_shop = 1}
	if (hover_shop == 1 && mouse_check_button_pressed(mb_left)) {shop_open = !shop_open}
	if (shop_open) {
		hover_shop += 2
		draw_set_color(c_ltgray)
		draw_rectangle(cam_x,cam_y,cam_x+320,cam_y+240,false)
		draw_set_color(c_white)
		draw_sprite(Spr_gui_shop,global.timer,cam_x,cam_y)
		draw_sprite(Spr_tree,global.timer,cam_x+160,cam_y+120)
	
		#region buttons
		draw_set_font(font_num)
		button(cam_x+152,cam_y+112,-24,0,0,17)
		button(cam_x+152,cam_y+112,-48,0,1,0)
		button(cam_x+152,cam_y+112,-72,0,2,1)
		button(cam_x+152,cam_y+112,0,-24,3,17)
		button(cam_x+152,cam_y+112,0,-48,4,3)
		button(cam_x+152,cam_y+112,0,-72,5,4)
		button(cam_x+152,cam_y+112,24,0,6,17)
		button(cam_x+152,cam_y+112,48,0,7,6)
		button(cam_x+152,cam_y+112,72,0,8,7)
		button(cam_x+152,cam_y+112,20,18+8,9,17)
		button(cam_x+152,cam_y+112,40,36+8,10,9)
		button(cam_x+152,cam_y+112,60,54+8,11,10)
		button(cam_x+152,cam_y+112,80,72+8,12,11)
		button(cam_x+152,cam_y+112,-18,20+8,13,17)
		button(cam_x+152,cam_y+112,-36,40+8,14,13)
		button(cam_x+152,cam_y+112,-54,60+8,15,14)
		button(cam_x+152,cam_y+112,-72,80+8,16,15)
		#endregion
		}

	draw_sprite(Spr_shop,hover_shop,cam_x+16,cam_y+16)
	draw_set_font(font_num)
	draw_text(cam_x+30,cam_y+18,string(converted))

	if (!instance_exists(Obj_human)) {
		draw_sprite(Spr_txt_win,0,cam_x+160,cam_y)
		if (win != 1) {win = 1; audio_stop_all(); audio_play_sound(Snd_mus_win,41,true)}
	}
	else if (!instance_exists(Obj_zombie)) {
		draw_sprite(Spr_txt_win,1,cam_x+160,cam_y)
		if (win != -1) {win = -1; audio_stop_all(); audio_play_sound(Snd_mus_lose,41,true)}
	}
} else if (room == Room_intro) {
	draw_sprite_ext(Spr_intro,floor(global.timer/4),0,30,2/3,2/3,0,$FFFFFF,1)
	if (global.timer >= 163) {room_goto(Room_menu_main); audio_play_sound(Snd_mus_menu,41,true)}
}

draw_self()