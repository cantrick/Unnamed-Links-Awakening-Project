shake = argument0;

if(shake == true) {
    __angle=random_range(-0.5,0.5)
    camera_set_view_angle(view_camera[0],__angle);
} else if (shake == false) {
    camera_set_view_angle(view_camera[0],0);
}
