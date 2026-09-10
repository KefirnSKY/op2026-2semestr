PROGRAM ReverseCount3(INPUT, OUTPUT);

USES Count3;

VAR
  Ch1, Ch2, Ch3: CHAR;
  X1, X10, X100: CHAR;

BEGIN
  Start();
  IF NOT EOLN
  THEN
    BEGIN
      READ(INPUT, Ch1);
      WRITE('Вход: ', Ch1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(INPUT, Ch2);
          WRITE(Ch2);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(INPUT, Ch3);
              WRITE(Ch3);
              IF ((Ch2 > Ch1) AND (Ch2 > Ch3)) OR  ((Ch2 < Ch1) AND (Ch2 < Ch3))
              THEN
                Bump();
              Ch1 := Ch2;
              Ch2 := Ch3
            END
        END
    END
  ELSE
    WRITE('Вход: ');
  Value(X100, X10, X1);
  WRITELN; 
  WRITELN('Количество реверсов: ', X100, X10, X1)
END.
