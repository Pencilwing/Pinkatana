function samurai_create(){
	//inherit code from physics
	event_inherited();
	
	state = states.idle
	
	slashes = 0;
	slashForce = 7;
	
	slashInverted = oAtuin.slashInverted;
	
	sfxMaterial = 0;
	
	walkSpeed = 6;
	
	facing = 1;
	xBounce = 1;
	yBounce = 1;
	bounceFactor = 1;
	tAttack = 0;
	
	yB=0;
	xB=0;
	
	retrieveInputMapping();
	
	
	
	instance_create_layer(x,y,"Instances",oCam)
	instance_create_layer(x,y,"Instances",oShadow)

}