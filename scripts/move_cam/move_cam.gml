// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function move_cam(){
	var cam = view_camera[0];

	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);

	// Centrar la cámara en el jugador
	var target_x = x - cam_w / 2;
	var target_y = y - cam_h / 2;

	// Mover la cámara hacia el jugador
	camera_set_view_pos(cam, target_x, target_y);
}