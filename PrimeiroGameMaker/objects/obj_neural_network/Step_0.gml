// REDE NEURAL

var input = [];
input[0] = mouse_x/room_width;
input[1] = mouse_y/room_height;


//	Input pode ser aplicado sepradamente
nn.Input(input);
nn.Forward();
//Chamar o Forward() faz predições

//result = nn.Forward();
//	Ou junto ao forward
// nn.Forward(input);

//	Ou as atividades do neurônios podem ser modificadas diretamente.
// nn.first.output[@0] = mouse_x/room_width;
// nn.first.output[@1] = mouse_y/room_height;
// nn.Forward()



// Ou depois acessar o valor da última camada de neurônios ativas
// result = nn.last.output;