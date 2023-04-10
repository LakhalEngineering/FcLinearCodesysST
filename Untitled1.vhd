FUNCTION FcLinTraz : REAL
VAR_INPUT
	VALORE_IN : REAL;
	VALORE_IN_MIN: REAL;
	VALORE_IN_MAX: REAL;
	VALORE_OUT_MIN: REAL;
	VALORE_OUT_MAX: REAL;
END_VAR
VAR
	A : REAL;
	B : REAL;
	ERROR: BOOL:= FALSE; (*true if error*)
END_VAR
______________________________________________________

(* Check che  input valores e valide *)
IF VALORE_OUT_MIN >= VALORE_OUT_MAX THEN
	ERROR := TRUE;
END_IF;

(* Check valore per evitare divizione per zero *)
IF VALORE_IN_MIN >= VALORE_IN_MAX THEN
	ERROR := TRUE;
END_IF;

(* Check VALORE_IN e inside range *)
IF VALORE_IN < VALORE_IN_MIN OR VALORE_IN > VALORE_OUT_MAX THEN
	ERROR := TRUE;
END_IF;

(* Calc si non c'e error *)
IF ERROR = FALSE THEN
	A:= (VALORE_OUT_MAX-VALORE_OUT_MIN)/(VALORE_IN_MAX-VALORE_IN_MIN);
	B:= VALORE_OUT_MAX -(A*VALORE_IN_MAX);

	FcLinTraz := (A*VALORE_IN)+B;(*Return value*)
ELSE
	FcLinTraz := 0; (* return zero se input valore erroe *)
END_IF;
