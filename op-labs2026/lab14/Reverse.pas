PROGRAM ReversePr(INPUT, OUTPUT);
VAR
  F: TEXT;
  Ch: CHAR;
  
PROCEDURE Reverse(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  IF NOT EOLN
  THEN
    Reverse(F); 
  WRITE(F, Ch)
END;  

BEGIN
  REWRITE(F);
  Reverse(F);
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      READ(F, Ch);
      WRITE(Ch)
    END;
  WRITELN 
END.
