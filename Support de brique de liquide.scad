
// brique = [95,60,170];
brique = [100,65,190];

%cube(brique, center=true);


translate([4.5-brique.x/2,0,4.5-brique.z/2]) {
    for (j=[-1,1]) translate([0,j*(brique.y/2+1.5),0]) hull() {
        hull() {
            for (i=[0,1]) translate([70*i-7,0,63-i*70]) cube([1,3,1], center=true);
            rotate([90,0,0]) cylinder(r=7.5,h=3,center=true,$fn=52);
        }
    }
    for (j=[0,1]) {
        translate([20+19.5,0,-6]) cube([80,brique.y,3], center=true);
        translate([-6,0,65]) rotate([0,90,0]) cube([130,65,3], center=true);
    }
}