UNIT ComplitModule;

INTERFACE

USES
  WordModule;
  
PROCEDURE DoCountWord; {процедура открывает входной и выходной файлы, запускает подсчёт слов и закрывает файлы}

IMPLEMENTATION  

VAR
  InFile, OutFile: TEXT;
  
PROCEDURE DoCountWord;
BEGIN {DoCountWord}
  ASSIGN(InFile, 'INPUT.TXT');
  ASSIGN(OutFile, 'OUTPUT.TXT');

  RESET(InFile);
  REWRITE(OutFile);

  RunCountWord(InFile, OutFile);

  CLOSE(InFile);
  CLOSE(OutFile)
END; {DoCountWord}

BEGIN
END.
