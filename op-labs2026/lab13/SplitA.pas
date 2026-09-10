PROGRAM SplitA(INPUT, OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные элементы}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;

{PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);}
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    IF NOT EOLN(F1)
    THEN
      BEGIN
        READ(F1, Ch);
        WRITE(OUTPUT, Ch)
      END
    ELSE
      READLN(F1)
END;

BEGIN
  {Разделяет INPUT в Odds и Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch); {Прочитать Ch, записать в файл, выбранный через Next,переключить Next}
          WRITE(Odds, Ch)
        END;
      READLN;
      WRITELN(Odds);
      WRITELN(Evens)
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  CopyOut(Odds, Ch);
  CopyOut(Evens, Ch);
  WRITELN
END.

