/// @description Inserir descrição aqui
if room == rm_jogo{
	var _melhoria = choose(obj_melhoria_escudo, obj_melhoria_projetil);
	instance_create_layer(random_range(10, room_width), random_range(10, room_height), "Instances", _melhoria);
	alarm[0] = 600; //10 segundos
}