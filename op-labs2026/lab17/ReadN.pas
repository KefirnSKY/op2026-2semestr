PROGRAM ReadN(INPUT, OUTPUT);
CONST
  NoDigit = -1;
  OverFlow = -2; 
VAR
  Number: INTEGER;

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER); 
{Считывает текущий символ из файл. Если он - цифра, возвращает его преобразуя в значение типа INTEGER. Если считанный символ не цифра возвращает -1}
VAR 
  Ch: CHAR; 
BEGIN
  IF NOT EOLN(F)
  THEN
    BEGIN   
      READ(F, Ch);
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        BEGIN
          IF Ch = '0' THEN D := 0;
          IF Ch = '1' THEN D := 1;
          IF Ch = '2' THEN D := 2;
          IF Ch = '3' THEN D := 3;
          IF Ch = '4' THEN D := 4;
          IF Ch = '5' THEN D := 5;
          IF Ch = '6' THEN D := 6;
          IF Ch = '7' THEN D := 7;
          IF Ch = '8' THEN D := 8;
          IF Ch = '9' THEN D := 9
        END
      ELSE
        D := NoDigit 
    END
  ELSE 
    D := NoDigit  
END;  

PROCEDURE ReadNumber(VAR F: TEXT; VAR Num: INTEGER);
VAR
  Ch: CHAR;
  Digit: INTEGER;
  FlagBreak: BOOLEAN;
BEGIN
  ReadDigit(F, Digit);
  Num := Digit;
  FlagBreak := False;
  IF Digit <> NoDigit
  THEN
    BEGIN
      WHILE (NOT EOLN(F)) AND (NOT FlagBreak) AND (Num <> OverFlow) 
      DO
        BEGIN
          ReadDigit(F, Digit);
          IF MAXINT DIV 10 >= Num 
          THEN
            BEGIN
              IF MAXINT - Num * 10 >= Digit
              THEN
                IF Digit <> NoDigit
                THEN
                  Num := Num * 10 + Digit
                ELSE
                  FlagBreak := TRUE
              ELSE
                Num := OverFlow
            END
          ELSE
            Num := OverFlow
        END 
    END      
END;

PROCEDURE IfNumberCorrect(VAR Num: INTEGER);
BEGIN
  IF Num = NoDigit
  THEN
    WRITELN('Ни одна цифра не встретилась')
  ELSE 
    BEGIN  
      IF Num = OverFlow 
      THEN
        WRITELN('Введенное число больше MAXINT(', MAXINT, ')')
      ELSE                                                       
        WRITELN('Введенное число равняется: ', Num)
    END
END;
  
BEGIN
  ReadNumber(INPUT, Number);
  IfNumberCorrect(Number)
END.
