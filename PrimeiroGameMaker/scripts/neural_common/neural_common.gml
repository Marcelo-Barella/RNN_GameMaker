/*

	Definição de todas as funções gerais usadas na rede neural.
	
*/

/// @func	neuron_color(input);
///	@desc	Retorna um valor de cor dependendo do valor de entrada
/// @param	{real}	input
function neuron_color(input) {
	var R = clamp(-min(0, input)*255, 0, 255);
	var G = clamp(+max(0, input)*255, 0, 255);
	var B = 32;
	return make_color_rgb(R, G, B);
}


///	@func	approximate_derivative(func, input);
/// @desc	Retorna o derivativo aproximado para a função.
/// @param	{function}	func
/// @param	{real}		input
function approximate_derivative(func, input) {
	var epsilon = .00001;
	return (func(input+epsilon) - func(input-epsilon)) / (epsilon+epsilon);
}