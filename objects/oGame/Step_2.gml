/// @description  Check Player

if (instance_number(oPlayer) > 1) {
    with(instance_nearest(0,0,oPlayer))
        instance_destroy();
    }

if (instance_number(oPlayer) < 1) {
    instance_create(304,224,oPlayer)
}

/// Camera Follow
// You can write your code in this editor

var oldX = camX;
var oldY = camY;

var follow = oPlayer;
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//camX += (xTo-camX) / 25;
//camY += (yTo-camY) / 25;


//camX =xTo;
//camY =yTo-HEIGHT+40;
var camL = camera_get_view_x(view_camera[0]);
var camR = camL+WIDTH;
var pushDis = 176
if(xTo+pushDis>camR){
	camX =xTo+pushDis-WIDTH;
}
if(xTo-pushDis<camL){
	camX =xTo-pushDis
}
pushDis = 50
var camT = camera_get_view_y(view_camera[0]);
var camB = camT+HEIGHT;
if(yTo+100>camB){
	camY =yTo+100-HEIGHT;
}
if(yTo-20<camT){
	camY =yTo-20
}


camX = clamp(camX,0,room_width-WIDTH)
camY = clamp(camY,0,room_height-HEIGHT)

camera_set_view_pos(view_camera[0],camX,camY); 