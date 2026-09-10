PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  Arr: SET OF Min..Max;
  MinNum, Num: INTEGER;
BEGIN
  Arr := [Min..Max]; 
  MinNum := Min;
  WHILE MinNum <= Max
  DO
    BEGIN
      IF MinNum IN Arr
      THEN
        BEGIN
          Num := MinNum;
          WHILE Num <= Max
          DO
            BEGIN
              Arr := Arr - [Num];
              Num := Num + MinNum
            END;
          WRITE(MinNum, ' ')       
        END; 
      MinNum := MinNum + 1
    END;
  WRITELN  
END.
