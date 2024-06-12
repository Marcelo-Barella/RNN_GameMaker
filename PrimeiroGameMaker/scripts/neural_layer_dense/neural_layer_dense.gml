/// @func	neural_layer_dense(input, size, activation);
/// @desc	Cria nova camada, que são totalmente conectados a camada anterior.
/// @param	{layer}	input	Camada da rede neural
/// @param	{int}	size	Número de neurônios
/// @param	{enum}	activation	Identificador enum para a função de ativação
 
function neural_layer_dense(_input, _size, _activation) : neural_layer_base(_size) constructor {
	static type = LayerType.DENSE;
	static learnable = true;
	input = _input;	
	activation = _activation;
	activity = array_create(size, 0);
	bias = array_create(size, 0);
	weights = array_create(size);
	
	
	for(var i = 0; i < size; i++) {
		bias[@i] = random_range(-.2, +.2);
		weights[@i] = array_create(input.size, 0);
		for(var j = 0; j < input.size; j++) {
			weights[@i][@j] = random_range(-.5, +.5);
		}
	}	
	
	
	/// @func	Forward()
	/// @desc	Envia o sinal (output) para a próxima camada. Calcula a atividade no neurônio como uma soma dos pesos e aplica a função de ativação.
	
	static Forward = function() {
		var Activation = ACTIVATION_FUNC[activation];
		for(var i = 0; i < size; i++) {
			var weightedSum = 0;
			for(var j = 0; j < input.size; j++) {
				weightedSum += input.output[j] * weights[i][j];
			}
			activity[@i] = weightedSum;
			
			output[@i] = Activation( weightedSum + bias[i] );
		}
	}
	
	
	/// @func	Draw(x, y, scale, xspacing, yspacing);
	/// @desc	Visualiza as atividades dos neurônios e seus pesos.
	/// @param	{real} x
	/// @param	{real} y
	/// @param	{real} scale
	/// @param	{real} xspacing
	/// @param	{real} yspacing
	static BaseDraw = Draw;
	static Draw = function(xx, yy, scale, xspacing, yspacing) {
		var ww = sprite_get_width(spr_neuron);
		var xi = xx - ww*scale/2;
		var xj = xx + ww*scale/2 - xspacing;
		var yi = yy - yspacing * size/2;
		var yj = yy;
		for (var i=0;i<size;i++) {
			yj = yy - yspacing * input.size/2;
			for (var j = 0;j<input.size;j++){
				var value = weights[i][j];
				var color = neuron_color(value);
				var width = min(2, value*8);
				draw_line_width_color(xi, yi, xj, yj, width, color, color);
				yj += yspacing;
			}
			yi += yspacing;
		}
		
		BaseDraw(xx, yy, scale, xspacing, yspacing);
		
	}
	
}