
/// @description Gameplay
// Você pode escrever seu código neste editor

if keyboard_check(vk_up){
	sprite_index = spr_nave_movendo;
	speed = veloc; 	
}else if keyboard_check(vk_down){
	sprite_index = spr_nave_movendo;
	speed = -veloc; 	
}else {
	sprite_index = spr_nave_parada;
	speed = lerp(speed, 0, 0.07);
}

if keyboard_check(vk_left){
	direc = 3; 	
}else if keyboard_check(vk_right){
	direc = -3; 	
}else {
	direc = lerp(direc, 0, 0.08);
}


direction += direc;
image_angle = direction;

// if (speed == 0) {
// 	fitness -= 20;
//}

if (distance_to_object(obj_parente_asteroide) < range)
{
	var distance_to_asteroid = max(0, range / 8 - distance_to_object(obj_parente_asteroide));
	
	if (distance_to_asteroid < 0) {
	    distance_to_asteroid = 0;
	}
	fitness -= distance_to_asteroid / 4;
}

move_wrap(true, true, 0);

if alarm[0] > 0{
	if image_alpha <= 0{
		alfa_add = 0.05;
	}else if image_alpha >= 1{
		alfa_add = -0.05;
	}	
	image_alpha += alfa_add;
}else {
	image_alpha = 1;
}

if vida <= 0 {
	global.bestFitness = fitness > global.bestFitness ? fitness : global.bestFitness;
	instance_deactivate_object(self);
}

// if global.pont >= 1000{
// 	room_goto(rm_final);
//}

// NEURAL NETWORK
fire_rate--
var input = nn.first.output;
var index = 0;


// if (instance_exists(target) && target != noone && target.target == false) {
// 	if (target.vida <= 0) {
// 		fitness	+= 150;
// 	} else {
// 		target.target =  true;
// 	}
// } else {
// 	target = instance_find(obj_asteroide_grande, irandom(instance_number(obj_asteroide_grande) - 1));
// }

// input[0] = target != noone ? Ray(x, y, direction, room_width, target) : 1;

// Cria um "raio" para detectar os asteroides a sua volta.
// Ângulos 0, 30, 65, 90, 120, 150, 180, 210, 240, 270, 300, 330



for (var i=0;i<inputAsteroids;i++) {
	var dir = 360 * i/inputAsteroids;
	input[@index++] = Ray(x, y, dir, range, obj_parente_asteroide);
}

// Cria um "raio" para detectar os power ups de escudo a sua volta.
for (var i=0;i<inputPowerUp;i++) {
	var dir = 360 * i/inputPowerUp;
	input[@index++] = Ray(x, y, dir, range, obj_parente_melhoria);
}

// Cria um "raio" para detectar os power ups de dano a sua volta.
// for (var i=0;i<inputDamagePowerUp;i++) {
// 	var dir = direction + (360 * i/inputDamagePowerUp);
// 	input[@index++] = Ray(x, y, dir, range, obj_melhoria_projetil);
// }

// Realiza o pensamento e prevê o que deve ser feito
nn.Forward();
// show_debug_message(input);
var output = nn.last.output;
// show_debug_message(output);

var activated_neuron = 0
var temp_neuron = 0;

// for(var i =0; i<array_length(output); i++) {
// 	temp_neuron = output[i];
//     if temp_neuron > output[activated_neuron] {
//         activated_neuron = i;
//     }
// }


// if (activated_neuron == 0) {
if (output[0] > 0.6) {
	if(fire_rate <= 0) {
		audio_play_sound(snd_projetil, 1, false);
		var _inst = instance_create_layer(x, y, "Instances", obj_nave_projetil);
		_inst.speed = 10.5;
		_inst.direction = direction;
		_inst.image_angle = direction
		_inst.visible = visible;
		_inst.dano = dano_nave;
		_inst.parent = self;

		fire_rate = 30;
	}
}

// if (activated_neuron == 1) {
if (output[1] > 0.6) {
	sprite_index = spr_nave_movendo;
	speed = veloc; 	
}

// if (activated_neuron == 2) {
if (output[2] > 0.6) {
	speed = -veloc; 	
}


// if (activated_neuron == 3) {
if (output[3] > 0.6) {
	direc = 3; 	
}

// if (activated_neuron == 4) {
if (output[4] > 0.6) {
	direc = -3; 	
}