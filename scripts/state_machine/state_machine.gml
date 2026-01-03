function state_machine(move, on_ground){
	switch (state)
	{
	  case PlayerState.IDLE:
	    if (!on_ground) 
			{
				state = PlayerState.FALL;
	    } 
			else if (move != 0) 
			{
	      state = PlayerState.RUN;
	    } 
			else if (key_up) 
			{
	      vertical_speed = -jumpheight;
	      state = PlayerState.JUMP;
	    }
	  break;

	  case PlayerState.RUN:
	    if (!on_ground) 
			{
				state = PlayerState.FALL;
	    } 
			else if (move == 0) 
			{
				state = PlayerState.IDLE;
	    } 
			else if (key_up) 
			{
	      vertical_speed = -jumpheight;
	      state = PlayerState.JUMP;
	    }
	  break;

	  case PlayerState.JUMP:
	    if (vertical_speed > 0)
			{
				state = PlayerState.FALL;
	    }
	  break;

	  case PlayerState.FALL:
	    if (on_ground) 
			{
	      state = (move != 0) ? PlayerState.RUN : PlayerState.IDLE;
	    }
	  break;
	}
}