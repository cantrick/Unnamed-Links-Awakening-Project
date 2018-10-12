//resize global grid based on movement (0-right, etc)
//only gets called when out of grid bounds
var resizeDir = argument0;
var roomX = argument1;
var roomY = argument2;

if(resizeDir == 0) {
	ds_grid_resize(global.gridOfRooms,ds_grid_width(global.gridOfRooms)+1,ds_grid_height(global.gridOfRooms));
	ds_grid_add(global.gridOfRooms,roomX+1,roomY,CreateMainPath());
} else if(resizeDir == 1) {
	ds_grid_resize(global.gridOfRooms,ds_grid_width(global.gridOfRooms)-1,ds_grid_height(global.gridOfRooms));
	ds_grid_add(global.gridOfRooms,roomX-1,roomY,CreateMainPath());
} else if(resizeDir == 2) {
	ds_grid_resize(global.gridOfRooms,ds_grid_width(global.gridOfRooms),ds_grid_height(global.gridOfRooms)-1);
	ds_grid_add(global.gridOfRooms,roomX,roomY-1,CreateMainPath());
} else {
	ds_grid_resize(global.gridOfRooms,ds_grid_width(global.gridOfRooms),ds_grid_height(global.gridOfRooms)+1);
	ds_grid_add(global.gridOfRooms,roomX,roomY+1,CreateMainPath());
}


