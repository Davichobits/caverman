function change_animations(){
	switch (state)
	{
	  case PlayerState.IDLE:
	    sprite_index = spr_idle;
	    image_speed = 1;
	  break;

	  case PlayerState.RUN:
	    sprite_index = spr_run;
	    image_speed = 1;
	  break;

	  case PlayerState.JUMP:
	    sprite_index = spr_jump;
	    image_speed = 1;
	    // empieza desde cero
	    image_index = 0;
	  break;

	  case PlayerState.FALL:
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
}