vertical_speed += 0.1

if keyboard_check(vk_left){
	horizontal_speed = -1;
	image_xscale = -1;
	sprite_index = spr_player_run;
}

if keyboard_check(vk_right){
	horizontal_speed = 1;
	image_xscale = 1;
	sprite_index = spr_player_run;
}

if place_meeting(x,y+1,obj_ground){
	vertical_speed = 0;
	
	if keyboard_check(vk_space){
		vertical_speed -=2;
	}
	
}

move_and_collide(horizontal_speed, vertical_speed, obj_ground);