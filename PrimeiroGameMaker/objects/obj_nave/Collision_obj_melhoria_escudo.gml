/// @description Inserir descrição aqui
audio_play_sound(snd_melhoria, 1, false);
escudo = true;
alarm[1] = 300;// 5 segundos

with (other) { 
	other.fitness += 80;
	instance_destroy();
}
