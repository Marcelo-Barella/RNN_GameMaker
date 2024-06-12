/// @description Inserir descrição aqui
move_wrap(true, true, 0);

image_angle += rotac;

if vida <= 0 {
	global.pont += 20;
	audio_play_sound(snd_explosao_asteroide, 1, false);
	repeat(4){
		instance_create_layer(x, y, "Instances", obj_detritos);
	}
	instance_destroy();
}

