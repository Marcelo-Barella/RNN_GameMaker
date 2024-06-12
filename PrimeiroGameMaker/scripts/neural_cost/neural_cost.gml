/*

	Definição de todas as funções de custo usadas na rede neural.
	Todas as funções de custo são guardadas em um array global, e acessadas via index / identificador enum
	
	
*/

// Lista de todas as funções de custo disponíveis:

enum CostFunc {
	MSE,	// Média do Erro quadrático	
}

#macro COST_FUNC	global.gCOST_FUNCTION_ARRAY

COST_FUNC = [];
COST_FUNC[CostFunc.MSE] = neural_cost_mse;


//  MÉDIA DO ERRO QUADRÁTICO

/// @func	neural_cost_mse(input);
/// @desc	Função de custo para calcular o erro.
/// @desc	Calcula a performance/erro com a função de custo e atualiza o delta com deriVativos de funções de custo.
/// @param	{array}	delta
/// @param	{array}	predictions
/// @param	{array}	targets

function neural_cost_mse(delta, predictions, targets) {
	var error = 0;
	var count = array_length(delta);
	for (var i=0;i<count;i++){
		var prediction = predictions[i];
		var target = targets[i];
		//-- 
		error += sqr(prediction - target) * .5;
		delta[@i] = (prediction - target);
	}
	return error / count;
}