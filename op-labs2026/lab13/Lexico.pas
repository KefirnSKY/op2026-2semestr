PROGRAM Lexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Ch: CHAR;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR); 
{Result 0, 1, 2 если лексикографический пор€док F1 =, <, > чем F2 соответственно. ‘актические параметры, соответствующие F1 и F2, должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  Result := '0';                                                                                                         
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2) OR (EOLN(F1) AND (NOT EOLN(F2)))
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2) OR ((NOT EOLN(F1)) AND EOLN(F2))
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END {WHILE}
END; {Lexico}

PROCEDURE ReadFile(VAR F: TEXT); 
VAR
  Ch: CHAR;               
BEGIN 
  REWRITE(F);
  WHILE NOT EOLN
  DO
    BEGIN   
      READ(Ch);
      WRITE(F, Ch)
    END;
  WRITELN(F);
END;
  
BEGIN 
  ReadFile(F1);
  READLN;    
  ReadFile(F2);
  RESET(F1);
  RESET(F2);
  Lexico(F1, F2, Ch);
  IF Ch = '0'
  THEN
    WRITELN('—лова одинаковой длинны');
  IF Ch = '1'
  THEN
    WRITELN('ѕервое слово короче второго');
  IF Ch = '2'
  THEN
    WRITELN('¬торое слово короче первого') 
END.
