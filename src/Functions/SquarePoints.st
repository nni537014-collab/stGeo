FUNCTION SquarePoints : XYPoints
VAR_OUTPUT
    //Square : Array[0..1] of LREAL;//XYPoints;
END_VAR
VAR_INPUT
    Length : LREAL := 5.0;
    
END_VAR
VAR
   Zero : LREAL := 0.0;
   Square : XYPoints;
END_VAR

    Square[0].X := Zero;
    Square[0].Y := Length;
    Square[1].X := Length;
    Square[1].Y := Length;    
    Square[2].X := Length;
    Square[2].Y := Zero;
    Square[3].X := Zero;
    Square[3].Y := Zero; 
    SquarePoints := Square;
END_FUNCTION