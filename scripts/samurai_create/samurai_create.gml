function samurai_create(){
	//inherit code from physics
	event_inherited();
	
	state = states.idle
	
	slashes = 0;
	slashForce = 7;
	
	facing = 1;
	xBounce = 1;
	yBounce = 1;
	bounceFactor = 1;
	tAttack = 0;
	
	yB=0;
	xB=0;
}