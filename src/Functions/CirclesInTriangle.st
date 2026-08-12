TYPE CirclesInTriangleError : 
    (
        NO_ERROR,
        ROWS_EXCEEDED
    );
END_TYPE

FUNCTION CirclesInTriangle : CirclesInTriangleError
    VAR_INPUT
        Radius : LREAL := 5.0;
        Rows : UINT := 5;
        // possibly set max rows and  
    END_VAR
    VAR_OUTPUT
       Points : ARRAY [0..65] OF XYPoint;
    END_VAR
    VAR
        RowLength : UINT := 0;
        RowOffset : XYPoint;
        Remaining : UINT;
        I : UINT;
        T60Rad : LREAL;
        PointsIndex : UINT := 0;
        XGap : LREAL;
    END_VAR
    VAR
        CONSTANT MAX_ROWS : UINT := 11;
    END_VAR

    IF Rows > MAX_ROWS THEN
       CirclesInTriangle := CirclesInTriangleError#ROWS_EXCEEDED;
       RETURN;
    END_IF
        T60Rad := TAN(RAD(60)) * Radius;
        XGap := LREAL#2.0 * Radius;
    FOR I := 0 TO Rows -1 DO
        RowLength := RowLength + 1;
        Remaining := RowLength;
        WHILE Remaining > 0 DO
            Points[PointsIndex].X := RowOffset.X + (RowLength - Remaining ) * XGap;
            Points[PointsIndex].Y := RowOffset.Y;
            Remaining := Remaining - 1;
            PointsIndex := PointsIndex + 1;
        END_WHILE
        RowOffset.Y := RowOffset.Y + T60Rad; 
        RowOffset.X := RowOffset.X - Radius;
    END_FOR
    CirclesInTriangle := CirclesInTriangleError#NO_ERROR;
END_FUNCTION
