rmPrev = rm;
rm     = room;

xcamo = 0;
ycamo = 0;

WIDTH = 448;
HEIGHT = 208;
view_camera[0] = camera_create_view(0,HEIGHT,WIDTH,HEIGHT,0,0,12,6,304,20);
surface_resize(application_surface, WIDTH, HEIGHT);