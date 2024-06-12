/// @func	neural_taped_input(size)
/// @desc	Cria uma camada de entrada com uma estrutura gradiente
/// @param	{int}	size
function neural_taped_input(size) : neural_layer_input(size) constructor{
	static taped = true;
	delta = array_create(size, 0);
	
	/// @func Backward();
	static Backward = function() {
		for(var i = 0; i < size; i++) {
			delta[@i] = 0;
		}
	}
}