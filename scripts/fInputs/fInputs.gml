moveUp = keyboard_check(ord("W"));
moveDown = keyboard_check(ord("S"));
moveLeft = keyboard_check(ord("A"));
moveRight = keyboard_check(ord("D"));
//attackBtn = keyboard_check(vk_space);


if(moveRight) {
	dir = 0;
}

if(moveLeft) {
	dir = 1;
}


if(moveUp) {
	dir = 2;
}

if(moveDown) {
	dir = 3;	
} 
