rWidth = 10;
rHeight = 8;
count = 1;
stringData = argument0;

roomGrid = ds_grid_create(rWidth,rHeight);

for(j=0; j<rHeight; j++) {
	for(i=0; i<rWidth; i++) {
		ds_grid_add(roomGrid,i,j,string_char_at(stringData,count));
		count++;
	}
}

GenerateRoom(roomGrid);
