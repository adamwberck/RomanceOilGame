//@description Init vars

//display_set_gui_size(view_wview[0],view_hview[0]);
enum Powers{
	none,
	glide,
	farore,
	wallJump,
}




hp = 1;
maxhp = 3;
coins = 0;

powerUp = Powers.none;

powerSprites=ds_map_create()
ds_map_add(powerSprites,Powers.none,sWhiteRun);
ds_map_add(powerSprites,Powers.glide,sGreenRun);
ds_map_add(powerSprites,Powers.farore,sPurpleRun);
ds_map_add(powerSprites,Powers.wallJump,sGwhiteRun);