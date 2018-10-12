i = argument0;
j = argument1;
rGrid = argument2;
dir = argument3;

if(dir == 0) {
	if(ds_grid_get(rGrid,i+1,j) != "S" and ds_grid_get(rGrid,i+1,j) != "-" ) {
		dir = 0;
	} else {
		dir = choose(1,2,3);
	}
} else if(dir == 1) {
	if(ds_grid_get(rGrid,i-1,j) != "S" and ds_grid_get(rGrid,i-1,j) != "-" ) {
		dir = 1;
	} else {
		dir = choose(0,2,3);
	}	
} else if(dir == 2) {
	if(ds_grid_get(rGrid,i,j-1) != "S" and ds_grid_get(rGrid,i,j-1) != "-" ) {
		dir = 2;
	} else {
		dir = choose(0,1,3);
	}
} else if(dir == 3) {
	if(ds_grid_get(rGrid,i,j+1) != "S" and ds_grid_get(rGrid,i,j+1) != "-" ) {
		dir = 3;
	} else {
		dir = choose(0,1,2);
	}
}

return dir;

/*

if(found) {
	return(dir);	
}

//check all directions for obstacle and change dir accordingly

//if current tile is greater than left boundary and the tile to the left is not taken
//if tile is taken, go a different direction;

if(dir == 0) {
	if((i+1 <= 10) and (ds_grid_get(rGrid,i+1,j) == 0)) { //check right
		found = true;
		return(0);
	} else {
		dir = choose(1,2,3);
		dir = checkPathforObstacle(i,j,rGrid,dir,found);
	}
} else if(dir == 1) {
	if((i > 0) and (ds_grid_get(rGrid,i-1,j) == 0)) { //check left
		found = true;
		return(1);
	} else {
		dir = choose(0,2,3);
		dir = checkPathforObstacle(i,j,rGrid,dir,found);
	}
} else if(dir == 2) {
	if((j > 0) and (ds_grid_get(rGrid,i,j-1) == 0)) { //check Top
		found = true;
		return(2);
	} else {
		dir = choose(0,1,3);
		dir = checkPathforObstacle(i,j,rGrid,dir,found);
	}
} else if(dir == 3) {
	if((j+1 <= 8) and (ds_grid_get(rGrid,i,j+1) == 0)) { //check Bottom
		found = true;
		return(3);
	} else {
		dir = choose(0,1,2);
		dir = checkPathforObstacle(i,j,rGrid,dir,found);
	}
}


//return dir;

/*