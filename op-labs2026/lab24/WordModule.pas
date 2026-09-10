UNIT WordModule;

INTERFACE

USES
  TreeModule;

PROCEDURE RunCountWord(VAR InFile, OutFile: TEXT); {процедура считывает текст, подсчитывает слова с контролем переполнения и выводит результат}

IMPLEMENTATION        

CONST
  MaxWordNum = 300000;
  
VAR
  SkipLine: INTEGER;
  NotSkipSymbol: STRING;
  
PROCEDURE InitNotSkipSymbol; {процедура инициализирует непропускаемые символы}
BEGIN {InitNotSkipSymbol}
  NotSkipSymbol := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  SkipLine := LENGTH(NotSkipSymbol)
END; {InitNotSkipSymbol}

FUNCTION IsSkipSymbol(Ch: CHAR): BOOLEAN; {процедура проверяет является ли символ пропускаемым}
VAR
  Index: INTEGER;
  Found: BOOLEAN;
BEGIN {IsSkipSymbol}
  Found := TRUE;
  Index := 1;
  WHILE (Index <= SkipLine) AND Found
  DO
    BEGIN
      IF Ch = NotSkipSymbol[Index]
      THEN
        Found := FALSE;
      Index := Index + 1
    END;
  IsSkipSymbol := Found
END; {IsSkipSymbol}

FUNCTION ChangeCaseToLower(Ch: CHAR): CHAR; {процедура переводит символы в нижний регистр}
CONST
  UpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  LowerCase = 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
VAR
  FoundCh: BOOLEAN;
  Index: INTEGER;
BEGIN {ChangeCaseToLower}
  FoundCh := FALSE;
  Index := 1;
  ChangeCaseToLower := Ch;
  WHILE (Index <= LENGTH(UpperCase)) AND (NOT FoundCh)
  DO
    BEGIN
      IF Ch = UpperCase[Index]
      THEN
        BEGIN
          ChangeCaseToLower := LowerCase[Index];
          FoundCh := TRUE
        END;
      IF Ch = LowerCase[Index]
      THEN
        FoundCh := TRUE;
      Index := Index + 1
    END
END; {ChangeCaseToLower} 

PROCEDURE ReadWord(VAR F: TEXT; VAR Word: STRING); {процедура определяет слово}
VAR
  Ch, LastCh: CHAR;
BEGIN {ReadWord}
  Word := '';
  WHILE (NOT EOLN(F)) AND (Word = '')
  DO
    BEGIN
      READ(F, Ch);
      IF NOT IsSkipSymbol(Ch)
      THEN
        Word := Word + ChangeCaseToLower(Ch)
    END;
  WHILE (NOT EOLN(F)) AND (NOT IsSkipSymbol(Ch))
  DO
    BEGIN
      READ(F, Ch);
      IF NOT IsSkipSymbol(Ch)
      THEN
        Word := Word + ChangeCaseToLower(Ch)
      ELSE
        IF Ch = '-'
        THEN
          BEGIN
            LastCh := Ch;
            READ(F, Ch);
            IF NOT IsSkipSymbol(Ch)
            THEN
              Word := Word + LastCh + ChangeCaseToLower(Ch)
          END
    END
END; {ReadWord}

PROCEDURE RunCountWord(VAR InFile, OutFile: TEXT); {процедура собирает статистику по файлу}
VAR
  NumWords: INTEGER;
  Word: STRING;
  FlagOwerflow: BOOLEAN;
BEGIN {RunCountWord}
  NumWords := 0;
  FlagOwerflow := FALSE;
  WHILE NOT EOF(InFile) AND (NOT FlagOwerflow)
  DO
    BEGIN
      WHILE (NOT EOLN(InFile))
      DO
        BEGIN
          ReadWord(InFile, Word);
          IF Word <> ''
          THEN
            BEGIN
              IF NumWords >= MaxWordNum
              THEN
                FlagOwerflow := TRUE
              ELSE
                BEGIN
                  AddWord(Word);
                  NumWords := NumWords + 1
                END;
            END
        END;
      READLN(InFile)
    END;
  IF FlagOwerflow
  THEN
    WRITE(OutFile, 'Количество слов должно быть меньше 300 000 слов')
  ELSE
    BEGIN
      PrintWords(OutFile);
      WRITELN(OutFile, 'Количество слов: ', NumWords)
    END
END; {RunCountWord}

BEGIN 
  InitNotSkipSymbol
END.
