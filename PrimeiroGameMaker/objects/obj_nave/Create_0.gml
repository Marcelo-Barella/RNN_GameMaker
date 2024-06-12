/// @desc Definição de valores base da nave
veloc = 2.3;
direc = 0;
vida = 5;
alfa_add = 0;
escudo = false;
dano_nave = 1;
fire_rate = 30;
range = 128;
/*

	REDE NEURAL
	
	Os inputs da rede neural, serão respecivamente:



	Os outputs da navem podem ser:
	
	Virar a direita;
	Virar a esquerda;
	Andar para frente;
	Andar para trás;
	Atirar;
	
	
	Para facilitar, diminuiremos o númearo de outputs
	Direita ou esquerda;
	Cima ou baixo;
	Atirar;

	A avaliação do indivíduo é dada pelas seguintes ações
	# Positivos:
	Ficar vivo 
	Acertar asteroides
	Pegar Power Ups
	
	# Negativos: 
	Tomar dano

*/

//inputAsteroid = 16;
inputAsteroids = 12;
inputPowerUp = 8;

sumInputs = inputAsteroids + inputPowerUp;

nn = new neural_network();
nn.add.Input(sumInputs);
nn.add.Dense(16, ActFunc.TANH);
nn.add.Dense(20, ActFunc.TANH);
nn.add.Dense(20, ActFunc.TANH);
nn.add.Dense(16, ActFunc.TANH);
nn.add.Dense(5, ActFunc.SIGMOID);

fitness = 0;

Restart = function() {
	x = room_width/2;
	y = room_height/2;
	direc = 0;
	fitness = 0;
	vida = 5;
}