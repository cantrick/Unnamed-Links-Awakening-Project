switch(state) {
	case states.normal: fNormal(); break;
	case states.moving: fMoving(); break;
	case states.attack: fAttack(); break;
}
// don't allow room transitions if the out of grid bounds
roomsX = 1; // number of rooms in the grid. 10x10 grid for testing INF
roomsY = 1;

//change current room variables if player goes out of bounds
if(x < (0+(sprite_width/2))) { // left boundary
	if(currRoomX-1 < 0) { // don't allow room transitions if the out of grid bounds
		x = 7;
	} else {
		infRoomSwitch(1,currRoomX,currRoomY);
		currRoomX -=1;
		x = (room_width-sprite_width);
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
	}

} else if(x > (room_width-(sprite_width/2))) { //right boundary
	if(currRoomX+1 >= roomsX) { 
		infRoomSwitch(0,currRoomX,currRoomY);
		currRoomX +=1;
		x = (0+sprite_width);
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
		//x = 153;
	} else {
		currRoomX +=1;
		x = (0+sprite_width);
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
	}


} else if(y < (0+(sprite_width/2))) {  //hit upper boundary
	if(currRoomY-1 < 0) { 
		y = (0+(sprite_width/2));
	} else {
		infRoomSwitch(2,currRoomX,currRoomY);
		currRoomY -=1;
		y = (room_height-(sprite_width/2))-16;
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
	}

} else if(y > (room_height-(sprite_width/2))-16) { //hit lower boundary
	if(currRoomY+1 >= roomsY) { 
		infRoomSwitch(3,currRoomX,currRoomY);
		currRoomY +=1;
		y = (0+(sprite_width/2));
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
		//y = (room_height-(sprite_width/2))-16;
	} else {
		currRoomY +=1;
		y = (0+(sprite_width/2));
		ClearRoom();
		roomSwitch(currRoomX,currRoomY);
	}

}

