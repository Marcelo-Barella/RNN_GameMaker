/// @func	neural_genetic_layer_mutate(target, amount, rate);
///	@desc	Modifica a camada alvo por meio de modificações aleatórias nos parâmetros.
///	@param	{layer}	target	Camada alvo.
///	@param	{real}	amount	Tamanho relativo das mutações na camada.
///	@param	{rate}	rate	Número máximo de mudanças em uma direção por parâmetro.
function neural_genetic_layer_mutate(target, amount, rate){
	with(target) {
	switch(type) {
		case LayerType.DENSE:
			repeat(max(1, amount*size)) {
				var i = irandom(size-1);
				bias[@i] += random_range(-rate, +rate);
			}
			
			repeat(max(1, amount*size*input.size)) {
				var i = irandom(size-1);
				var j = irandom(input.size-1);
				weights[@i][@j] += random_range(-rate, +rate);
			}
		
		default: break;
	}
	}
}