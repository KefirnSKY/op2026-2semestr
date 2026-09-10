PROGRAM RunBubbleSortC(INPUT, OUTPUT);
VAR
  Sorted: CHAR;
  F1, F2: TEXT; 
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Temp: CHAR;
BEGIN 
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Temp);
      WRITE(OutFile, Temp)
    END;
  WRITELN(OutFile)
END;

PROCEDURE CopyAndSwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);{ Копируем F1 в F2, проверяя отсортированность и переставляя первые соседние символы по порядку}
VAR 
  Ch1, Ch2: CHAR;
BEGIN  
  IF NOT EOF(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO { По крайней мере два символа остается для Ch1, Ch2 }
        BEGIN
          READ(F1, Ch2);
          { Выводим   min(Ch1, Ch2) в  F2, записывая отсортированные символы }
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2
            END
        ELSE
          BEGIN
            WRITE(F2, Ch2);
            Sorted := 'N'
          END
        END  
    END;
  WRITELN(F2, Ch1) { Выводим последний символ в F2 }      
END;

PROCEDURE BubbleSort(VAR InFile, OutFile: TEXT);
BEGIN
  { Копируем INPUT в F1 }
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { Копируем F1 в F2,проверяя отсортированность и переставляя первые соседние символы по порядку }
      RESET(F1);
      REWRITE(F2);
      Sorted := 'Y';
      CopyAndSwap(F1, F2, Sorted);
      { Копируем F2 в F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1)
    END;
  { Копируем F1 в OUTPUT }
  RESET(F1);
  REWRITE(OUTPUT);
  CopyFile(F1, OUTPUT) 
END;

BEGIN { BubbleSort }
  BubbleSort(INPUT, OUTPUT)
END. { BubbleSort }
