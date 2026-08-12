FUNCTION RotateXY : XYPoint
VAR_INPUT
    X : LREAL;
    Y : LREAL;
    THETA : LREAL;
END_VAR
VAR
    Out : XYPoint;
    SinM : LREAL;
    CosM : LREAL;
    THETA_RAD : LREAL;
END_VAR 
   
   THETA_RAD := REAL_TO_LREAL(
    RAD(
        LREAL_TO_REAL(THETA)
        )
    );  
   SinM := SIN(THETA_RAD);
   Cosm := COS(THETA_RAD);
   Out.X := X * CosM - Y * SinM;
   Out.Y := X * SinM + Y * CosM;
   RotateXY := Out;
END_FUNCTION
