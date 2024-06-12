/// @description Inserir descrição aqui
if alarm[0] <= 0{	
	if escudo == true {
		escudo = false;
	}else {
		vida -= 1;
	}
	
	with (other) {
		vida -= 1;
		other.fitness -= 180;
	}

	alarm[0] = 180;
}

