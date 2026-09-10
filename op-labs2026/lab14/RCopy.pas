PROGRAM RCopy(INPUT, OUTPUT);
PROCEDURE RCopy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN 
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      RCopy(F1, F2); 
      WRITE(F2, Ch)
    END
END;
BEGIN
  RCopy(INPUT, OUTPUT)
END.
