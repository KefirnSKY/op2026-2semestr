PROGRAM UseSeason(INPUT, OUTPUT);
USES DateIO;

VAR
  Mon1, Mon2: Month;
BEGIN
  ReadMonth(INPUT, Mon1);
  ReadMonth(INPUT, Mon2);
  IF (Mon1 = NoMonth) OR (Mon2 = NoMonth)
  THEN 
    WRITELN('¬ходные данные записаны неверно')
  ELSE
    IF Mon1 = Mon2
    THEN
      BEGIN
        WRITE('ќба мес€ца ');
        WriteMonth(OUTPUT, Mon1)
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, Mon1);
        IF Mon1 < Mon2
        THEN
          WRITE(' предшествует ')
        ELSE
          WRITE(' следствует ');
        WriteMonth(OUTPUT, Mon2)  
      END;
  WRITELN    
END.
