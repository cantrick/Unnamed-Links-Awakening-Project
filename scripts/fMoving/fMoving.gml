fInputs();



hsp = (moveRight - moveLeft) * spd;
vsp = (moveDown - moveUp) * spd;

if(tile_meeting(x+hsp, y, "Collision")) {
	hsp = 0;	
}

if(tile_meeting(x, y+vsp, "Collision")) {
	vsp = 0;	
}


if(object_collision()) {
	image_speed = 0.5;
	switch dir {
		case 0: if(sprite_index != sPlayer_CRight) sprite_index = sPlayer_CRight; break;
		case 1: if(sprite_index != sPlayer_CLeft) sprite_index = sPlayer_CLeft; break;
		case 2: if(sprite_index != sPlayer_CUp) sprite_index = sPlayer_CUp; break;
		case 3: if(sprite_index != sPlayer_CDown) sprite_index = sPlayer_CDown; break;
	}	
} else {
	image_speed = 0.5;
	switch dir {
		case 0: if(sprite_index != sPlayer_Right) sprite_index = sPlayer_Right; break;
		case 1: if(sprite_index != sPlayer_Left) sprite_index = sPlayer_Left; break;
		case 2: if(sprite_index != sPlayer_Up) sprite_index = sPlayer_Up; break;
		case 3: if(sprite_index != sPlayer_Down) sprite_index = sPlayer_Down; break;
	}
}

object_collision();

x += hsp;
y += vsp;


//----------Sword Stay on player code-------------
/*
if(moveRight) {
	oSword.x = x+4;

	oSword.image_angle = 30;
}

if(moveLeft) {
	oSword.x = x+11;

	oSword.image_angle = -30;
}

oSword.y = y+8;
*/
//-----------------------------------------------

fInputs();


// Go to other states
/*
if(attackBtn) {
	state = states.attack;	
}
*/
if(!moveUp && !moveDown && !moveLeft && !moveRight) {
	state = states.normal;
}
