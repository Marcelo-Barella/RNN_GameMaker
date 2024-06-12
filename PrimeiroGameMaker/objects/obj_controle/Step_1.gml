/// @desc Limite de FPS


if (keyboard_check(vk_f1)) {
	room_speed = 60;
} else if (keyboard_check(vk_f4)) {
	room_speed = 5;
} else {
	room_speed = 9999;
}