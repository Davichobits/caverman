// Movimiento
walkspeed = 4;
jumpheight = 10;
player_gravity = 0.5;

horizontal_speed = 0;
vertical_speed = 0;

// Estados
state = "idle";
was_on_ground = true;

// Sprites
spr_idle  = spr_player_idle;
spr_run   = spr_player_run;
spr_jump  = spr_player_jump;
spr_fall  = spr_player_jump; // mismo sprite pero congelado en último frame
