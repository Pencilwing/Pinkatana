// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function samurai_endStep(){
	
	//inherit code from physics
	event_inherited();
	

	
	if(oAtuin.controlScheme == 0)
	{
		slashB = mb_left
		directionX = mouse_x
		directionY = mouse_y
	}else{
		slashB = gp_face1
		directionX = gamepad_axis_value( oAtuin.currentGamepad, gp_axislh)+x
		directionY = gamepad_axis_value( oAtuin.currentGamepad, gp_axislv)+y
	}
	
	
	//inertia and deceleration
	if((abs(xSpeed)+abs(ySpeed)) <= 5)
	{
		state = states.idle
	}
	
	if(onGround)
	{
		if(abs(xSpeed) > 1) 
		{
			if(instance_exists(instance_place(x,y+1,oBlocker)))
			{
			xSpeed = lerp(xSpeed,0,0.1*(instance_place(x,y+1,oBlocker).frictionFactor));
			}
		}
		else{ xSpeed = 0;}
	}
	
	//flower power up
	flowerPowerUpCheck()
	
	//attack
	if (slashPress() && (onGround || slashes > 0) && oAtuin.controlsEnabled)
	{
		if (slashes > 0) slashes --
		xAttack = x
		yAttack = y
		tAttack = 20
		xMouse = directionX
		yMouse = directionY
		state = states.attack
		slashVFX = instance_create_layer(x,y,"VFX",oSlash);
		slashVFX.owner = self;
		slashVFX.image_angle = point_direction(x,y,directionX,directionY);
		attackBounce()
		state = states.bounce
		sprite_index = spr_samurai_roll
		vec = vector_calc(slashForce, point_direction(xAttack,yAttack,xMouse,yMouse)+90);
		xSpeed = vec[0]*xBounce;
		ySpeed = vec[1]*yBounce;
		xBounce = 1;
		yBounce = 1;
		bounceFactor = 1;
	}
	
	if(tAttack > 0)
	{
		tAttack--
		if(tAttack % 2 != 0 )instance_create_layer(x,y,"VFX",oPetalVFX);
	}
	
}



function attackBounce()
{
	 var vector = vector_calc(slashForce*bounceFactor, point_direction(xAttack,yAttack,xMouse,yMouse)+90);
	 xSpeed = vector[0];
	 ySpeed = vector[1];
	
	///Magic Code actually now yes pls
	for(i=0;i<10;i++)
	{
		///All of this is my regular movement code, the idea is to repeat this in a for loop and simulate all the movement in one frame
			var h, v;
			hCounter += (xSpeed+xPushSpeed)*oAtuin.playSpeed;
			vCounter += ySpeed*oAtuin.playSpeed;
			h = round(hCounter);
			v = round(vCounter);
			hCounter -= h;
			vCounter -= v;

			//handle vertical movement, repeat for every pixel of movement to be made this step
			repeat(abs(v))
			{		
					//flower powerUp
					flowerPowerUpCheck()
					
					//call collision if it happens
			        if(place_meeting(x,y+sign(v),oBlocker)){
						if(instance_position(x,y+sign(v)*16,oBlocker) != noone)
						{
							var blocker_id = instance_position(x, y+sign(v)*16, oBlocker);
						}else{
							var blocker_id = instance_place(x, y+sign(v), oBlocker);	
						}
			            if(blocker_id.passThruY == 2)
						{
							y += sign(v)
						}else{
							if(blocker_id.passThruY != sign(xSpeed) || blocker_id.passThruY = 0)
							{
								yBounce = yBounce*-1*blocker_id.bounceFactor
								xBounce = xBounce*blocker_id.bounceFactor
								v = v*-1
								y += sign(v)
								ySpeed = ySpeed *-1*blocker_id.bounceFactor;
								xSpeed = xSpeed *blocker_id.bounceFactor;
						
								///Spawn Collision VFX on point B
								mouseYflip = directionY+ 2*(y-directionY)
								dustVFX = instance_create_layer(x,y,"VFX",oBounceDust)
								dustVFX.image_angle = point_direction(x,y,directionX,mouseYflip)-90;
							}else{
								y += sign(v)
							}
						}
			        }else{
					//if collision doesn't happen, move character a pixel
			            y += sign(v)
			        }
			}

			//handle horizontal movement, repeat for every pixel of movement to be made this step
			repeat(abs(h)) {
				//flower powerUp
				flowerPowerUpCheck()
				
				//call collision if it happens
			    if(place_meeting(x+sign(h),y,oBlocker)){
						if(instance_position(x+sign(h)*16,y,oBlocker) != noone)
						{
							var blocker_id = instance_position(x+sign(h)*16, y, oBlocker);
						}else{
							var blocker_id = instance_place(x+sign(h), y, oBlocker);	
						}
						if(blocker_id.passThruX == 2)
						{
							x += sign(h)
						}else{
							if(blocker_id.passThruX != sign(xSpeed) || blocker_id.passThruX = 0)
							{
								xBounce = xBounce*-1*blocker_id.bounceFactor
								yBounce = yBounce*blocker_id.bounceFactor
								h = h*-1
								x += sign(h)
								xSpeed = xSpeed *-1*blocker_id.bounceFactor;
								ySpeed = ySpeed *blocker_id.bounceFactor;
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
				/*
				while(place_meeting(x,y,oBlocker))
				{
					var _blocker = instance_place(x,y,oBlocker);
					x += sign(x-_blocker.x);
				}
				*/
		
		var petal = instance_create_layer(x,y,"VFX",oPetalVFX);
			petal.image_index = 10-i
		}
}

function slashPress()
{
	if (oAtuin.controlScheme = 0)
	{
		return mouse_check_button_pressed(slashB)
	}else{
		return gamepad_button_check_pressed(oAtuin.currentGamepad,slashB)
	}
	
	
}

function flowerPowerUpCheck()
{
	//flower powerUp
	if(place_meeting(x,y,oFlowerPowerUp) && slashes == 0)
	{
		var flower_id = instance_place(x, y, oFlowerPowerUp);
		if(flower_id.state = "open")
		{
		flower_id.state = "closed"
		flower_id.image_yscale = 0.1
		slashes = 1
		}
	}
}

	/*Magic Fuckin code that I'll make work in the morning when my neurons return to me
	
	initialVector = vector_calc(100, point_direction(x,y,mouse_x,mouse_y)+90);
	vectorDirection = point_direction(x,y,mouse_x,mouse_y);
	xF = initialVector[0]
	yF = initialVector[1]
	
	//Check if initial trajectory collides w any blocker
	if (collision_line(x,y,x+xF,y+yF,oBlocker,true,true))
	{
		
	//If it does, calculate point B
		
		var vCol = false;
	
		angA = 0;
		angB = 0; 
		angC = 0;
		xA = x
		yA = y
		xB = 0;
		yB = 0;
		xC = 0;
		yC = 0;
		
		//normalize angle C
		angC = vectorDirection
		
		while(angC > 90)
		{
			angC = angC-90
		}
		
		//go pixel by pixel checking where the collision is, first vertically (defines yC)
		repeat(abs(yF))
		{
			if(place_meeting(x,y+sign(yF),oBlocker))
			{
				var blocker_id = instance_place(x, y+sign(yF), oBlocker);
				bounceFactor = blocker_id.bounceFactor
				yF = yF*bounceFactor
				yC = y;
				xC = xA
				yB = yC
				angB = 90;
				angA = 0;
				var vCol = true;
				yF= yF*-1
				yBounce = yBounce*-1
				break;
			}else{
				 y += sign(yF)
			}
		}
		///...then horizontally (defines xC)
		if (!vCol) repeat(abs(xF))
		{
			if(place_meeting(x+sign(xF),y,oBlocker))
			{
				var blocker_id = instance_place(x+sign(xF), y, oBlocker);
				bounceFactor = blocker_id.bounceFactor
				xF = xF*bounceFactor
				xC = x;
				yC = yA
				xB = xC;
				angB = 0;
				angA = 90;
				xF = xF*-1
				xBounce = xBounce*-1
				break;
			}else{
				 x += sign(xF)
			}
		}
		
		//use correct angle NOT USELESS CODE HECK YEA
		
		if(vCol)
		{
			if(vectorDirection >= 270 && vectorDirection < 360 || vectorDirection >= 90 && vectorDirection < 180)
			{
				angC = abs(angC-90)
			}
		}else{
			if(vectorDirection >= 0 && vectorDirection < 90 || vectorDirection >= 180 && vectorDirection < 270)
			{
				angC = abs(angC-90)
			}
		}
		
		///Calculate point B using what you've found out till now
		///...and remove distance hyp from initial vector
		if (vCol)
		{
			var adj = max(yA,yC) - min(yA,yC);
			var hyp = adj/dcos(angC)
			var opp = sqrt(power(hyp,2)-power(adj,2))
			xB = x+xC + (opp*sign(x-mouse_x)) 
		}else{
			var adj = max(xA,xC) - min(xA,xC);
			var hyp = adj/dcos(angC)
			var opp = sqrt(power(hyp,2)-power(adj,2))
			yB = y+yC + (opp*sign(y-mouse_y))
		}
		
		/*draw_set_color(c_yellow)
		var line = instance_create_layer(x,y,"VFX",oDebugLine)
		line.x1 = xA
		line.y1 = yA
		line.x2 = xB
		line.y2 = yB
	
		draw_set_color(c_aqua)
		var line = instance_create_layer(x,y,"VFX",oDebugLine)
		line.x1 = xC
		line.y1 = yC
		line.x2 = xB
		line.y2 = yB
		
		draw_set_color(c_fuchsia)
		var line = instance_create_layer(x,y,"VFX",oDebugLine)
		line.x1 = xA
		line.y1 = yA
		line.x2 = xC
		line.y2 = yC
		
		xF = x+xF - xB;
		yF = y+yF - yB;
		
		x = xB
		y = yB
		

		
	///Spawn Collision VFX on point B
		mouseYflip = mouse_y+ 2*(y-mouse_y)
		dustVFX = instance_create_layer(xB,yB,"VFX",oBounceDust)
		dustVFX.image_angle = point_direction(x,y,mouse_x,mouseYflip)-90;

	
	}
	
	//Grab 10 points along the final trajectory and spawn petal fx
	for (var i = 0; i < 10; i ++)
	{
		xD = (xF/10)*i
		yD = (yF/10)*i
		
		for (var p = 0; p < 2; p++)
		{
			var petal = instance_create_layer(x+xD,y+yD,"VFX",oPetalVFX);
			petal.image_index = 10-i
		}
	}
	
	//Teleport player to final point
	
	x = x+xF
	y = y+yF
	
	//clipping check
	
	while(place_meeting(x,y+1,oBlocker))
			{
				y -= 1
			}
			
	while(place_meeting(x,y-1,oBlocker))
		{
			y += 1
		}
		
	while(place_meeting(x+1,y,oBlocker))
		{
			x -= 1
		}
	while(place_meeting(x-1,y,oBlocker))
		{
			x += 1
		}
	
 } */




	//Stupid fuckin code that kinda works but not really but I got to leave in bc i havent finished the good solution
	/*
		//normalize angle C
		
		angC = point_direction(x,y,mouse_x,mouse_y);
		
		while(angC > 90)
		{
			angC = angC-90
		}
		
		show_debug_message(angC)
	
	
	var h, v;
	hCounter += xSpeed*oAtuin.playSpeed;
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
				var blocker_id = instance_place(x, y+sign(v), oBlocker);
	            v = v*-1
				y += sign(v)
				mouseYflip = mouse_y+ 2*(y-mouse_y)
				yBounce = -1*oBlocker.bounceFactor
				ySpeed = ySpeed*oBlocker.bounceFactor*-1
				dustVFX = instance_create_layer(x,y,"VFX",oBounceDust)
				dustVFX.image_angle = point_direction(x,y,mouse_x,mouseYflip);
				attackBounce();
				break;
	        }else{
			//if collision doesn't happen, move character a pixel
	            y += sign(v)
	        }
		//if moving down and there is a blocker underneath, call collision
		//using check below to check for jump through platforms as solid ground, isntead of just blockers
	    }else if (check_below()){
	        	var blocker_id = instance_place(x, y+sign(v), oBlocker);
	            v = v*-1
				y += sign(v)
				mouseYflip = mouse_y+ 2*(y-mouse_y)
				yBounce = -1*oBlocker.bounceFactor
				ySpeed = ySpeed*oBlocker.bounceFactor*-1
				dustVFX = instance_create_layer(x,y,"VFX",oBounceDust)
				dustVFX.image_angle = point_direction(x,y,mouse_x,mouseYflip)-90;
				attackBounce();
				break;
	    }else{
			//if collision doesn't happen, move character a pixel
	        y += sign(v)
	    }
	}

	//handle horizontal movement, repeat for every pixel of movement to be made this step
	if(yBounce = 1)repeat(abs(h)) {
		//call collision if it happens
	    if(place_meeting(x+sign(h),y,oBlocker)){
			
	        h = h*-1
			x += sign(h)
			var blocker_id = instance_place(x, y+sign(v), oBlocker);
			xBounce = -1*oBlocker.bounceFactor
			xSpeed = xSpeed*oBlocker.bounceFactor*-1
			attackBounce();
			break;
		//if collision doesn't happen, move character a pixel
	    }else{
			x += sign(h)
	    }
		
	}
}