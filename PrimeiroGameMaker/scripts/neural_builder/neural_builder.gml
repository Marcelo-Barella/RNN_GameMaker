/// @func	neural_builder(target);
/// @desc	Apenas um ajudante para construção de novas camadas para a Rede Neural, para que não tenhamos que fazer no construtor principal.
/// @param	{neural_network}	target
function neural_builder(_target) constructor{
	nn = _target;
	
	/// @func	ADD(layer);
	/// @desc	Função ajudante para adicionar layers para a rede neural alvo (target).
	static ADD = function(_layer) {
		array_push(nn.layers, _layer);
		nn.last = _layer;
		nn.size = array_length(nn.layers);
		return _layer;
	}
	
	/// @func	Input(size);
	/// @desc	Carrega a Camada de Entrada para a rede neural alvo.
	/// @param {int} size
	static Input = function(_size) {
		if (!is_undefined(nn.first)) {
			throw("Não é possível adicionar outra camada de entrada!");
		}
		nn.first = (nn.taped)
			? ADD(new neural_taped_input(_size))
			: ADD(new neural_layer_input(_size));
		return nn.first; 
	}
	
	/// @func	Dense(size, activation)
	///	@desc	Cria nova camada totalmente conectado para a rede neural alvo.
	/// @param	{int}	size	Quantos neurônios a camada vai ter. Tamanha da camada.
	/// @param	{enum}	activation	Identificador enum para a função de ativação, index do array global.
	static Dense = function(_size, _activation) {
		return (nn.taped)
			? ADD(new neural_taped_dense(nn.last, _size, _activation)) 
			: ADD(new neural_layer_dense(nn.last, _size, _activation)); 
	}
}