
//Generate initial room
global.gridOfRooms = ds_grid_create(1,1);
temp = "";

for(k=0; k<1; k++) {
	for(l=0; l<1; l++) {
		temp = CreateMainPath();
		
		ds_grid_add(global.gridOfRooms,k,l,temp);
	}
}


