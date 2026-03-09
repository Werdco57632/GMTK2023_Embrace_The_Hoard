image_index = floor(2*ani_timer/max_ani_timer)

var df_spd = spd
if (Obj_cursor.upgrades[0]) {df_spd += 1}
if (Obj_cursor.upgrades[1]) {df_spd += 1}
if (Obj_cursor.upgrades[2]) {df_spd += 2}
if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,Obj_wall,false,true)) {
	if (!Obj_cursor.upgrades[16] && !inv) {instance_destroy()}
	else {df_spd = 1}
}

var df_max_target_timer = max_target_timer
var df_hunger = hunger
if (Obj_cursor.upgrades[13]) {df_max_target_timer -= 0; df_hunger += 0.25}
if (Obj_cursor.upgrades[14]) {df_max_target_timer -= 200; df_hunger += 0.5}
if (Obj_cursor.upgrades[15]) {df_max_target_timer -= 300; df_hunger += 0.25}

var df_follow_radius = follow_radius
if (Obj_cursor.upgrades[9]) {df_follow_radius += 16}
if (Obj_cursor.upgrades[10]) {df_follow_radius += 32}
if (Obj_cursor.upgrades[11]) {df_follow_radius += 64}

if (collision_circle(x,y,df_follow_radius,Obj_cursor,false,true) && mouse_check_button(mb_left)) {target = Obj_cursor}
else if (target == Obj_cursor) {target = noone}
if (target_timer >= df_max_target_timer) {
	if (random_range(0,1) > df_hunger) {target = noone}
	else {target = instance_nearest(x,y,Obj_human)}
	if (target = noone || !instance_exists(target)) {target = instance_nearest(x+irandom_range(-128,128),y+irandom_range(-128,128),Obj_wall)}
	if (collision_line(x,y,target.x,target.y,Obj_wall,false,true) && !Obj_cursor.upgrades[16]) {target = instance_nearest(x+irandom_range(-128,128),y+irandom_range(-128,128),Obj_wall)}
	target_timer = 0
} else {target_timer++}
if (target = noone || !instance_exists(target)) {target = instance_nearest(x+irandom_range(-128,128),y+irandom_range(-128,128),Obj_wall)}

if (target != Obj_cursor || sqrt(power(target.x-x,2)+power(target.y-y,2)) > 2) {
	if (ani_timer >= max_ani_timer) {ani_timer = 0}
	else {ani_timer++}
	if (ani_timer mod floor(max_ani_timer/2) == 0) {
		if (target.x != x) {image_xscale = sign(target.x-x)}
		var xx = df_spd*(target.x-x)/sqrt(power(target.x-x,2)+power(target.y-y,2))
		var yy = df_spd*(target.y-y)/sqrt(power(target.x-x,2)+power(target.y-y,2))
		if (!collision_rectangle(bbox_left+xx,bbox_top,bbox_right+xx,bbox_bottom,Obj_wall,false,true) || Obj_cursor.upgrades[16]) {x += xx}
		if (!collision_rectangle(bbox_left,bbox_top+yy,bbox_right,bbox_bottom+yy,Obj_wall,false,true) || Obj_cursor.upgrades[16]) {y += yy}
	}
} else {ani_timer = 0}
depth = -y