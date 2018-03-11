/// @description  Check Player

if (instance_number(oPlayer) > 1) {
    with(instance_nearest(0,0,oPlayer))
        instance_destroy();
    }

if (instance_number(oPlayer) < 1) {
    instance_create(304,224,oPlayer)
}