/// @func	scr_raycast(x, y, dir, range, obj);
///	@desc	Função responsável por encontrar a distância entre a nave e o objeto e retorna este valor normalizado entre 0 e 1.
/// @param	x		{real}		Posição X da nave
/// @param	y		{real}		Posição Y da nave
/// @param	dir		{real}		Ângulo
/// @param	range	{real}		Alcance do raio
///	@param	obj		{struct}	Objeto a procurar

function Ray(xx, yy, dir, range, obj){
	var sx = lengthdir_x(range, dir);
	var sy = lengthdir_y(range, dir);
	var dx = xx + sx;
	var dy = yy + sy;
	var dist = range;
	if (collision_line(xx, yy, dx, dy, obj, true, true) != noone) {
		while (abs(sx) >= 1 || abs(sy) >= 1) {
			sx *= .5;
			sy *= .5;
			if (collision_line(xx, yy, dx, dy, obj, true, true) == noone) {
				draw_line_width_colour(xx, yy, dx, dy, 10, c_lime, c_green);
				dx += sx;
				dy += sy;
			} else {
				dx -= sx;
				dy -= sy;
			}
		}
		dist =	point_distance(xx, yy, dx, dy);
		return dist / range;
	}
	return 0;
	
}