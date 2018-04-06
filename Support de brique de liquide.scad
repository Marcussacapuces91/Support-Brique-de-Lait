
//brique = [95,60,170];
brique = [100,65,190];

%cube(brique, center=true);

// Palette
module Palette() {
    translate([4.5-brique.x/2,0,4.5-brique.z/2]) union() {
        for (j=[-1,1]) difference() {
            translate([0,j*(brique.y/2+1.5),0]) hull() {
                for (i=[0,1]) translate([70*i-7,0,63-i*70]) cube([1,3,1], center=true);
                rotate([90,0,0]) cylinder(r=7.5,h=3,center=true,$fn=52);
            }
            translate([20,j*(brique.y/2+1.5),20]) rotate([90,0,0]) cylinder(r=2,h=4,center=true,$fn=20);
        }
        for (j=[0,1]) {
            translate([20+19.5,0,-6]) cube([80,brique.y,3],center=true);
            translate([-6,0,65]) rotate([0,90,0]) cube([130,brique.y,3],center=true);
        }
    }
}

// Poignée
module Poigne() {
    difference() {
        translate([1.5+brique.x/2,0,20]) cube([3,brique.y,150], center=true);
        translate([51.5,0,75]) rotate([0,90,0]) cylinder(r=2,h=4,center=true,$fn=20);
        translate([51.5,0,-35]) rotate([0,90,0]) cylinder(r=2,h=4,center=true,$fn=20);
    }
    for (i=[-1,1]) difference() {
        hull() {
            translate([brique.x/2-20,i*(brique.y/2+1.5),0]) rotate([90,0,0]) cylinder(r=7.5,h=3,center=true,$fn=52);
            translate([brique.x/2+1.5,i*(brique.y/2+1.5),0]) cube([3,3,50],center=true);
        }
        translate([brique.x/2-20,i*(brique.y/2+1.5),0]) rotate([90,0,0]) cylinder(r=2,h=4,center=true,$fn=20);
    }
//    scale(0.8) translate([brique.x/2-2896,62.5,brique.z/2-1020]) rotate([-90,0,180]) import("Handle.stl", 10);
}

// Barres latérales
module Lateral() {
    for (i=[1]) difference() { 
        hull() {
            translate([brique.x/2-20,i*(brique.y/2+5),0]) rotate([90,0,0]) cylinder(r=7.5,h=3,center=true,$fn=52);
            translate([24.5-brique.x/2,i*(brique.y/2+5),24.5-brique.z/2]) rotate([90,0,0]) cylinder(r=7.5,h=3,center=true,$fn=52);
        }
        translate([brique.x/2-20,i*(brique.y/2+5),0]) rotate([90,0,0]) cylinder(r=2,h=4,center=true,$fn=20);
        translate([24.5-brique.x/2,i*(brique.y/2+5),24.5-brique.z/2]) rotate([90,0,0]) cylinder(r=2,h=4,center=true,$fn=20);
    }
}

Lateral();
Palette();
Poigne();