PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Size = 5;
  MaxMatrix = Size * Size;
  MinSymbol = 1;
  MaxSymbol = 10;
  CharSet = ['P', 'A', 'B', 'L', 'O'];
  FillSymbol = '#';
  EmptySymbol = ' ';
   
TYPE
  MatrixType = SET OF 1 .. MaxMatrix;
  ArrType = ARRAY [MinSymbol .. MaxSymbol] OF CHAR; 
  
VAR 
  I, CharQuantity: INTEGER;
  Arr: ArrType;
  
PROCEDURE Init;
BEGIN {Init}
  I := 0;
  CharQuantity := 0
END; {Init}
  
FUNCTION ArrOfChar(VAR FIn: TEXT; VAR CharQuantity: INTEGER): ArrType;
VAR
  I: INTEGER;
  Arr: ArrType;
BEGIN {ReadMatrix}
  FOR I := MinSymbol TO MaxSymbol
  DO 
    BEGIN
      Arr[I] := '#';
      IF NOT EOLN(FIn)
      THEN
        BEGIN
          READ(FIn, Arr[I]);
          CharQuantity := CharQuantity + 1
        END
    END;
  ArrOfChar := Arr
END; {ReadMatrix}

FUNCTION GetMatrix(Ch: CHAR): MatrixType;
BEGIN {GetMatrix}
  GetMatrix := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
  IF (Ch IN CharSet)  
  THEN
    CASE Ch OF
      'B': GetMatrix := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
      'O': GetMatrix := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
      'L': GetMatrix := [1, 6, 11, 16, 21, 22, 23, 24, 25];
      'P': GetMatrix := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
      'A': GetMatrix := [2, 3, 4, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25]
    END
END; {GetMatrix}

PROCEDURE WriteString(VAR FOut: TEXT; Arr: ArrType; Line: INTEGER; CharQuantity: INTEGER);
VAR
  I, J: INTEGER;
BEGIN {Writestring}
  FOR I := MinSymbol TO CharQuantity
  DO
    BEGIN
      FOR J := 1 TO Size
      DO
        IF (Size * (Line - 1) + J) IN GetMatrix(Arr[I])
        THEN
          WRITE(FOut, FillSymbol)
        ELSE
          WRITE(FOut, EmptySymbol);
      WRITE(FOut, ' ')
    END    
END; {WriteString} 
 
BEGIN {XPrint}
  Init;
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      Arr := ArrOfChar(INPUT, CharQuantity); 
      FOR I := 1 TO Size
      DO
        BEGIN
          WriteString(OUTPUT, Arr, I, CharQuantity);
          WRITELN(OUTPUT)
        END 
    END
  ELSE
    WRITELN('Data didn`t enter')
END. {XPrint}
