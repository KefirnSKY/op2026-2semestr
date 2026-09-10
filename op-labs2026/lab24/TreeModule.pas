UNIT TreeModule;

INTERFACE

PROCEDURE AddWord(Str: STRING); {процедура добавляет слово в дерево или увеличивает счётчик его повторений}
PROCEDURE PrintWords(VAR OutFile: TEXT); {процедура выводит содержимое дерева в отсортированном порядке в выходной файл}

IMPLEMENTATION  
                             
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Word: STRING;
               Count: INTEGER;
               LLink, RLink: Tree
             END;

CONST
  LessWord = 1;
  LaregerWord = 2;
  EqualWord = 3;
             
VAR
  Root: Tree;

FUNCTION OrderCh(OCh: CHAR): INTEGER; {процедура выдает свой индекс определенному символу}
VAR
  StringCh: STRING;
  Index: INTEGER;
  BreakFlag: BOOLEAN;
BEGIN {OrderCh}
  Index := 1;
  BreakFlag := FALSE;   
  StringCh := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя-';
  WHILE (Index <= LENGTH(StringCh)) AND (NOT BreakFlag)
  DO
    BEGIN
      IF OCh = StringCh[Index]
      THEN
        BreakFlag := TRUE
      ELSE
        Index := Index + 1
    END;
  OrderCh := Index
END; {OrderCh}

FUNCTION CompareWords(S1, S2: STRING): INTEGER; {процедура определяет очередность слов}
VAR
  Index, MinLen: INTEGER;
  BreakFlag: BOOLEAN;
BEGIN {CompareWords}
  BreakFlag := FALSE;
  IF LENGTH(S1) < LENGTH(S2)
  THEN
    MinLen := LENGTH(S1)
  ELSE
    MinLen := LENGTH(S2);
  Index := 1;
  WHILE (Index <= MinLen) AND (NOT BreakFlag)
  DO
    BEGIN
      IF OrderCh(S1[Index]) < OrderCh(S2[Index])
      THEN
        BEGIN
          CompareWords := LessWord;
          BreakFlag := TRUE
        END;
      IF OrderCh(S1[Index]) > OrderCh(S2[Index])
      THEN
        BEGIN
          CompareWords := LaregerWord;
          BreakFlag := TRUE
        END;
      Index := Index + 1
    END;
  IF NOT BreakFlag
  THEN
    BEGIN
      IF LENGTH(S1) < LENGTH(S2)
      THEN
        CompareWords := LessWord
      ELSE
        IF LENGTH(S1) > LENGTH(S2)
        THEN
          CompareWords := LaregerWord
        ELSE
          CompareWords := EqualWord
    END
END; {CompareWords}

PROCEDURE InsertTree(VAR Ptr: Tree; Str: STRING); {процедура собирает дерево}
BEGIN {InsertTree}
  IF Ptr = NIL 
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Word := Str;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    CASE CompareWords(Str, Ptr^.Word) OF
      LessWord: InsertTree(Ptr^.LLink, Str);
      LaregerWord: InsertTree(Ptr^.RLink, Str);
      EqualWord: Ptr^.Count := Ptr^.Count + 1
    END
END; {InsertTree}

PROCEDURE AddWord(Str: STRING); {процедура добавляет слово в дерево или увеличивает счётчик его повторений}
BEGIN {AddWord}
  InsertTree(Root, Str)                                                          
END; {AddWord}

PROCEDURE PrintTree(Ptr: Tree; VAR OutFile: TEXT); {процедура печатает дерево в файл OutFile}
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(Ptr^.LLink, OutFile);
      WRITELN(OutFile, Ptr^.Word, ' ', Ptr^.Count);
      PrintTree(Ptr^.RLink, OutFile)
    END
END; {PrintTree}

PROCEDURE PrintWords(VAR OutFile: TEXT); {процедура выводит содержимое дерева в отсортированном порядке в выходной файл}
BEGIN {PrintWords}
  PrintTree(Root, OutFile)
END; {PrintWords}

BEGIN
  Root := NIL
END.
