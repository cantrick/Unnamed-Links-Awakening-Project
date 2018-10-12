// swing and then return to position


instance_create_layer(x,y,"Above", oSword);

if(sprite_index == sPlayer_Right) {
	sprite_index = sPlayer_Attack_Right;
} else if(sprite_index == sPlayer_Left) {
	sprite_index = sPlayer_Attack_Left;
}