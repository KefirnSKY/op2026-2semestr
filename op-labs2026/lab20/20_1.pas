PROGRAM Pseudographics(INPUT, OUTPUT);
CONST
  Size = 5;
  MinMatrix = 1;
  MaxMatrix = Size * Size;
  CharSet = ['B', 'O', 'L'];
  FillSymbol = '#';
  EmptySymbol = ' ';
  
TYPE
  MatrixType = SET OF MinMatrix .. MaxMatrix;
  
VAR 
  Ch: CHAR;
  Letter: MatrixType;
  
FUNCTION ReadMatrix(VAR FIn: TEXT; VAR Letter: CHAR): BOOLEAN;
BEGIN {ReadMatrix}
  ReadMatrix := FALSE;
  IF NOT EOLN(FIn)
  THEN 
    BEGIN
      READ(Letter);
      IF Letter IN CharSet
      THEN 
        ReadMatrix := TRUE
    END
END; {ReadMatrix}

FUNCTION GetMatrix(Ch: CHAR): MatrixType;
BEGIN {GetMatrix}
  GetMatrix := [];
  IF Ch IN CharSet
  THEN
    CASE Ch OF
      'B': GetMatrix := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
      'O': GetMatrix := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
      'L': GetMatrix := [1, 6, 11, 16, 21, 22, 23, 24, 25]
    END
END; {GetMatrix}

PROCEDURE WriteMatrix(VAR FOut: TEXT; Matrix: MatrixType);
VAR
  I: INTEGER;
BEGIN {WriteMatrix}
  FOR I := 1 TO MaxMatrix
  DO
    BEGIN
      IF (I IN Matrix)
      THEN
        WRITE(FOut, FillSymbol)
      ELSE
        WRITE(FOut, EmptySymbol);
      IF (I MOD Size = 0)
      THEN
        WRITELN(FOut)
    END
END; {WriteMatrix}

BEGIN {Pseudographics}
  IF ReadMatrix(INPUT, Ch)
  THEN 
    WriteMatrix(OUTPUT, GetMatrix(Ch))
  ELSE
    WRITELN('Data error')
END. {Pseudographics}
