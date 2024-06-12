/// @desc	Save / Load

if (!keyboard_check(vk_control)) exit;

// STRINGIFY
if (keyboard_check_pressed(ord("C"))) {
	var specimen = population[0]; // Melhor.
	var json = neural_model_stringify(specimen.nn);
	clipboard_set_text(json);
	show_message("Salvo");
}

// Parse
if (keyboard_check_pressed(ord("V"))) {
	var json = clipboard_get_text();
	var network = neural_model_parse(json);
	
	if (is_undefined(network)) {
		show_message("Não foi possível carregar esta model!");
	} else {
		for (var i=0;i<count;i++) {
			neural_model_copy(population[i].nn, network);
		}
		show_message("Model carregada com sucesso!");
	}
	
	
}