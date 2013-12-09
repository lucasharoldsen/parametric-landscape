landSize = 70;
riverSize = 30;
depth = 5;
fishSize = 3;
bridgeSize = 10;





module land(x,y,z){

translate([0,-landSize*0.75,0])
cube([landSize,landSize*2,10]);

}




module ditch(x,y,z){

rotate([0,90,0])
translate(x,y,z)
cylinder(h=landSize*1.3,r1=riverSize,r2=riverSize*0.7);
}


module water(x,y,z){

difference(){

land(0,0,0);


translate([-5,landSize*0.25,12])
ditch(0,0,0);
}

translate([0,-landSize*0.75,0])
cube([landSize,landSize*2,depth]);

}



module fish(x,y,z){

rotate([0,90,0])
resize(newsize=[fishSize,fishSize,fishSize*3]) sphere(r=3,$fn=10);
difference(){
translate([fishSize*2,0,0])
sphere(r=fishSize*0.5,$fn=10);
translate([fishSize*2.5,0,0])
sphere(r=fishSize*0.5,$fn=10);
}

}


for(i = [[landSize*0.3,landSize*0.25,depth],
		 [landSize*0.3+fishSize*7,landSize*0.25+fishSize*2,depth],
		 [landSize*0.3+fishSize*5,landSize*0.25-fishSize*0.5,depth]])
{ 
translate(i)
fish(0,0,0);
}


translate([landSize*0.7,16,10])
rotate([90,0,0])
cube([bridgeSize,1,riverSize*2],center=true);



water(0,0,0);






