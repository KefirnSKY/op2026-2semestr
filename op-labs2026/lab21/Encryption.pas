PROGRAM Encryption(INPUT, OUTPUT); {Переводит символы из INPUT в код согласно Chiper и печатает новые символы в OUTPUT}
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
             
PROCEDURE Encode(VAR S: Str; Lengh: Size);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Lengh
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg, I)
    END
END.  {Encryption}
