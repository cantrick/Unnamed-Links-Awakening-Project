rGrid = argument0;

for(i=0; i <= ds_grid_width(rGrid); i++) {
	for(j=0; j <= ds_grid_height(rGrid); j++) {
		switch(ds_grid_get(rGrid,i,j)) {
			case "0": checkGridforGrass(i,j,rGrid); break;
			case "P": instance_create_layer(i*16,j*16,"Instances",oPath); break;
			case "S": instance_create_layer(i*16,j*16,"Instances",oShop); break;
			case "-": break;
		}
	}
}

