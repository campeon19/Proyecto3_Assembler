@ juego.s
@ ***************************************
@ USO:
@****************************************
@ AUTH:
@ AUTH:
@ AUTH:
@****************************************

@INICIALIZACIÓN
.text
.align 2
.global main
.type main, %function

@CUERPO DEL PROGRAMA
main:
stmfd sp!, {lr}		@@ Punto de retorno LR = SP
	
	/* MENSAJE DE BIENVENIDA */
	ldr r0,=titulo
	bl puts
	ldr r0,=bienvenida
	bl puts








.data
.align 2

@ VARIABLES

@ MENSAJES

titulo:				.asciz “****************1 Palabra 2 Imagenes****************”
bienvenida:			.asciz “Bienvenido!”
acierto:			.asciz “CORRECTO! Cargando nuevas imagenes…”
desacierto:			.asciz “INCORRECTO! Cargando nuevas imagenes…”
player1:			.asciz “>Player1- Adivine la palabra: “
player2:			.asciz “>Player2- Adivine la palabra: “

@ IMAGENES
cama:				.asciz “     ()___
\n  ()//__/)_________________()\n   ||(___)//#/_/#/_/#/_/#()/||\n||----|#| |#|_|#|_|#|_|| ||
\n   ||____|_|#|_|#|_|#|_|#||/||\njgs ||    |#|_|#|_|#|_|#|_||
”
leon:				.asciz”     /";;:;;"\                    \n   (:;/\,-,/\;;)                  \n   (:;{  d b  }:;)                  \n (:;\__Y__/;;)-----------,,_
  \n    ,..\  ,..\      ___/___)__`\\nldb (,,,)~(,,,)`-._##____________)
”
gato:				.asciz “|\---/|
\n| o_o |
\n \_^_/\n”
perro:				.asciz “     __
\n(___() ‘`;
\n/,     /`
\n\\´´--\\\n”
masculino:			.asciz “  _
\n _/`
\n(_)\n”
femenino:			.asciz “ _
\n(_)
\n +\n”

