PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Ch: CHAR;
PROCEDURE ReadStudent();
VAR 
  Ch: CHAR;
BEGIN
  READ(Ch);
  WHILE Ch <> ' '
    DO
      BEGIN
        WRITE(Ch);
        READ(Ch)
      END;
  WRITE(' ') 
END;   
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN    
      TotalScore := 0;
      WhichScore := 1;
      ReadStudent();
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1      
    END;
  WRITELN;
  WRITELN('Class average:');
  ClassTotal := (ClassTotal * 10) DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 100, '.', (ClassTotal MOD 100) DIV 10, ClassTotal MOD 10:1)
END.  {AverageScore}

