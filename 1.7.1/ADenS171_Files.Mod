MODULE Files;
  CONST MaxLength = 4096;

  TYPE File = POINTER TO RECORD
      len: INTEGER;
      a: ARRAY MaxLength OF CHAR
  END;

  Rider= RECORD (* 0 <= pos <= f.len <= Max Length *)
      f: File; pos: INTEGER; eof: BOOLEAN
  END;

  PROCEDURE New(name: ARRAY OF CHAR): File;
   VAR f: File;
  BEGIN NEW(f); f.len := 0; f.eof := FALSE; (*directory operation omitted*)
    RETURN f;
  END New;

  PROCEDURE Old(name: ARRAY OF CHAR): File;
    VAR f: File;
  BEGIN NEW(f); f.eof := FALSE; (*directory lookup omitted*)
    RETURN f
  END Old;

  PROCEDURE Close(VAR f: File);
  BEGIN
  END Close;

  PROCEDURE Set(VAR r: Rider; f: File; pos: INTEGER);
  BEGIN (*assume f # NIL*) r.f := f; r.eof := FALSE;
    IF pos >= 0 THEN
      IF pos <= f.len THEN r.pos := pos ELSE r.pos := f.len END
    ELSE
      r.pos := 0
    END
  END Set;

  PROCEDURE Write(VAR r: Rider; ch: CHAR);
  BEGIN
    IF (r.pos <= r.f.len) & (r.pos < MaxLength) THEN
      r.f.a[r.pos] := ch; INC(r.pos);
      IF r.pos > r.f.len THEN INC(r.f.len) END
    ELSE
      r.eof := TRUE
    END
  END Write;

  PROCEDURE Read(VAR r: Rider; VAR ch: CHAR);
  BEGIN
    IF r.pos < r.f.len THEN
      ch := r.f.a[r.pos]; INC(r.pos)
    ELSE
      r.eof := TRUE
    END
  END Read;

  PROCEDURE WriteInt(VAR r: Rider; n: INTEGER);
  BEGIN (*implementation is platform dependent*)
  END WriteInt;

  PROCEDURE ReadInt(VAR r: Rider; VAR n: INTEGER);
  BEGIN (*implementation is platform dependent*)
  END ReadInt;

END Files.
