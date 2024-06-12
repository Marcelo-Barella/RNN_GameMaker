enum LayerType {
	BASE,
	INPUT,
	DENSE
}

/// @func	neural_layer_base(size)
///	@desc	Base para todas as camadas da rede neural, onde todas as camadas herdam. Não é uma camada utilizável.
/// @param	{int}	size	Número de neurônios
function neural_layer_base(_size){
	static type = LayerType.BASE;
	static learnable = false;
	static taped = false;
	size = _size;
	input = undefined;
	output = array_create(size, 0)
	
	/// @func	Forward()
	/// @desc	Como as atividades do neurônio são atualizadas
	static Forward = function() {}
	
	/// @func	Destroy()
	/// @desc	Destrói a camada, caso alguma estrutura precise ser deletada
	static Destroy = function() {}
	
	///	@func	Draw(x, y, scale, xspacing, yspacing);
	///	@desc	Visualiza as atividades dos neurônios da camada dado as posições e escala fazendo a origem-y no meio da rele neural.
	/// @param	{real}	x
	/// @param	{real}	y
	/// @param	{real}	scale
	static Draw = function(xx, yy, scale, xspacing, yspacing) {
		yy -= yspacing * size/2;
		for (var i=0; i<size;i++) {
			var color = neuron_color(output[i]);
			draw_sprite_ext(spr_neuron, 0, xx, yy, scale, scale, 0, c_white, 1);
			draw_sprite_ext(spr_neuron, 1, xx, yy, scale, scale, 0, color, 1);
			yy += yspacing;
		}
	}
}