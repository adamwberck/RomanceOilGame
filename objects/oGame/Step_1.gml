/// @description Camera Follow
// You can write your code in this editor



if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

camX += (xTo-camX) / 25;
camY += (yTo-camY) / 25;

camera_set_view_pos(view_camera[0],camX-view_w_half,camY-view_h_half); 