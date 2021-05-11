
/**
 * This file is generated by layout file.
 * Do not edit this file directly.
 */

plate_depth = 1.5;
offset = (19.05 - 14) / 2;
stabilizer_width = 8.4;
stabilizer_height = 14;


$fn = 30;

module rounded_cube(dimens, radius) {
    hull() {
        translate([radius, radius]) cylinder(r=radius, h=dimens[2]);
        translate([dimens[0]-radius, radius]) cylinder(r=radius, h=dimens[2]);
        translate([dimens[0]-radius, dimens[1]-radius]) cylinder(r=radius, h=dimens[2]);
        translate([radius, dimens[1]-radius]) cylinder(r=radius, h=dimens[2]);
    }
}

module half_bevel_cube(dimens, cut_len) {
    hull() {
        x_dimens = [dimens[0]-2*cut_len, dimens[1], dimens[2]];
        translate([cut_len, 0, 0]) cube(x_dimens);

        y_dimens = [dimens[0], dimens[1]-2*cut_len, dimens[2]];
        translate([0, cut_len, 0]) cube(y_dimens);
    }
}

module screw_holes(dimens) {
    padding = 5;
    screw_diameter = 3.2;

    union() {
        translate([padding, padding, 0]) cylinder(d=screw_diameter, h=dimens[2]);
        translate([padding, dimens[1]-padding, 0]) cylinder(d=screw_diameter, h=dimens[2]);
        translate([dimens[0]-padding, padding, 0]) cylinder(d=screw_diameter, h=dimens[2]);
        translate([dimens[0]-padding, dimens[1]-padding, 0]) cylinder(d=screw_diameter, h=dimens[2]);
    }
}


module switch_hole() {
    translate([offset, offset, 0]) union() {
        cube([14, 14, plate_depth]);

        // translate([4.5, -1, 1.5]) cube([5, 1, plate_depth-1.5]);
        // translate([4.5, 14, 1.5]) cube([5, 1, plate_depth-1.5]);
    }
}

module stabilizer_hole() {
    translate([offset, offset, 0]) union() {
        translate([-stabilizer_width+0.1, 1, 0]) cube([stabilizer_width, stabilizer_height, plate_depth]);
        translate([14-0.1, 1, 0]) cube([stabilizer_width, stabilizer_height, plate_depth]);
    }
}


difference() {
    dimens = [67.15, 129.0625, plate_depth];
    rounded_cube(dimens, 3);
    screw_holes(dimens);
    translate([5.0, 5.0, 0]) switch_hole();
    translate([24.05, 5.0, 0]) switch_hole();
    translate([43.1, 5.0, 0]) switch_hole();
    translate([5.0, 28.8125, 0]) switch_hole();
    translate([24.05, 28.8125, 0]) switch_hole();
    translate([43.1, 28.8125, 0]) switch_hole();
    translate([5.0, 47.862500000000004, 0]) switch_hole();
    translate([24.05, 47.862500000000004, 0]) switch_hole();
    translate([43.1, 47.862500000000004, 0]) switch_hole();
    translate([24.05, 85.9625, 0]) switch_hole();
    translate([5.0, 105.0125, 0]) switch_hole();
    translate([24.05, 105.0125, 0]) switch_hole();
    translate([43.1, 105.0125, 0]) switch_hole();
}