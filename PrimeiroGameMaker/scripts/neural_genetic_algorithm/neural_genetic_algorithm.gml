/// @func	neural_genetic_selection(population);
/// @desc	Ordena a população pela sua função avaliativa, quanto maior melhor.
///	@param	{array}	population	Array de structs/instances
function neural_genetic_selection(population) {
	array_sort(population, function (A, B) {
		return B.fitness - A.fitness;
	})
}

///	@func	neural_genetic_crossover(population, elitism);
///	@desc	Realiza a reprodução dos melhores indivíduos.
///	@param	{array}	population	Array de structs/instances.
///	@param	{real}	elitism	Qual porção será considerada elite para a reprodução, entre 0 e 1.
function neural_genetic_crossover(population, elitism) {
	var count = array_length(population);
	var eliteCount = max(1, ceil(count * elitism));
	
	for (var c = eliteCount; c < count; c++) {
		var parentA = population[irandom(eliteCount-1)].nn.layers;
		var parentB = population[irandom(eliteCount-1)].nn.layers;
		var child = population[c].nn.layers;
		
		var size = population[c].nn.size;
		for (var i = 1; i < size;i++) {
			neural_genetic_layer_crossover(child[i], parentA[i], parentB[i]);
		}
	}
}

/// @func	neural_genetic_mutate(population, start, stop, amount, rate);
/// @desc	Mutaciona porções da população.
///	@param	{array}	population	Array de structs/instances
///	@param	{real}	start		[0, 1] Posição inicial da porção.
///	@param	{real}	stop		[0, 1] Posição final da porção.
///	@param	{real}	amount		[0, 1] Número de mutações, relativo ao parâmetro size.
///	@param	{real}	rate		Taxa de mutação

function neural_genetic_mutate(population, start, stop, amount, rate) {
	var count = array_length(population);
		start = floor(start*count);
		stop  = ceil(stop*count);
	for (var c=start; c <stop;c++){
		var target = population[c].nn.layers;
		var size = population[c].nn.size;
		for (var i=1; i<size; i++) {
			neural_genetic_layer_mutate(target[i], amount, rate);
		}
	}
}