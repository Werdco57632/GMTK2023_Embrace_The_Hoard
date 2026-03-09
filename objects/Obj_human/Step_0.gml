if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_wall,false,true)) {instance_destroy()}
var df_spd = 1
var df_vision = vision
if (Obj_cursor.upgrades[6]) {df_vision -= 8}
if (Obj_cursor.upgrades[7]) {df_vision -= 8}
if (Obj_cursor.upgrades[8]) {df_vision -= 8}

converter = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_zombie,false,true)
if (converter != noone) {
	df_spd /= 2
	if ((converter.ani_timer >= converter.max_ani_timer || (Obj_cursor.upgrades[3] && converter.ani_timer == floor(converter.max_ani_timer/2)) || (Obj_cursor.upgrades[4] && (converter.ani_timer == floor(converter.max_ani_timer/4) || converter.ani_timer == floor(converter.max_ani_timer*3/4))) || Obj_cursor.upgrades[5]) && !converter.inv) {
		Obj_cursor.converted += Obj_cursor.point_multiplier
		instance_create_layer(x,y,"Zombies",Obj_zombie)
		instance_destroy()
	}
}
zombie = collision_circle(x,y,df_vision,Obj_zombie,false,true)
if (zombie != noone) {
	if (!zombie.inv) {
		if (zombie.x != x || zombie.y != y) {
			if (has_weapon == 0) {
				run_x = x-64*(zombie.x-x)/sqrt(power(zombie.x-x,2)+power(zombie.y-y,2))
				run_y = y-64*(zombie.y-y)/sqrt(power(zombie.x-x,2)+power(zombie.y-y,2))
			} else {
				run_x = zombie.x
				run_y = zombie.y
			}
		} else {
			run_x = zombie.x
			run_y = zombie.y
		}
		is_running = true
		if (random_range(0,1) < Obj_cursor.mine_chance && can_mine) {instance_create_layer(x,y,"Walls",Obj_mine)}
		can_mine = false
	}
}
if (is_running) {
	image_index = 3*has_weapon+floor(2*ani_timer/max_ani_timer)
	if (ani_timer >= max_ani_timer) {
		ani_timer = 0
	}
	else {ani_timer++}
	if (run_x != x) {image_xscale = sign(run_x-x)}
	var xx = df_spd*(run_x-x)/sqrt(power(run_x-x,2)+power(run_y-y,2))
	var yy = df_spd*(run_y-y)/sqrt(power(run_x-x,2)+power(run_y-y,2))
	if (!collision_rectangle(bbox_left+spd*xx,bbox_top,bbox_right+spd*xx,bbox_bottom,Obj_wall,false,true)) {x += spd*xx}
	if (!collision_rectangle(bbox_left,bbox_top+spd*yy,bbox_right,bbox_bottom+spd*yy,Obj_wall,false,true)) {y += spd*yy}
	if (sqrt(power(run_x-x,2)+power(run_y-y,2)) <= 8) {
		is_running = false
		can_mine = true
		if (has_weapon > 0 && zombie != noone) {
			instance_create_layer(zombie.x,zombie.y,"Zombies",Obj_corpse)
			instance_destroy(zombie)
			zombie = noone
			if (random_range(0,1) >= Obj_cursor.human_resiliance) {
				Obj_cursor.converted += Obj_cursor.point_multiplier
				instance_create_layer(x,y,"Zombies",Obj_zombie)
				instance_destroy(self)
			}
		}
	}
} else {
	image_index = 3*has_weapon+2
	if (has_weapon == 0 && irandom_range(0,Obj_cursor.tool_pickup_time*60) == 0 && Obj_cursor.tool_pickup_time < 100 && Obj_cursor.upgrades[irandom_range(0,17)]) {
		has_weapon = irandom_range(1,2)
	}
}
depth = -y