**************************************
*
* Name: Chloe Jones
* ID:14308510
* Date: 10/2/2020
* Lab2
*
* Program description: This program calculates 2 byte nth number of the Fibonacci sequence
*
* Pseudocode:
* unsigned int N, COUNT, RESULT;
* unsigned int F1 = F2 = 1;
* 
* COUNT = 2;
* RESULT = 0;
* if(N == 0) RESULT = 0;
* else-if(N==1) RESULT = 1;
* else-if(N==2) RESULT = 1;
* else{
*   while(COUNT < N){
*       RESULT = F1 + F2;
*	F2 = F1;
*       F1 = RESULT;
*       COUNT += 1;
*   }
* }
*
**************************************

* start of data section
	ORG $B000
N	FCB 10

	ORG $B010
RESULT	RMB 2
* define any other variables that you might need here
F1	RMB	2
F2	RMB	2
COUNT	RMB	1

	ORG	$C000
* start of your program
	LDD	#1
	STD	F1	F1 = 1;
	STD	F2	F2 = 1;
	LDAA	#2
	STAA	COUNT	COUNT = 2;
	CLR	RESULT
	CLR	RESULT +1	RESULT = 0;

IF	LDAA	N
	CMPA	#0	If(N==0)
	BNE	ENDIF
THEN	LDD	#0
	STD	RESULT	RESULT = 0;
ENDIF
ELIF	CMPA	#1	ELIF(N==1)
	BNE	ENDELIF	
THEN2	LDD	#1
	STD	RESULT	RESULT = 1;
ENDELIF
ELIF2	CMPA	#2	If(N==2)
	BNE	ENDELIF2
THEN3	LDD	#1
	STD	RESULT	RESULT = 1;
ENDELIF2
WHILE	LDAA	COUNT
	CMPA	N	while(COUNT < N)
	BHS	ENDWHILE
	LDD	F1	
	ADDD	F2
	STD	RESULT	RESULT = F1 + F2;
	LDD	F1	
	STD	F2
	LDD	RESULT	F2 = F1;
	STD	F1	F1 = RESULT;
	INC	COUNT	COUNT++;
	BRA	WHILE
ENDWHILE
DONE	BRA	DONE