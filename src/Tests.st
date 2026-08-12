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
