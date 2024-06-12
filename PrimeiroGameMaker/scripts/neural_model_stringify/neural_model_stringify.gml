// Utiliza técnica dummy-layers do próprio GML para gravar e recuperar a model.

///	@func	neural_model_stringify(target);
/// @desc	Cria um JSON String da model que pode ser convertido para JSON depois.
/// @param	{struct}	network
function neural_model_stringify(_target) {
	var _size = _target.size;
	var _layers = _target.layers;
	var _dummy = array_create(_size);
	for(var i = 0; i < _size; i++) {
		_dummy[i] = new neural_dummy_layer(_layers[i]);
	}
	
	return json_stringify(_dummy);
}

/// @func	neural_dummy_layer(target);
/// @desc	Criação do dummy layer. Pega referência	para informações necessárias
/// @param	{layer} target
function neural_dummy_layer(_layer) constructor {
	type = _layer.type;
	size = _layer.size;
	switch(_layer.type) {
		case LayerType.DENSE:
			activation = _layer.activation;
			weights = _layer.weights;
			bias = _layer.bias;
			break;
		default: break;
	}
}