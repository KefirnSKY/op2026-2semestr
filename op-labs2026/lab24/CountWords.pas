PROGRAM CountWord(INPUT, OUTPUT);

USES
  WordModule;
  
VAR
  InFile, OutFile: TEXT;
  
BEGIN
  ASSIGN(InFile, 'INPUT.TXT');
  ASSIGN(OutFile, 'OUTPUT.TXT');                                                                                                       
  
  RESET(InFile);
  REWRITE(OutFile);

  RunCountWord(InFile, OutFile);

  CLOSE(InFile);
  CLOSE(OutFile)                                                        
END.
