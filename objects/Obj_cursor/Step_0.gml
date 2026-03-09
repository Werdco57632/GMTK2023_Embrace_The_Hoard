x = mouse_x
y = mouse_y
depth = -2*room_height

if (room == Room_city_big || room == Room_crowd) {
	if (!mouse_check_button(mb_right)) {
		if (mouse_wheel_up()) {scroll_dir = (0+2*invert_scroll) mod 4; scroll_time = 8}
		if (mouse_wheel_down()) {scroll_dir = (2+2*invert_scroll) mod 4; scroll_time = 8}
	} else {
		if (mouse_wheel_up()) {scroll_dir = (3+2*invert_scroll) mod 4; scroll_time = 8}
		if (mouse_wheel_down()) {scroll_dir = (1+2*invert_scroll) mod 4; scroll_time = 8}
	}

	if (scroll_time > 0) {
		switch (scroll_dir) {
			case 0: y = -16; break
			case 1: x = -16; break
			case 2: y = room_height+16; break
			case 3: x = room_width+16; break
			default: break
		}
		scroll_time--
	}

	//if (global.debug && mouse_check_button_pressed(mb_left)) {instance_create_layer(x,y,"Zombies",Obj_zombie)}
	//if (global.debug && mouse_check_button_pressed(mb_right)) {instance_create_layer(x,y,"Zombies",Obj_human)}

	if (keyboard_check_pressed(vk_escape)) {
		room_goto(Room_menu_main)
		converted = 0; win = 0
		audio_stop_all()
		audio_play_sound(Snd_mus_menu,41,true)
		upgrades = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true]
		shop_open = false
		}
	//if (keyboard_check_pressed(ord("Z"))) {converted += 100}
	//global.debug = keyboard_check(vk_control)
}
global.timer++



if (mouse_check_button_pressed(mb_left)) {grabbed = collision_point(x,y,Obj_zombie,false,true)}
if (grabbed != noone && instance_exists(grabbed) && (upgrades[12] || room == Room_menu_main || room == Room_menu_help || room == Room_menu_options) && mouse_check_button(mb_left)) {
	grabbed.inv = true
	grabbed.x = x
	grabbed.y = y
	grabbed.image_angle = 90/pi*sin(global.timer/16)
}
if (mouse_check_button_released(mb_left) && grabbed != noone && instance_exists(grabbed)) {
	grabbed.image_angle = 0
	grabbed.inv = false
	grabbed = noone
}