randomize();

enum states {
	normal,
	moving,
	attack,
}

enum enemy_states {
	idle,
	wander,
	alert,
	attack
}

roomGeneration();
//initialize the starting room, 1,1
InitializeRoom(ds_grid_get(global.gridOfRooms,1,1));