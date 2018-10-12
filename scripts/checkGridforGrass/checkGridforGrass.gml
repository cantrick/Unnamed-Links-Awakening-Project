i = argument0;
j = argument1;
grid = argument2;



if((i > 0 and j > 0) and (ds_grid_get(rGrid,i-1,j) != "0" and ds_grid_get(rGrid,i,j-1) != "0")) { //check Left and Top
	instance_create_layer(i*16,j*16,"Instances",oGrassTopLeft);
} else if((i+1 <= 10 and j > 0) and (ds_grid_get(rGrid,i+1,j) != "0" and ds_grid_get(rGrid,i,j-1) != "0")){ //check Right and Top
	instance_create_layer(i*16,j*16,"Instances",oGrassTopRight);
} else if((i > 0 and j+1 <= 8) and (ds_grid_get(rGrid,i-1,j) != "0" and ds_grid_get(rGrid,i,j+1) != "0")) { //check Left and Bot
	instance_create_layer(i*16,j*16,"Instances",oGrassBotLeft);
} else if((i+1 <= 10 and j+1 <= 8) and (ds_grid_get(rGrid,i+1,j) != "0" and ds_grid_get(rGrid,i,j+1) != "0")){ //check Right and Bot
	instance_create_layer(i*16,j*16,"Instances",oGrassBotRight); 
} else if((i > 0) and (ds_grid_get(rGrid,i-1,j) != "0")) { //check left
	instance_create_layer(i*16,j*16,"Instances",oGrassLeft);
} else if((i+1 <= 10) and (ds_grid_get(rGrid,i+1,j) != "0")) { //check right
	instance_create_layer(i*16,j*16,"Instances",oGrassRight);
} else if((j > 0) and (ds_grid_get(rGrid,i,j-1) != "0")) { //check Top
	instance_create_layer(i*16,j*16,"Instances",oGrassTop);
} else if((j+1 <= 8) and (ds_grid_get(rGrid,i,j+1) != "0")) { //check Bottom
	instance_create_layer(i*16,j*16,"Instances",oGrassBot);
} else {
	randnum = choose(0,1,2,3,4,5,6,7,8,9);
	if(randnum == 9) {
		instance_create_layer(i*16,j*16,"Instances",oFlower);	
	} else {
		instance_create_layer(i*16,j*16,"Instances",oGrass);
	}
}