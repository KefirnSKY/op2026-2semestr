PROGRAM Stat(INPUT, OUTPUT);
CONST
  NoDigit = -1;
  OverFlow = -2;
  FirstZero = -3; 
VAR
  Number, Count, MinNum, MaxNum, Sum: INTEGER;
  Ch: CHAR;
  WrongFlag, OverFlowOnSum, SpecialFlag: BOOLEAN;

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER); 
{Считывает текущий символ из файл. Если он - цифра, возвращает его преобразуя в значение типа INTEGER. Если считанный символ не цифра возвращает -1}
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
  Digit: INTEGER;
  FlagBreak: BOOLEAN;
BEGIN
  ReadDigit(F, Digit);
  Num := Digit;
  FlagBreak := False;
  IF (Digit <> NoDigit) AND (Ch <> ' ')
  THEN
    IF Digit <> 0
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
    ELSE
      BEGIN
        ReadDigit(F, Digit);
        IF Digit <> NoDigit
        THEN
          Num := FirstZero
      END         
END;

PROCEDURE Init;
BEGIN
  Count := 0;
  MinNum := MAXINT;
  MaxNum := -MAXINT;
  Sum := 0;
  OverFlowOnSum := FALSE;
  WrongFlag := FALSE;
  SpecialFlag := FALSE
END;

PROCEDURE IfNumberCorrect(VAR Num: INTEGER);
BEGIN
  IF (Num <> NoDigit) AND (Num <> OverFlow) AND (Num <> FirstZero)
  THEN
    BEGIN
      Count := Count + 1;
      IF Num < MinNum
      THEN
        MinNum := Num;
      IF Num > MaxNum
      THEN
        MaxNum := Num;
      IF MAXINT - Sum >= Num
      THEN
        Sum := Sum + Num
      ELSE
        OverFlowOnSum := TRUE   
    END;
  IF (Num = OverFlow) OR (Num = FirstZero)
  THEN
    WrongFlag := TRUE
END;

    
PROCEDURE WriteData;
BEGIN
  WRITELN('Количество чисел: ', Count);
  WRITELN('Минимальное число: ', MinNum);
  WRITELN('Максимальное число: ', MaxNum);
  IF (NOT OverFlowOnSum) 
  THEN
    WRITELN('Среднее арифметическое: ', Sum DIV Count, '.', (Sum MOD Count) * 100 DIV Count DIV 10, (Sum MOD Count) * 100 DIV Count MOD 10)
  ELSE
    WRITELN('Невозможно высчитать среднее арифметическое значение!')
END;

PROCEDURE WriteOverFlowData;
BEGIN
  WRITELN('Ошибка при чтении числа!')
END;

PROCEDURE Empty;
BEGIN
  WRITELN('Количество чисел: ', Count);
  WRITELN('Невозможно получить минимальное число!');
  WRITELN('Невозможно получить максимальное число!');
  WRITELN('Невозможно высчитать среднее арифметическое значение!')
END; 

PROCEDURE IfSpecial;
BEGIN
  IF (Count = 0) AND EOLN
  THEN
    SpecialFlag := TRUE
  ELSE 
    SpecialFlag := FALSE
END;   
  
BEGIN
  Init;
  IF NOT EOLN
  THEN
    BEGIN
      WHILE (NOT EOLN) AND (NOT WrongFlag)
      DO
        BEGIN 
          ReadNumber(INPUT, Number);
          IfNumberCorrect(Number)
        END;
      IF NOT WrongFlag
      THEN
        BEGIN  
          IfSpecial;
          IF NOT SpecialFlag
          THEN  
            WriteData
          ELSE
            Empty
        END  
      ELSE 
        WriteOverFlowData       
    END    
  ELSE
    Empty  
END.
