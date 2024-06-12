/// @description Inserir descrição aqui
audio_play_sound(snd_melhoria, 1, false);
alarm[2] = 300; //5 segundos
dano_nave = 2;

with (other) {
	other.fitness += 80;
	instance_destroy();
}
