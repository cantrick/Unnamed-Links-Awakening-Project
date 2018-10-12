//Generate paths
//create ds_grid 
//start first path tile off ANY side
//choose direction to go after tile and put value into grid
//any grid value that isn't 'P' will be turned to '0'
//iterate through grid and return a string value of the level
//the grid is 10 tiles wide by 8 tiles tall
//X is columns, Y is rows (backwards?? I know deal w/ it tyvm)

//Room dimensions
rWidth = 10;
rHeight = 8;

//x and y placeholders
startX = 0;
startY = 0;

dir = 0;
shopChance = irandom(99);
hasShop = false;

//create 10x8 grid
roomGenGrid = ds_grid_create(rWidth,rHeight);

//choose side to start path on. 
//	0 - Right		gridY = 9(10)
//	1 - Left		gridY = 0
//	2 - Top			gridX = 0
//	3 - Bottom		gridX = 7(8)

#region Shop Gen
//put a shop in the map
if(shopChance <= 5) {
	startX = irandom(7);
	startY = irandom(5);
	//startX = 0;
	//startY = 0;
	
	/*gen shop if path in the way, unnecessary atm???
	//find a 3x3 grid space for the shop
	while(!hasShop) {
		startX = irandom(7);
		startY = irandom(5);
		

		
		show_debug_message("HELP");
		if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			if(ds_grid_get(roomGenGrid,startX+1,startY) != "P") {
				if(ds_grid_get(roomGenGrid,startX+2,startY) != "P") {
					if(ds_grid_get(roomGenGrid,startX,startY-1) != "P") {
						if(ds_grid_get(roomGenGrid,startX+1,startY-1) != "P") {
							if(ds_grid_get(roomGenGrid,startX+2,startY-1) != "P") {
								if(ds_grid_get(roomGenGrid,startX,startY-2) != "P") {
									if(ds_grid_get(roomGenGrid,startX+1,startY-2) != "P") {
										if(ds_grid_get(roomGenGrid,startX+2,startY-2) != "P") {
											hasShop = true;
											break;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		
		//startX += 1;

		
	}
	
	//add shop to grid, then take up the other 8 tiles with placeholder so no more gets generated there.
	//"S" goes in the top left of shop spot	
} */
	//if(hasShop) {
		ds_grid_add(roomGenGrid,startX,startY,"S");
		ds_grid_add(roomGenGrid,startX+1,startY,"-");
		ds_grid_add(roomGenGrid,startX+2,startY,"-");
		ds_grid_add(roomGenGrid,startX,startY+1,"-");
		ds_grid_add(roomGenGrid,startX+1,startY+1,"-");
		ds_grid_add(roomGenGrid,startX+2,startY+1,"-");
		ds_grid_add(roomGenGrid,startX,startY+2,"-");
		ds_grid_add(roomGenGrid,startX+1,startY+2,"-");
		ds_grid_add(roomGenGrid,startX+2,startY+2,"-");
		
		show_debug_message(string(startX) + " : " + string(startY));
	}

#endregion

//for future ref, dir is the direction which path is moving
//dir numbers use the same values as genSide. i.e. if(dir == 1) then path is moving left

genSide = choose(0,1,2,3);

// if starting on the right side, gridY = 9. We must find which tile on the right to start at
#region gen right
if(genSide == 0) {
	startY = irandom(5)+1;
	startX = 9;
	
	
	//add inital path tile
	if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			ds_grid_add(roomGenGrid,startX,startY,"P");
		}
	
	//generate rest of path
	while((startX >= 0) and (startY >= 0 and startY <= 7)) { //while we're in bounds of the grid
		//prioritize going in the same direction for longer
		if(dir == 1) {
			dir = choose(1,1,1,1,1,1,1,2,3);
		} else if(dir == 2) {
			dir = choose(1,2,2,3);
		} else if(dir == 3) {
			dir = choose(1,2,3,3);
		} else {
			dir = choose(1,2,3);
		}
		
		dir = checkPathforObstacle(startX,startY,roomGenGrid,dir);
		
		if(dir == 0) {
			startX += 1;
		} else if(dir == 1) {
			startX -= 1;
		} else if(dir == 2) {
			startY -= 1;
		} else if(dir == 3) {
			startY += 1;
		}
		
		

		if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			ds_grid_add(roomGenGrid,startX,startY,"P");
		}
		
	} 
	
} #endregion
#region gen left
else if(genSide == 1) {
	startY = irandom(5)+1;
	startX = 0;
	
	//add inital path tile
	ds_grid_add(roomGenGrid,startX,startY,"P");
	
	//generate rest of path
	while((startX <= 9) and (startY >= 0 and startY <= 7)) { //while we're in bounds of the grid
		//prioritize going in the same direction for longer
		if(dir == 0) {
			dir = choose(0,0,0,0,0,0,0,2,3);
		} else if(dir == 2) {
			dir = choose(0,2,2,3);
		} else if(dir == 3) {
			dir = choose(0,2,3,3);
		} else {
			dir = choose(0,2,3);
		}
		
		dir = checkPathforObstacle(startX,startY,roomGenGrid,dir);
		
		if(dir == 0) {
			startX += 1;
		} else if(dir == 1) {
			startX -= 1;
		} else if(dir == 2) {
			startY -= 1;
		} else if(dir == 3) {
			startY += 1;
		}
		
		

		if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			ds_grid_add(roomGenGrid,startX,startY,"P");
		}
	}
	
} #endregion
#region gen up
else if(genSide == 2) {
	startY = 0;
	startX = irandom(7)+1;
	
	//add inital path tile
	ds_grid_add(roomGenGrid,startX,startY,"P");
	
	//generate rest of path
	while((startX >= 0 and startX <= 9) and (startY <= 7)) { //while we're in bounds of the grid
		//prioritize going in the same direction for longer
		if(dir == 0) {
			dir = choose(0,0,1,3);
		} else if(dir == 1) {
			dir = choose(0,1,1,3);
		} else if(dir == 3) {
			dir = choose(0,1,3,3,3,3,3,3,3);
		} else {
			dir = choose(0,1,3);
		}
		
		dir = checkPathforObstacle(startX,startY,roomGenGrid,dir);
		
		if(dir == 0) {
			startX += 1;
		} else if(dir == 1) {
			startX -= 1;
		} else if(dir == 2) {
			startY -= 1;
		} else if(dir == 3) {
			startY += 1;
		}
		
		

		if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			ds_grid_add(roomGenGrid,startX,startY,"P");
		}
	}
	
} #endregion
#region gen down
else if(genSide == 3) {
	startY = 7;
	startX = irandom(7)+1;
	
	//add inital path tile
	ds_grid_add(roomGenGrid,startX,startY,"P");
	
	//generate rest of path
	while((startX >= 0 and startX <= 9) and (startY >= 0)) { //while we're in bounds of the grid
		//prioritize going in the same direction for longer
		if(dir == 0) {
			dir = choose(0,0,1,2);
		} else if(dir == 1) {
			dir = choose(0,1,1,2);
		} else if(dir == 2) {
			dir = choose(0,1,2,2,2,2,2,2,2);
		} else {
			dir = choose(0,1,2);
		}
		
		dir = checkPathforObstacle(startX,startY,roomGenGrid,dir);
		
		if(dir == 0) {
			startX += 1;
		} else if(dir == 1) {
			startX -= 1;
		} else if(dir == 2) {
			startY -= 1;
		} else if(dir == 3) {
			startY += 1;
		}
		
		

		if(ds_grid_get(roomGenGrid,startX,startY) != "P") {
			ds_grid_add(roomGenGrid,startX,startY,"P");
		}
	}
	
} #endregion

/*
//fill grid with 0's after path is generated
for(j=0; j<rHeight; j++) {
	for(i=0; i<rWidth; i++) {
		gVal = ds_grid_get(roomGenGrid,i,j);
		if(gVal != "P") {
			//ds_grid_add(roomGenGrid,i,j,"0");
		}
	}
}
*/


levelString = "";
gridVal = "";


for(j=0; j<rHeight; j++) {
	for(i=0; i<rWidth; i++) {
		gridVal = ds_grid_get(roomGenGrid,i,j);
		if(gridVal != 0) {
			levelString += gridVal;
		} else {
			levelString += "0";	
		}
	}
}

show_debug_message(levelString);

return levelString;