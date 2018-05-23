
//brique = [95,60,170];
brique = [100,65,190];

%cube(brique, center=true);

// Palette
module Palette(epaisseur = 3) {
// Dessous
    translate([-5,0,-(brique.z+epaisseur)/2]) cube([80,brique.y,epaisseur],center=true);

// Latérale

    difference() {
        translate([-(brique.x+epaisseur)/2,0,-15]) rotate([0,90,0]) cube([150,brique.y,epaisseur],center=true);
        translate([-(brique.x+epaisseur)/2,0,50.8]) rotate([0,90,0]) cylinder(r=2,h=epaisseur+1,center=true,$fn=20);
        translate([-(brique.x+epaisseur)/2,0,-59.1]) rotate([0,90,0]) cylinder(r=2,h=epaisseur+1,center=true,$fn=20);
    }

// Côtés
    for (i=[-1,1]) {
        difference() {
    // Paroie            
            hull() 
                for (x=[-brique.x/2-epaisseur+7.5,brique.x/3])
                    for (z=[-brique.z/2-epaisseur+7.5,brique.z/3])
                        translate([x,i*(brique.y+epaisseur)/2,z]) rotate([90,0,0]) cylinder(r=4.5+epaisseur, h=epaisseur,center=true, $fn=52);
    // Evidement
            hull() 
                for (x=[-brique.x/2-epaisseur+7.5+15,brique.x/3-15])
                    for (z=[-brique.z/2-epaisseur+7.5+15,brique.z/3-15])
                        translate([x,i*(brique.y+epaisseur)/2,z]) rotate([90,0,0]) cylinder(r=4.5+epaisseur,h=epaisseur+1,center=true,$fn=52);
                    
        }
        hull() {
        translate([-brique.x/2-epaisseur+7.5,i*(brique.y+epaisseur)/2,brique.z/3]) rotate([90,0,0]) cylinder(r=4.5+epaisseur, h=epaisseur,center=true, $fn=52);
        translate([brique.x/3,i*(brique.y+epaisseur)/2,-brique.z/2-epaisseur+7.5]) rotate([90,0,0]) cylinder(r=4.5+epaisseur, h=epaisseur,center=true, $fn=52);
        }
    }

}
    
module Poigne() {
    scale(0.8) translate([brique.x/2+2795.5,-62.5,brique.z/2-1050]) rotate([-90,0,0]) import("Handle.stl", 10);
}


Palette();
Poigne();

