/// @func	neural_network();
/// @desc	Cria a estrutura base para a rede neural. Layers são adicionados via construtores.

function neural_network() constructor{
	static taped = false;
	layers = [];
	size = 0;
	first = undefined;
	last = undefined;
	add = new neural_builder(self);
	
	///@func	Input(input);
	///@desc	Atualiza as atividades dos primeiros neurônios;
	///@param	{any}	input	Depende da Camada de Entrada e qual informação deve ser alimentada. Agora apenas um array.
	static Input = function(_input) {
		first.Forward(_input);
	}
	
	/// @func Destroy();
	/// @desc	Destrói todas as camadas da rede neural.
	static Destroy = function() {
		for(var i = 0; i < size; i++) {
			layers[i].Destroy();
		}
		layers = [];
		size	= 0;
		first	= undefined;	
		last	= undefined;		
	}
	
	
	
	/// @func	Forward(input);
	/// @desc	Propaga o sinal do primeiro layer até o último.
	/// @param	{any}	input	[optional] Atualiza a atividade do primeiro layer dado um determinado argumento, Se não pula.
	static Forward = function(_input) {
		if (!is_undefined(_input)) Input(_input);
		
		for(var i = 1; i < size; i++) {
			layers[i].Forward();
		}
		
		return last.output;
	}
	
	/// @func	Draw(x, y, scale, xspacing, yspacing);
	/// @desc	Visualiza a rede neural desenhando as camadas fazendo a origem-x no meio da rele neural.
	/// @param	{real}	x
	/// @param	{real}	y
	/// @param	{real}	scale
	/// @param	{real}	xspacing
	/// @param	{real}	yspacing
	static Draw = function(xx, yy, scale, xspacing, yspacing) {
		xx -= xspacing * size/2;
		for	(var i=0; i<size;i++) {
			layers[i].Draw(xx, yy, scale, xspacing, yspacing);
			xx += xspacing;
		}
	}
}