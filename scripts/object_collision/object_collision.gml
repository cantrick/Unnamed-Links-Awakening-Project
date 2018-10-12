//Horizontal Collision

if(place_meeting(x+hsp, y, oWalls)) {
	repeat(abs(hsp)) {
		if(!place_meeting(x+sign(hsp), y, oWalls)) {
			x += sign(hsp);
		} else {
			break;	
		}
	}
	hsp = 0;
	return true;
}


//vertical Collision

if(place_meeting(x, y+vsp, oWalls)) {
	repeat(abs(vsp)) {
		if(!place_meeting(x, y+sign(vsp), oWalls)) {
			y += sign(vsp);
		} else {
			break;	
		}
	}
	vsp = 0;
	return true;
}
