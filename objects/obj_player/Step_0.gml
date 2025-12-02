keyright = keyboard_check(vk_right);
keyleft = keyboard_check(vk_left);
keyup = keyboard_check_pressed(vk_up);

var _move = keyright - keyleft;

horizontal_speed = walkspeed * _move;

vertical_speed += player_gravity;

if(place_meeting(x,y+vertical_speed, obj_ground)){
	vertical_speed = 0;
	if(keyup) vertical_speed -= jumpheight;
}

move_and_collide(horizontal_speed, 0, obj_ground);
y += vertical_speed;

if(keyright){
	image_xscale = 1;
}else if(keyleft){
	image_xscale = -1;
}

if(keyleft or keyright){
	sprite_index = spr_player_run;
}else{
	sprite_index = spr_player_idle;
}