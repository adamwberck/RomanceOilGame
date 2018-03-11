/// @description Camera
// You can write your code in this editor

// Camera /////////////////////////////////////////////////////////////////////

//application_surface_draw_enable(false);

WIDTH = 448;
HEIGHT = 208;
window_set_min_width(WIDTH);
window_set_min_height(HEIGHT);
//GUI_HEIGHT =128;
view_enabled = true;
view_visible[0] = true;
view_set_wport(0,WIDTH*1);
view_set_hport(0,(HEIGHT*1));
window_set_size(view_wport[0],view_hport[0]);


//window_center();