rmPrev = rm;
rm     = room;

xcamo = 0;
ycamo = 0;

WIDTH = 448;
HEIGHT = 208;
view_camera[0] = camera_create_view(0,HEIGHT,WIDTH,HEIGHT,0,0,0,0,0,0);
surface_resize(application_surface, WIDTH, HEIGHT);


follow = oPlayer;
view_w_half = camera_get_view_width(view_camera[0])*.5;
view_h_half = camera_get_view_height(view_camera[0])*.5;
xTo = xstart;
yTo = ystart;
camX = 0;
camY = 0;