/// @func	neural_taped_dense(input, size, activation)
/// @desc	Cria uma camada densa (totalmente conectada) com uma estrutura gradiente
/// @param	{layer}	input
/// @param	{int}	size
/// @param	{enum}	activation
function neural_taped_dense(_input, _size, _activation) : neural_layer_dense(_input, _size, _activation) constructor {
	static taped = true;
	session = 0;
	delta = array_create(size, 0);
	
	tape_bias = array_create(size, 0);
	tape_weights = array_create(size);
	for(var i = 0; i < size; i++) {
		tape_weights[@i] = array_create(input.size, 0);
	}
	
	///	@func	Backward();
	///	@desc	Passa a informação do gradiente para a próxima camada. Atualiza os gradientes.
	static Backward = function() {
		var Derivative = DERIVATIVE_FUNC[activation];				
		for(var i = 0; i < size; i++) {								
			var gradient = delta[i] * Derivative(activity[i]);		
			for(var j = 0; j < input.size; j++) {					
				input.delta[@j] += weights[i][j] * gradient;		
				tape_weights[@i][@j] += input.output[j] * gradient;	
			}														
			tape_bias[@i] += gradient;								
			delta[@i] = 0;											
		}
		
		session++;
	}
	
	///	@func	Apply(learnRate);
	/// @desc	Usa o gradiente descendente para atualizar os parâmetros de aprendizado.
	/// @param	{real} learnRate
	static Apply = function(learnRate) {
		for(var i = 0; i < size; i++) {
			bias[@i] += -learnRate * tape_bias[i] / session;	
			tape_bias[@i] = 0;
		}
		for(var i = 0; i < size; i++) {
			for(var j = 0; j < input.size; j++) {
				weights[@i][@j] += -learnRate * tape_weights[i][j] / session;
				tape_weights[@i][@j] = 0;
			}
		}
		session = 0;
	}
}