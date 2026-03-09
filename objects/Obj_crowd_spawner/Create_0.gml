for (i = 0; i <= room_width; i += 16) {
	for (j = 0; j <= room_width; j += 16) {
		if (!collision_point(i,j,Obj_wall,false,true) && random_range(0,1) < Obj_cursor.population_density) {instance_create_layer(i,j,"Zombies",Obj_human)}
	}
}