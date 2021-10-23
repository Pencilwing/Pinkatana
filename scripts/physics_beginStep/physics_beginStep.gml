function physics_beginStep() {
	
	onGround = check_below();

	if(!onGround){
		
	    ySpeed += gSpeed * oAtuin.playSpeed;
	}
}
