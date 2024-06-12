/// @description Inserir descrição aqui
randomize();
alarm[0] = 600;

global.pont = 0;
global.bestFitness = 0;
alpha = 0;
alpha_add = 0;

view_visible[0] = true;

starting_room_width = view_wport[0];
starting_room_height = view_hport[0];

view_wport[0] = display_get_width();
view_hport[0] = display_get_height();

window_set_size(view_wport[0], view_hport[0])


global.aspect_ratio_x = abs((starting_room_width/view_wport[0])-1)
global.aspect_ratio_y = abs((starting_room_height/view_hport[0])-1)

window_set_position(0, 0)

if (view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface)) {
	surface_resize(application_surface, view_wport[0], view_hport[0])
}

// REDE NEURAL

generation = 0;
time = 0;


specimens = obj_nave;
big_asteroids = obj_asteroide_grande;
medium_asteroids = obj_asteroide_medio;
small_asteroids = obj_asteroide_pequeno;

count = 1;
population = array_create(count);
for (var i = 0; i<count;i++) {
	var xx = room_width/2;
	var yy = room_height/2;
	population[@i] = instance_create_depth(xx, yy, -2, specimens);
}