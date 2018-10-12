
switch(enemy_state) {
	case enemy_states.idle: fFishIdle(); break;
	//case enemy_states.wander: fEnemyWander(); break;
	case enemy_states.attack: fFishAttack(); break;
}
