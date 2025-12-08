// --- INPUT ---
var keyright = keyboard_check(vk_right);
var keyleft  = keyboard_check(vk_left);
var keyup    = keyboard_check_pressed(vk_space);

var move = keyright - keyleft;


// --- MOVIMIENTO ---
horizontal_speed = move * walkspeed;
vertical_speed += player_gravity;

var check_offset = (vertical_speed >= 0) ? 1 : vertical_speed;
// MOVIMIENTO EN X
move_and_collide(horizontal_speed, 0, obj_platform);

// MOVIMIENTO EN Y
if (!place_meeting(x, y + vertical_speed, obj_platform)) {
    y += vertical_speed;
} else {
    // si chocamos hacia abajo
    if (vertical_speed > 0) {
        while (!place_meeting(x, y + 1, obj_platform)) y += 1;
        on_ground = true;
    }

    vertical_speed = 0;
}

var on_ground = place_meeting(x, y + check_offset, obj_platform);



// --- CAMBIO DE ESTADOS ---
switch (state)
{
    case "idle":
        if (!on_ground) {
            state = "fall";
        } else if (move != 0) {
            state = "run";
        } else if (keyup) {
            vertical_speed = -jumpheight;
            state = "jump";
        }
    break;


    case "run":
        if (!on_ground) {
            state = "fall";
        } else if (move == 0) {
            state = "idle";
        } else if (keyup) {
            vertical_speed = -jumpheight;
            state = "jump";
        }
    break;


    case "jump":
        if (vertical_speed > 0) {
            state = "fall";
        }
    break;


    case "fall":
        if (on_ground) {
            state = (move != 0) ? "run" : "idle";
        }
    break;
}




// --- DIRECCIÓN ---
if (keyright) image_xscale = 1;
if (keyleft)  image_xscale = -1;


// --- ANIMACIONES ---
switch (state)
{
    case "idle":
        sprite_index = spr_idle;
        image_speed = 1;
    break;

    case "run":
        sprite_index = spr_run;
        image_speed = 1;
    break;

    case "jump":
        sprite_index = spr_jump;
        image_speed = 1;
        // empieza desde cero
        image_index = 0;
    break;

    case "fall":
        sprite_index = spr_jump;

        // congelar en último frame
        if (image_index < sprite_get_number(spr_jump) - 1)
        {
            image_speed = 1; // deja que termine la animación de salto
        }
        else
        {
            image_speed = 0;
            image_index = sprite_get_number(sprite_index) - 1;
        }
    break;
}

//CAMARA

var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Centrar la cámara en el jugador
var target_x = x - cam_w / 2;
var target_y = y - cam_h / 2;

// Mover la cámara hacia el jugador
camera_set_view_pos(cam, target_x, target_y);
