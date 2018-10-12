
hsp = 0;
vsp = 0;

counter += 1;

if(counter mod 60 == 0) {
	change = choose(0,1);
	switch (change) {
		case 0: enemy_state = enemy_states.idle; break;
		case 1: // If move, choose a direction to move and change to wander state
			counter = 0;
			moveDir = irandom(3);
			enemy_state = enemy_states.attack;
	}
	
	counter = 0;
}

//attack code but prob not..