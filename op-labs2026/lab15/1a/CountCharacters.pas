PROGRAM CountCharacters(INPUT, OUTPUT);

USES Count3;

VAR
  Ch: CHAR;
  X1, X10, X100: CHAR;

BEGIN
  Start();

  WHILE NOT EOLN
  DO
    BEGIN
      READ(INPUT, Ch);
      Bump()
    END;

  Value(X100, X10, X1);

  IF (X100 = '9') AND (X10 = '9') AND (X1 = '9')
  THEN
    WRITELN('Количество символов: 999 либо больше 999')
  ELSE
    WRITELN('Количество символов: ', X100, X10, X1)
END.
