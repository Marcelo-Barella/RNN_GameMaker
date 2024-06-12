/// @func neural_taped_network();
/// @desc Cria uma rede neural onde utiliza uma estrutura de gradiente descendente para as camadas.
function neural_taped_network() : neural_network() constructor{
	static taped = true;
	error = 0;
	session = 0;
	
	/// @func	Cost(targets, costFunction);
	/// @desc	Calcula o erro para a camada ao comparar com o valor alvo.
	/// @param	{array}	targets
	/// @param	{enum} costFunc
	static Cost = function(targets, costFunction=CostFunc.MSE) {
		var CostFunction = COST_FUNC[costFunction];
		error = CostFunction(last.delta, last.output, targets);
		return error;
	}
	
	///	@func	Backward();
	/// @desc	Propaga o erro previamente calculado da última camada até a primeira.
	static Backward = function() {
		for(var i = size-1; i > 0; i--) {
			layers[i].Backward();
		}
		session++;
		return first.delta;
	}
	
	/// @func	Apply(learnRate);
	/// @desc	Gradiente descendente. Atualiza os parâmetros de aprendizado por meio de gradientes médios.
	/// @param	{real}	learnRate	O quão grande os passos são. Muito baixo pode fazer um aprendizado muito lento. Muito grande pode passar reto.
	static Apply = function(learnRate) {
		for (var i=1;i<size;i++) {
			if (layers[i].learnable) {
				layers[i].Apply(learnRate);
			}
		}
		session = 0;
	}
	
	
	/// @func	Destroy();
	/// @desc	Destrói todas as camadas da rede neural.
	static BaseDestroy = Destroy;
	static Destroy = function() {
		BaseDestroy();
		error = 0;
		session = 0;
	}
}