/*

	Definição de todas as funções de ativação usadas na rede neural.
	Todas as funções de ativação são guardadas em um array global, e acessadas via index / identificador enum
	
	
*/

// Lista de todas as funções de ativação disponíveis:

enum ActFunc {
	IDENTITY, // Função Pass-through (Função padrão)
	TANH,
	SIGMOID,
	RELU
}

#macro ACTIVATION_FUNC global.gACTIVATION_FUNCTION_ARRAY
#macro DERIVATIVE_FUNC global.gDERIVATIVE_FUNCTION_ARRAY

ACTIVATION_FUNC = [];							DERIVATIVE_FUNC = [];
ACTIVATION_FUNC[ActFunc.IDENTITY] = Identity;	DERIVATIVE_FUNC[ActFunc.IDENTITY] = IdentityDerivative;
ACTIVATION_FUNC[ActFunc.TANH] = Tanh;			DERIVATIVE_FUNC[ActFunc.TANH] = TanhDerivative;
ACTIVATION_FUNC[ActFunc.SIGMOID] = Sigmoid;		DERIVATIVE_FUNC[ActFunc.SIGMOID] = SigmoidDerivative;
ACTIVATION_FUNC[ActFunc.RELU] = Relu;			DERIVATIVE_FUNC[ActFunc.RELU] = ReluDerivative;
	
// IDENTITY

/// @func	Identity(input);
/// @desc	Função pass-through, Não modifica o input de nenhuma forma.
/// @param	{real}	input
function Identity (input) {
	return input;
}

/// @func	IdentityDerivative(input);
/// @desc	Função pass-through, Não modifica o input de nenhuma forma.
/// @param	{real}	input
function IdentityDerivative (input) {
	return 1;
}



// TANH

/// @func	Tanh(input);
/// @desc	Função de ativação não linear. Cria uma curva em forma de S. Retorno é sempre entre -1 e +1.
/// @param	{real}	input
function Tanh(input) {
	return ((2 / (1 + exp(-2 * input))) - 1);
}
/// @func	TanhDerivative(input);
/// @desc	Função de ativação não linear. Cria uma curva em forma de S. Retorno é sempre entre -1 e +1.
/// @param	{real}	input
function TanhDerivative(input) {
	return (1 - sqr(Tanh(input)));
}


// SIGMOID

/// @func	Sigmoid(input);
/// @desc	Função de ativação não linear. Cria uma curva em forma de S similar a Tanh. Retorno é sempre entre 0 e +1.
/// @param	{real}	input
function Sigmoid(input) {
	return (1 / (1 + exp(-input)));
}
/// @func	SigmoidDerivativeinput);
/// @desc	Função de ativação não linear. Cria uma curva em forma de S similar a Tanh. Retorno é sempre entre 0 e +1.
/// @param	{real}	input
function SigmoidDerivative(input) {
	input = Sigmoid(input);
	return (input * (1 - input));
}


// RELU

/// @func	Relu(input);
/// @desc	Unidade linear retificada. Função de ativação não linear. Retorno não é balanceado como Sigmoid ou Tanh
/// @param	{real}	input
function Relu (input) {
	return max(0, input);
}
/// @func	ReluDerivative(input);
/// @desc	Unidade linear retificada. Função de ativação não linear. Retorno não é balanceado como Sigmoid ou Tanh
/// @param	{real}	input
function ReluDerivative (input) {
	return (input > 0);
}