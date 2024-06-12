/// @func	neural_layer_input(size)
/// @desc	Cria a camada de entrad da rede neural, onde não possui camadas anteriores.
/// @param	{int}	size	Número de neurônios

function neural_layer_input(_size) : neural_layer_base(_size) constructor{
	static type = LayerType.INPUT;
	
	/// @func	Forward (input)
	/// @desc	Atyualiza as atividades dos neurônios dado um determinado array.
	/// @param	{array} input
	static Forward = function(_input) {
		var count = min(array_length(output), array_length(_input));
		array_copy(output, 0, _input, 0, count);
	}
}