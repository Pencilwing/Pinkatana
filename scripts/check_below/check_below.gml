function check_below() {
	/*
	Returns true if the object is standing on solid ground 
	(including jump-thru platforms), false otherwise.

	An object is on solid ground if:
	 1. there is an parentBlocker directly below it
	  OR
	 2. a. there is an parentJumpthru directly below it
	  AND
	    b. there is not an parentJumpthru inside it
	  AND
		c. object isn't moving upwards
	*/
	if(place_meeting(x, y+1, oBlocker))
	{
		var blocker = instance_place(x,y+1,oBlocker)
		
		if(blocker.passThruY == 2)
		{
			return false
		}
	}

	
	return place_meeting(x, y+1, oBlocker) || (place_meeting( x, y+1, oPassThru) 
											  && !place_meeting( x, y, oPassThru) 
											  && sign(ySpeed) != -1);
	 
}
