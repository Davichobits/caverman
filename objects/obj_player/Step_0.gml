input_check();

var move = key_right - key_left;

// --- MOVIMIENTO ---
horizontal_speed = move * walkspeed;
vertical_speed += player_gravity;

var check_offset = (vertical_speed >= 0) ? 1 : vertical_speed;

// COLLISIONES
move_and_collide(horizontal_speed, 0, obj_platform);

var platform_collision = place_meeting(x, y + vertical_speed, obj_platform);

if (!platform_collision) 
{
	y += vertical_speed;
} 
else 
{
  // si chocamos hacia abajo
  if (vertical_speed > 0) {
    while (!place_meeting(x, y + 1, obj_platform)) y += 1;
    on_ground = true;
  }
  vertical_speed = 0;
}

var on_ground = place_meeting(x, y + check_offset, obj_platform);

// --- CAMBIO DE ESTADOS ---
state_machine(move, on_ground);

// --- DIRECCIÓN ---
if (key_right) image_xscale = 1;
if (key_left)  image_xscale = -1;


change_animations();

move_cam();