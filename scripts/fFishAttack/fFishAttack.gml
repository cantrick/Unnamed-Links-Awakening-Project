
if(moveDir == 0) {
	sprite_index = sFishRight;
	hsp = 1 * spd;
	vsp = 0;
	
	
} else if(moveDir == 1) {
	sprite_index = sFishLeft;
	hsp = -1 * spd;
	vsp = 0;
	

} else if(moveDir == 2) {
	vsp = 1 * spd;
	hsp = 0;
	

} else if(moveDir == 3) {
	vsp = -1 * spd;	
	hsp = 0;
	

}

object_collision();
tile_meeting(x,y,"Collision");

x += hsp;
y += vsp;


// Every second, choose between move or idle
counter += 1;


if(counter mod 30 == 0) {
	change = choose(0,1);
	switch (change) {
		case 0: enemy_state = enemy_states.idle;
		case 1: // If move, choose a direction to move and change to wander state
			counter = 0;
			moveDir = irandom(3);
			enemy_state = enemy_states.attack;
			
	}
	
	counter = 0;
}
