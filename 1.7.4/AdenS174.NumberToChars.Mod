MODULE NumberToChars;
IMPORT Out, In;
VAR i,x : INTEGER;
    d : ARRAY 1000 OF INTEGER;
BEGIN
i := 0;
Out.String("Enter number 1-100"); Out.Ln;
In.Int(x);
REPEAT d[i] := x MOD 10; x := x DIV 10; INC(i)
UNTIL x = 0;
REPEAT DEC(i); Out.String(CHR(d[i] + ORD("0")));
UNTIL i = 0;

END NumberToChars.
