/// @description Inserir descrição aqui
draw_self();

if escudo == true {
	draw_sprite(spr_escudo, 0, x, y);
}



if (keyboard_check(vk_f2)) {
	for (var i=0;i<inputAsteroids;i++) {
		var dir = direction + (360 *i/inputAsteroids);
		var sx = lengthdir_x(range, dir);
		var sy = lengthdir_y(range, dir);
		var dx = x + sx;
		var dy = y + sy;
		var color = c_lime;
		if (collision_line(x, y, dx, dy, obj_parente_asteroide, true, true)) {
			color = c_red
		}
		if (collision_line(x, y, dx, dy, obj_parente_melhoria, true, true)) {
			color = c_blue
		}
		draw_line_width_colour(x, y, dx, dy, 1, color, color);
	}
}
