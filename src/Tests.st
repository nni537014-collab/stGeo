TEST_FUNCTION_BLOCK RotateXYTest
VAR
    Res : XYPoint;     
END_VAR
    Res := RotateXY(
        X := LREAL#5.0,
        Y := LREAL#5.0,
        THETA := LREAL#90.0
    );
    ASSERT_NEAR(EXPECTED := LREAL#-5.0,
                ACTUAL := Res.X,
                DELTA := LREAL#0.015
    );
    ASSERT_NEAR(EXPECTED := LREAL#5.0,
                ACTUAL := Res.Y,
                DELTA := LREAL#0.015
    );
    Res := RotateXY(
        X := LREAL#5.0,
        Y := LREAL#5.0,
        THETA := LREAL#180.0
    );
    ASSERT_NEAR(EXPECTED := LREAL#-5.0,
                ACTUAL := Res.X,
                DELTA := LREAL#0.015
    );
    ASSERT_NEAR(EXPECTED := LREAL#-5.0,
                ACTUAL := Res.Y,
                DELTA := LREAL#0.015
    );
    Res := RotateXY(
        X := LREAL#5.0,
        Y := LREAL#5.0,
        THETA := LREAL#270.0
    );
    ASSERT_NEAR(EXPECTED := LREAL#5.0,
                ACTUAL := Res.X,
                DELTA := LREAL#0.015
    );
    ASSERT_NEAR(EXPECTED := LREAL#-5.0,
                ACTUAL := Res.Y,
                DELTA := LREAL#0.015
    );
    Res := RotateXY(
        X := LREAL#5.0,
        Y := LREAL#5.0,
        THETA := LREAL#360.0
    );
    ASSERT_NEAR(EXPECTED := LREAL#5.0,
                ACTUAL := Res.X,
                DELTA := LREAL#0.015
    );
    ASSERT_NEAR(EXPECTED := LREAL#5.0,
                ACTUAL := Res.Y,
                DELTA := LREAL#0.015
    );
END_TEST_FUNCTION_BLOCK


TEST_FUNCTION_BLOCK RotateSquarePointsTest
    VAR
       Points : XYPoints;
       Res : XYPoints;
    END_VAR
    Points := SquarePoints();
    Res := RotateSquarePoints(Square := Points);

    ASSERT_NEAR(EXPECTED := LREAL#-5.0,
                ACTUAL := Res[0].X,
                DELTA := LREAL#0.015
    );
    ASSERT_NEAR(EXPECTED := LREAL#0.0,
                ACTUAL := Res[0].Y,
                DELTA := LREAL#0.015
    );
    
END_TEST_FUNCTION_BLOCK

TEST_FUNCTION_BLOCK CirclesInTriangleErrorTest
    VAR
       Points : XYPoints;
       Res : XYPoints;
       Rows : UINT := 12; //CONST?
       Error : CirclesInTriangleError
    END_VAR
    Error := CirclesInTriangle(Rows := Rows);

    ASSERT_EQUAL(EXPECTED := CirclesInTriangleError#ROWS_EXCEEDED,
                ACTUAL := Error,
    );
END_TEST_FUNCTION_BLOCK


TEST_FUNCTION_BLOCK CirclesInTriangleTest
    VAR
    //    Expected :  ARRAY [0..65] OF XYPoint;
    //    Res :  ARRAY [0..65] OF XYPoint;
        Error : CirclesInTriangleError;
        I : INT;
    END_VAR
// // row 0    
// Expected[0].X :=LREAL#0.0;
// Expected[0].Y :=LREAL#0.0;
// // row 1
// Expected[1].X :=LREAL#- 5.0;
// Expected[1].Y :=LREAL#8.660254;

// Expected[2].X :=LREAL#5.0;
// Expected[2].Y :=LREAL#8.660254;
// // row 2
// Expected[3].X :=LREAL#- 10.0;
// Expected[3].Y :=LREAL#17.320508;

// Expected[4].X :=LREAL#0.0;
// Expected[4].Y :=LREAL#17.320508;

// Expected[5].X :=LREAL#10.0;
// Expected[5].Y :=LREAL#17.320508;
// // row 3
// Expected[6].X :=LREAL#- 15.0;
// Expected[6].Y :=LREAL#25.980762;

// Expected[7].X :=LREAL#- 5.0;
// Expected[7].Y :=LREAL#25.980762;

// Expected[8].X :=LREAL#5.0;
// Expected[8].Y :=LREAL#25.980762;

// Expected[9].X :=LREAL#15.0;
// Expected[9].Y :=LREAL#25.980762;
// // row 4
// Expected[10].X :=LREAL#- 20.0;
// Expected[10].Y :=LREAL#34.641016;

// Expected[11].X :=LREAL#- 10.0;
// Expected[11].Y :=LREAL#34.641016;

// Expected[12].X :=LREAL#0.0;
// Expected[12].Y :=LREAL#34.641016;

// Expected[13].X :=LREAL#10.0;
// Expected[13].Y :=LREAL#34.641016;

// Expected[14].X :=LREAL#20.0;
// Expected[14].Y :=LREAL#34.641016;
 Error := CirclesInTriangle(Points => Res);

FOR I := 0 TO 14 DO 
    ASSERT_NEAR(EXPECTED := Expected[I].X,
                ACTUAL := Res[I].X,
                DELTA := LREAL#0.015
    );
END_FOR
    //Res := RotateSquarePoints(Square := Points);

    // ASSERT_NEAR(EXPECTED := LREAL#-5.0,
    //             ACTUAL := Res[0].X,
    //             DELTA := LREAL#0.015
    // );
    // ASSERT_NEAR(EXPECTED := LREAL#0.0,
    //             ACTUAL := Res[0].Y,
    //             DELTA := LREAL#0.015
    // );
    
END_TEST_FUNCTION_BLOCK
