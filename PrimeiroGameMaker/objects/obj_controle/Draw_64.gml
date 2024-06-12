/// @description Inserir descrição aqui
draw_set_font(fnt_basica);
var _c = make_color_rgb(131, 68, 87);
var _largura = window_get_width();
var _altura = window_get_height();

if room == rm_menu{
	if alpha <= 0{
		alpha_add = 0.05;
	} else if alpha >= 1{
		alpha_add -= 0.05
	}
	alpha += alpha_add;

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_ext_color(_largura/2, _altura/3, "Ganhe mil pontos destruindo asteróides para vencer!", 30, 500, c_white, c_white, c_white, c_white, 1);
	draw_text_color(_largura/2, _altura - _altura/3, "Aperte espaço para começar", _c, _c, _c, _c, alpha);
	
	if keyboard_check_pressed(vk_space){
		room_goto(rm_jogo);
	}
}else if room == rm_jogo {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// draw_text_color(20, 40, "Vidas: " + string(obj_nave.vida), _c, _c, _c, _c, 1);
	// draw_text_color(20, 20, "Pontuação: " + string(global.pont), c_white, c_white, c_white, c_white, 1);
	

	
}else if room == rm_final {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext_color(_largura/2, _altura/2, "Parabéns! Você consegui 1.000 pontos. Aperte 'R' para reiniciar", 80, 900, _c, _c, _c, _c, 1);
	
	if keyboard_check_pressed(ord("R")){
		game_restart();
	}
}