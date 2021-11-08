function UpdateParallax()
{
		yDiff = (oEarthBG.y-yMiddle)/750
		xDiff = (oEarthBG.x-xMiddle)/1750
		
		p1.x = oEarthBG.x + p1Offx +p1FacX*xDiff
		p1.y = oEarthBG.y + p1Offy +p1FacY*yDiff
		
		p2.x = oEarthBG.x + p2Offx +p2FacX*xDiff
		p2.y = oEarthBG.y +p2Offy +p2FacY*yDiff
		
		p3.x = oEarthBG.x + p3Offx +p3FacX*xDiff
		p3.y = oEarthBG.y + p3Offy +p3FacY*yDiff
		
		p4.x = oEarthBG.x + p4Offx +p4FacX*xDiff
		p4.y = oEarthBG.y + p4Offy +p4FacY*yDiff
}

UpdateParallax()

clouds.x = x - clouds.moved
clouds.y = y