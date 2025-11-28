if keyboard_check(vk_left){
	horizontal_speed = -1;
}

if keyboard_check(vk_right){
	horizontal_speed = 1;
}

move_and_collide(horizontal_speed, vertical_speed, obj_ground)