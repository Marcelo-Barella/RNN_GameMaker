/// @description Geracao dos asteroides
time--;
if (time <= 0) {
	time = random_range(30, 40);
	
	var xx, yy;
	if (choose(true, false)) {
		xx = choose(0, room_width);
		yy = random_range(0, room_height);
	} else {
		xx = random_range(0, room_width);
		yy = choose(0, room_height);
	}
	
	instance_create_depth(xx, yy, 0, obj_asteroide_grande);
}