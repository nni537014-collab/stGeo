
PROGRAM MainProgram
VAR
    e_stop         : BOOL;   (* %IX0.0 — write TRUE to stop the line *)
    running        : BOOL;   (* %QX2.0 *)
    conveyor_speed : INT;    (* %QW0   *)
    part_count     : INT;    (* %MW0   *)
    out : XYPoints;
    Length : LREAL := LREAL#5.0;
    Points : ARRAY [0..65] OF XYPoint;
END_VAR

out := SquarePoints();
RotateSquarePoints(Square := out);
Dut(Square => out);
CirclesInTriangleBackUp(Points => Points);
running := NOT e_stop;
IF running THEN
    IF conveyor_speed < 100 THEN
        conveyor_speed := conveyor_speed + 5;
    ELSE
        part_count := part_count + 1;
        conveyor_speed := 0;
    END_IF;
ELSE
    conveyor_speed := 0;
END_IF;
END_PROGRAM

