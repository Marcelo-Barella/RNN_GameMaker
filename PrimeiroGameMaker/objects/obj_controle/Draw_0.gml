/// @desc	

time++;

var xx = 20;
var yy = 20;
var i = 1;
draw_text(xx, yy * i++, "Geracao: " + string(generation));
draw_text(xx, yy * i++, "Vivos: " + string(instance_number(specimens)));
draw_text(xx, yy * i++, "Tempo: " + string(time));
draw_text(xx, yy * i++, "Melhor: " + string(global.bestFitness));
