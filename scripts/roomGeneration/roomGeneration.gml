
//Generate 9 rooms in a 3x3 grid
global.gridOfRooms = ds_grid_create(3,3);
temp = "";

for(k=0; k<3; k++) {
	for(l=0; l<3; l++) {
		temp = CreateMainPath();
		
		ds_grid_add(global.gridOfRooms,k,l,temp);
		show_debug_message("RLSKJRSKRJSLKRJSKJRLRLKSJRLS");
	}
}


