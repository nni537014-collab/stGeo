CONFIGURATION ConveyorCell
TASK Cycle (INTERVAL := T#50ms, PRIORITY := 1);
PROGRAM P1 WITH Cycle : MainProgram;
VAR_CONFIG
    P1.e_stop         AT %IX0.0 : BOOL;
    P1.running        AT %QX2.0 : BOOL;
    P1.conveyor_speed AT %QW0   : INT;
    P1.part_count     AT %MW0   : INT;
    P1.out AT %MB2 : XYPoints;
    // P1.out[0].Y AT %MW4 : INT;//Array[0..1] of INT;
END_VAR
END_CONFIGURATION
