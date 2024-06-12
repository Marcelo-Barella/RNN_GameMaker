/// @desc Genetic Algorithm


if (instance_number(specimens) == 0) {
	neural_genetic_selection(population);
	neural_genetic_crossover(population, .3);
	neural_genetic_mutate(population, .3, 1, .2, .1);
	generation++;
	best = global.bestFitness;
	time = 0;
	
	instance_destroy(big_asteroids);
	instance_destroy(medium_asteroids)
	instance_destroy(small_asteroids);
	instance_activate_object(specimens);
	with (specimens) {
		Restart();
	}
}

if (keyboard_check_pressed(vk_f3)) {
    with (specimens) {
        visible = false;
    }
    var rand_specimen = instance_find(obj_nave, irandom(instance_number(obj_nave) - 1));
    rand_specimen.visible = true;
}

if (keyboard_check_released(vk_f3)) {
	specimens.visible = true
}
