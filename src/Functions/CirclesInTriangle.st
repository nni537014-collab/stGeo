TYPE CirclesInTriangleError : 
    (
        NO_ERROR,
        ROWS_EXCEEDED
    );
END_TYPE

FUNCTION CirclesInTriangleBackUp : CirclesInTriangleError
    VAR_INPUT
        Radius : LREAL := LREAL#5.0;
        Rows : UINT := UINT#5;
        // possibly set max rows and  
    END_VAR
    VAR_OUTPUT
       Points : ARRAY [0..65] OF XYPoint;
    END_VAR
    // VAR
    //     RowLength : UINT := 0;
    //     RowOffset : XYPoint;
    //     Remaining : UINT;
    //     I : UINT;
    //     T60Rad : LREAL;
    //     PointsIndex : UINT := 0;
    //     PointsInt : ARRAY [0..65] OF XYPoint;
    //     XGap : LREAL;
    // END_VAR
    // VAR
    //     CONSTANT MAX_ROWS : UINT := 11;
    // END_VAR

    // IF Rows > MAX_ROWS THEN
    //    CirclesInTriangle := CirclesInTriangleError#ROWS_EXCEEDED;
    //    RETURN;
    // END_IF
    //     T60Rad := TAN(RAD(REAL#60)) * Radius;
    //     XGap := LREAL#2.0 * Radius;
    // FOR I := 0 TO 65 DO //Rows -1 DO
    //     RowLength := RowLength + 1;
    //     Remaining := RowLength;
        // WHILE Remaining > 0 DO
        //     PointsInt[PointsIndex].X := RowOffset.X + (RowLength - Remaining ) * XGap;
        //     PointsInt[PointsIndex].Y := RowOffset.Y;
        //     Remaining := Remaining - 1;
        //     PointsIndex := PointsIndex + 1;
        // END_WHILE
    //     RowOffset.Y := RowOffset.Y + T60Rad; 
    //     RowOffset.X := RowOffset.X - Radius;
    // END_FOR
    // Points := PointsInt;
    CirclesInTriangleBackUp := CirclesInTriangleError#NO_ERROR;
END_FUNCTION
FUNCTION CirclesInTriangle : CirclesInTriangleError
    VAR_INPUT
        Radius : LREAL := LREAL#5.0;
        Rows : UINT := UINT#5;
        // possibly set max rows and  
    END_VAR
    VAR_OUTPUT
       Points : ARRAY [0..65] OF XYPoint;
    END_VAR
    VAR
        RowLength : UINT := UINT#0;
        RowOffset : XYPoint;
        Remaining : UINT;
        I : UINT;
        T60Rad : LREAL;
        PointsIndex : UINT := UINT#0;
        PointsInt : ARRAY [0..65] OF XYPoint;
        XGap : LREAL;
    END_VAR
    VAR
        CONSTANT MAX_ROWS : UINT := UINT#11;
    END_VAR

    IF Rows > MAX_ROWS THEN
       CirclesInTriangle := CirclesInTriangleError#ROWS_EXCEEDED;
       RETURN;
    END_IF
        T60Rad := TAN(RAD(REAL#60.0)) * Radius;
        XGap := LREAL#2.0 * Radius;
    FOR I := 0 TO Rows -1 DO
        RowLength := RowLength + UINT#1;
        Remaining := RowLength;
        WHILE Remaining > 0 DO
            PointsInt[PointsIndex].X := RowOffset.X + (RowLength - Remaining ) * XGap;
            PointsInt[PointsIndex].Y := RowOffset.Y;
            Remaining := Remaining - UINT#1;
            PointsIndex := PointsIndex + UINT#1;
        END_WHILE
        RowOffset.Y := RowOffset.Y + T60Rad; 
        RowOffset.X := RowOffset.X - Radius;
    END_FOR
    Points := PointsInt;
   CirclesInTriangle := CirclesInTriangleError#NO_ERROR;
END_FUNCTION

FUNCTION DUT : XYPoints
VAR_OUTPUT
    Square : XYPoints;
END_VAR
VAR
   X : LREAL;
   Y : LREAL;
   I : INT;
   SquareInt : XYPoints;
END_VAR
FOR I := 0 TO 3 DO 
    X := SquareInt[I].X;
    Y := SquareInt[I].Y;
    SquareInt[I] := RotateXY(
    X := X,
    Y := Y,
    THETA := 90.0
    );
END_FOR
Square := SquareInt;
DUT := SquareInt;
END_FUNCTION

