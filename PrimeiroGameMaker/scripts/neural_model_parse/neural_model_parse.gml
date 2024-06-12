/// @func	neural_model_parse(jsonString, taped);
/// @desc	Cria uma nova rede baseado no JSON colado.
/// @param	{string}	jsonString
/// @param	{boolean}	taped
function neural_model_parse(_json, _taped=false) {
	try {
		var _layers = json_parse(_json);
		var _size = array_length(_layers);
		// Create network
		var _network = _taped
			? new neural_taped_network()
			: new neural_network();
		for(var i = 0; i < _size; i++) {
			neural_add_structure(_network, _layers[i]);
			neural_model_copy_layer(_network.layers[i], _layers[i]);
		}
		return _network;

	}  catch(_error) {
		show_debug_message(_error);
		show_debug_message("Parsing JSON failed. Check string validity.");
		return undefined;
	}
}

/// @func	neural_add_structure(network, layer);
/// @desc	Adiciona uma cópia estruturada da camada original utilizando o construtor do alvo.
/// @param	{struct}	network
/// @param	{layer}		layer
function neural_add_structure(_network, _layer) {
	var _add = _network.add;
	var _size = _layer.size;
	switch(_layer.type) {
		case LayerType.INPUT:	return _add.Input(_size);
		case LayerType.DENSE:	return _add.Dense(_size, _layer.activation);
		default: throw("Undefined layer structure type.");
	}
}