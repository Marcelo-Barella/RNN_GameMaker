/// @description Inserir descrição aqui
var _dano = dano;
audio_play_sound(snd_hit, 1, false);
var _parent = parent;
with (other) {
	vida -= _dano;
	if (_parent != noone) {
		_parent.fitness += 40;
	}
}

instance_destroy();


