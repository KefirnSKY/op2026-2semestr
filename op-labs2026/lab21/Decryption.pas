PROGRAM EncryptionPlus(INPUT, OUTPUT); {Переводит символы из INPUT в код согласно Chiper и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  Size = 0 .. len;
VAR
  Msg: Str;
  Code: Chiper;
  I: Size;
  FIn, FOut: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T'; {Здесь T}
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'R'; {Здесь T -> R}
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
END;  {Initialize}
             
PROCEDURE Decode(VAR S: Str; Lengh: Size);
VAR
  Index: 1 .. Len;
  Ch: CHAR;
BEGIN {Decode}
  FOR Index := 1 TO Lengh
  DO
    BEGIN
      Ch := S[Index];

      IF Ch IN ['A' .. 'Z']
      THEN
        WRITE(FOut, Code[Ch])
      ELSE
        IF Ch = '#'
        THEN
          WRITE(FOut, 'D')
        ELSE
          IF Ch = '!'
          THEN
            WRITE(FOut, 'L')
          ELSE
            IF Ch = '2'
            THEN
              WRITE(FOut, 'O')
            ELSE
              IF Ch = '$'
              THEN
                WRITE(FOut, 'Q')
              ELSE
                IF Ch = '*'
                THEN
                  WRITE(FOut, 'T')
                ELSE
                  WRITE(FOut, Ch)
    END;
  WRITELN(FOut)
END; {Decode}

PROCEDURE RunDecryption(VAR FInput: TEXT);
BEGIN
  RESET(FInput);
  REWRITE(FOut);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN(FInput) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(FInput, Msg[I]);
          WRITE(Msg[I])
        END;
      READLN(FInput);
      WRITELN;
      {распечатать кодированное сообщение}
      Decode(Msg, I)
    END
END;

PROCEDURE CopyOut(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      WHILE NOT EOLN(F)
      DO
        BEGIN 
          READ(F, Ch);
          WRITE(Ch)          
        END;
      READLN(F);   
      WRITELN  
    END
END;

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  ASSIGN(FIn, 'InputFile.TXT');
  RunDecryption(FIn);
  CopyOut(FOut)
END.  {Encryption}
