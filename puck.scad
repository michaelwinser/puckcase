

DIAMETER = 3 * 25.4;
RADIUS = DIAMETER / 2;
HEIGHT = 1 * 25.4;

BASE_HEIGHT = HEIGHT - 7;
BOTTOM_THICKNESS = 2;
WALL_THICKNESS = 2;
TOP_THICKNESS = 2;

LID_HEIGHT = HEIGHT - BASE_HEIGHT;
LID_HEIGHT_OFFSET = 60;

FLANGE_HEIGHT = LID_HEIGHT / 2;

INNER_RADIUS = RADIUS - WALL_THICKNESS;

LID_INNER_RADIUS = INNER_RADIUS - WALL_THICKNESS - 0.1;

BOARD_WIDTH = 17.8;
BOARD_LENGTH = 35;
BOARD_HEIGHT = 5;

COIL_DIAMETER = 40;
COIL_RADIUS = COIL_DIAMETER / 2;
COIL_THICKNESS = 1;


$fn = 360;


base();
top();

module base() {
    difference() {
        cylinder(BASE_HEIGHT, RADIUS, RADIUS);
        translate([0, 0, BOTTOM_THICKNESS]) {
            cylinder(BASE_HEIGHT, INNER_RADIUS, INNER_RADIUS);
        }
    }
}

module top() {
    translate([DIAMETER + 20, 0, 0]) {
        difference() {
            union() {
                cylinder(LID_HEIGHT, RADIUS, RADIUS);
                cylinder(LID_HEIGHT + FLANGE_HEIGHT, INNER_RADIUS, INNER_RADIUS);
            }
            translate([0, 0, TOP_THICKNESS]) {
                cylinder(LID_HEIGHT + FLANGE_HEIGHT, INNER_RADIUS - WALL_THICKNESS, INNER_RADIUS - WALL_THICKNESS);
            }
        }
    }
}

// battery();
// chargingcoil();


module chargingcoil() {
translate([0, 0, WALL_THICKNESS]) {
    color("orange") cylinder(COIL_THICKNESS, COIL_RADIUS, COIL_RADIUS);
}

linear_extrude(3) {
    text("charging coil", size=5, halign="center");
}
}


module battery() {
    
    // 68*37*19mm
    // 2.95 x 2.91 x 0.71 inches
    // 1.89 x 0.47 x 1.89 inches
    
    translate([0, 0, 0.47 * 25.4]) {
        color("black", 0.5) linear_extrude(2, true) text("battery", halign = "center");
        color("gray", 0.2) cube([1.89 * 25.4, 1.89 * 25.4, 0.47 * 25.4], true);
    }
}
module battery18650() {
    cylinder(67, 18, 18, true);
}