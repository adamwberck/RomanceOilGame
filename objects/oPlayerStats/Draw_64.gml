/// @description Draw the stats

draw_set_color(c_black);
draw_set_font(Cooper);
draw_text(30,20,string_hash_to_newline(hp));
draw_text(30,40,string_hash_to_newline(coins));
//draw_text(30,60,string_hash_to_newline(oPlayer.x-(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])) ));
draw_text(30,60,string_hash_to_newline(oPlayer.x-camera_get_view_x(view_camera[0])));
draw_set_color(c_white);

var guiH = display_get_gui_height();
var guiW = display_get_gui_width();

/*
if(powerUp=Powers.farore){
	var black =0;
	var purple =8388736;
	draw_healthbar(50,20,60,70,oPlayer.faroreCount*5,0,purple,purple,3,true,true);
}*/

//Draw GUI Area


draw_set_color(c_dkgray);
//draw_roundrect(0,guiH-oGame.GUI_HEIGHT,guiW,guiH-16,false);
draw_set_color(c_white);

if(instance_exists(oPlayer)){
    //draw_text(30,80,string_hash_to_newline(oPlayer.sprint));
	draw_set_color(c_black);
    draw_text(70,80,string_hash_to_newline("Speed:" + string(abs(oPlayer.vx))));
	draw_set_color(c_white);
	draw_healthbar(20,40,guiW-20,60,oPlayer.sprint/.07,c_black,c_green,c_green,0,false,true);
}
if(oGame.oldSchool){
	draw_sprite(sHappyCoin,0,50,50);
}

//var bcolor = make_colour_rgb(coins*4+40,coins*4+40,40);

//background_color[0]=bcolor;

