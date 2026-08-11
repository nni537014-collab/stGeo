FUNCTION RotateSquarePoints : XYPoints
VAR_IN_OUT
    Square : XYPoints;
END_VAR
VAR
   X : LREAL;
   Y : LREAL;
   I : INT;
END_VAR
FOR I := 0 TO 3 DO 
    X := Square[I].X;
    Y := Square[I].Y;
    Square[I] := RotateXY(
    X := X,
    Y := Y,
    THETA := 90.0
    );
END_FOR
RotateSquarePoints := Square;
END_FUNCTION
