PROGRAM ReadD(INPUT, OUTPUT);
CONST
  NoDigit = -1;
VAR
  Sum, Num: INTEGER;
    
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
  
BEGIN
  Sum := 0;
  Num := 0;
  WHILE Num <> NoDigit
  DO
    BEGIN               
      Sum := Sum + Num;
      ReadDigit(INPUT, Num)
    END; 
  IF Sum <> 0
  THEN
    WRITELN('Значение: ', Sum)  
  ELSE
    WRITELN('Ни одна цифра не встретилась')
END.
