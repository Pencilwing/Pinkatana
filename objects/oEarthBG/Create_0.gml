xMiddle = room_width/2
yMiddle = room_height/2-730
xDiff = 0
yDiff = 0
layerDepth = layer_get_depth("Parallax")

clouds =instance_create_depth(x,y,layerDepth -1,oCloudline)

p1 = instance_create_depth(x,y,layerDepth -4,oParallax01)
p1Offx = +0
p1Offy = -40
p1FacY = -210
p1FacX = 30
p2 = instance_create_depth(x,y,layerDepth -3,oParallax02)
p2Offx = +0
p2Offy = -50
p2FacY = -160
p2FacX = 20
p3 = instance_create_depth(x,y,layerDepth -2,oParallax03)
p3Offx = +0
p3Offy = -50
p3FacY = -120
p3FacX = 10
p4 = instance_create_depth(x,y,layerDepth -5,oParallax04)
p4Offx = +0
p4Offy = 0
p4FacY = -250
p4FacX = 40

