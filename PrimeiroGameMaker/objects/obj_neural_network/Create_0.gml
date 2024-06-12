/// @desc Criação da base de estrutura da rede neural
nn = new neural_network();
nn.add.Input(2);
nn.add.Dense(16, ActFunc.TANH);
nn.add.Dense(32, ActFunc.TANH);
nn.add.Dense(24, ActFunc.TANH);
nn.add.Dense(12, ActFunc.TANH);
nn.add.Dense(2, ActFunc.TANH);