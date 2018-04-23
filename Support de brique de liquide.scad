
//brique = [95,60,170];
brique = [100,65,190];

//%cube(brique, center=rue);

// Palette
module Palette(epaisseur = 3) {
    translate([4.5-brique.x/2,0,4.5-brique.z/2]) union() {
        for (j=[-1,1]) difference() {
            union() {
                translate([0,j*((brique.y+epaisseur)/2),0]) hull() {
                    for (i=[-1,1]) translate([30.5-i*35-epaisseur/2,0,33+i*37.5-epaisseur/2]) cube([epaisseur,epaisseur,epaisseur], center=true);
                    rotate([90,0,0]) cylinder(r=4.5+epaisseur,h=epaisseur,center=true,$fn=52);
                }
// Épaulement (diam 12)
               translate([17.5,j*(brique.y/2+epaisseur*1.5-0.25),17.5]) rotate([90,0,0]) cylinder(r=6,h=epaisseur+0.5,center=true,$fn=30);
            }
// Trous de l'axe (diam 4)            
            translate([17.5,j*(brique.y/2+epaisseur),17.5]) rotate([90,0,0]) cylinder(r=2,h=epaisseur*2+1,center=true,$fn=20);
// Trous de la tête de vis (diam 10)
           translate([17.5,j*(brique.y/2+1),17.5]) rotate([90,0,0]) cylinder(r=5,h=4,center=true,$fn=20);
        }
        for (j=[0,1]) {
            translate([20+19.5,0,-4.5-epaisseur/2]) cube([80,brique.y,epaisseur],center=true);
            translate([-4.5-epaisseur/2,0,65]) rotate([0,90,0]) cube([130,brique.y,epaisseur],center=true);
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
module Lateral(epaisseur = 3) {
    for (i=[1]) difference() { 
        hull() {
            translate([brique.x/2-20,i*(brique.y/2+5),0]) rotate([90,0,0]) cylinder(r=6+epaisseur,h=epaisseur,center=true,$fn=52);
            translate([24.5-brique.x/2,i*(brique.y/2+5),24.5-brique.z/2]) rotate([90,0,0]) cylinder(r=6+epaisseur,h=epaisseur,center=true,$fn=52);
        }
        translate([brique.x/2-20,i*(brique.y/2+5),0]) rotate([90,0,0]) cylinder(r=6,h=epaisseur+1,center=true,$fn=20);
        translate([24.5-brique.x/2,i*(brique.y/2+5),24.5-brique.z/2]) rotate([90,0,0]) cylinder(r=6,h=epaisseur+1,center=true,$fn=20);
    }
}

Lateral();
// Palette();
// Poigne();