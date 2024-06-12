/// @func	neural_genetic_layer_crossover(child, parentA, parentB);
///	@desc	Modifica a camada do indivíduo alvo copiando partes dos pais.
///	@param	{layer}	child
///	@param	{layer}	parentA
///	@param	{layer}	parentB

function neural_genetic_layer_crossover(child, A, B){
	with(child) {
	switch(type) {
			// DENSE Muda os pesos e bias.
			case LayerType.DENSE:
				for (var i = 0; i<size;i++) {
					bias[@i] = choose(A, B).bias[i];
					for (var j=0; j<input.size; j++) {
						weights[@i][@j] = choose(A, B).weights[i][j];
					}
				}
			break;
			
			default: break;
	}
	}
}