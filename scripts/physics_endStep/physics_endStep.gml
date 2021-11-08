function physics_endStep() {

	/*
	HANDLE MOVEMENT
	This script handles all movement and collision of objects with blockers in regular gameplay.
	Blockers are objects that serve as walls. 

	***NOTE***
	This script should be extended to allow restriction of movement from a dynamic array of sources. That way different objects
	can act as blockers dynamically.
	EX: A normally friendly character does not want to let your character through anymore.

	FOR SUB PIXEL MOVEMENT
	hCounter saves rounded out values (0.3 from an initial 2.3) to be used next step.
	h stores the round value to be used for movement this step.
	EX: first step: xSpeed = 2.3 > character moves (h = 2) pixel, hCounter is now 0.3
		next step:  xSpeed = 2.8 > character moves 3 pixel (h = 2.8 + 0.3), hCounter is now 0.1 
	*/

	var h, v;
	xSpeed = min(xSpeed,xSpeedMax)
	ySpeed = min(ySpeed,ySpeedMax)
	hCounter += (xSpeed+xPushSpeed)*oAtuin.playSpeed;
	vCounter += ySpeed*oAtuin.playSpeed;
	h = round(hCounter);
	v = round(vCounter);
	hCounter -= h;
	vCounter -= v;

	//handle vertical movement, repeat for every pixel of movement to be made this step
	repeat(abs(v)){
		//if moving up, check for collision overhead
	    if(ySpeed <= 0){
			//call collision if it happens
	        if(place_meeting(x,y+sign(v),oBlocker)){
				var _blocker = instance_place(x,y+sign(v),oBlocker);
				if(_blocker.passThruY == 2)
				{
					y += sign(v)
				}else{
					if(_blocker.passThruY != sign(ySpeed))
					{
			            if(state = states.bounce)
						{
							v = v*-1
							y += sign(v)
							ySpeed = ySpeed *-1;
						}else{
							move_collide("y");
							break;
					}
					}else{
					y += sign(v)
					}
				}
	        }else{
			//if collision doesn't happen, move character a pixel
	            y += sign(v)
	        }
		//if moving down and there is a blocker underneath, call collision
		//using check below to check for jump through platforms as solid ground, isntead of just blockers
	    }else if (check_below()){
	        move_collide("y");
	        break;
	    }else{
			//if collision doesn't happen, move character a pixel
	        y += sign(v)
	    }
	}

	//handle horizontal movement, repeat for every pixel of movement to be made this step
	repeat(abs(h)) {
		//call collision if it happens
	    if(place_meeting(x+sign(h),y,oBlocker)){
			var _blocker = instance_place(x+sign(h),y,oBlocker);
			if(_blocker.passThruX == 2)
			{
				x += sign(h)
				
			}else{
				if(_blocker.passThruX != sign(xSpeed))
				{
					if(state = states.bounce)
					{
						h = h*-1
						x += sign(h)
						
						xSpeed = xSpeed *-1;
					}else{
						move_collide("x");
						break;
					}
				}else{
					x += sign(h)
					
				}
			}
		//if collision doesn't happen, move character a pixel
	    }else{
			x += sign(h)
			
	    }
	}

	//if, even after movement, the character is colliding with a blocker , move them in the opposite x
	//direction until they arent
	
	while(place_meeting(x,y,oBlocker))
	{
		var _blocker = instance_place(x,y,oBlocker);
		if(_blocker.passThruX == 0 && _blocker.passThruY == 0 )
		{
			x --
			y --
		}else{
			break;
		}
	}
}
