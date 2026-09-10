PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
 
PROCEDURE Initialize;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE
END;

PROCEDURE MoveWindow;
BEGIN
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4);
  IF EOLN(INPUT)
  THEN 
    Looking := FALSE
END;

PROCEDURE CheckLand;
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END;

PROCEDURE CheckSea;
BEGIN
  Sea := (W1 = 's') AND (W2 = 'e') AND (W3 = 'a')
END; 
 
PROCEDURE AnswerSarah;
BEGIN
  IF Land
  THEN 
    WRITELN('The British are coming by land.')
  ELSE
    IF Sea
    THEN
      WRITELN('The British coming by sea.')
    ELSE 
      WRITELN('Sarah didn''t say.')
END; 
 
BEGIN {SarahRevere}   
  {Инициализация}
  Initialize;
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN
      {движение окна}
      MoveWindow;
      {проверка окна на land}
      CheckLand;
      {проверка окна на sea}                   
      CheckSea
    END;
  {создание сообщения Sarah}
  AnswerSarah
END.  {SarahRevere} 
 
