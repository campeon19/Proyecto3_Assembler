@ juego.s
@ ***************************************
@ USO:
@****************************************
@ AUTH: Christian Perez 19710
@ AUTH:	Javier Hernandez
@ AUTH:	Edman Cotta
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
	
	mov r8, #0			@PUNTUACION JUGADOR #1
	mov r9, #0			@PUNTUACION JUGADOR #2
	
randomNum:
		ldr r12,=cantPalabras
ldr r12,[r12] 
		bl random
		cmp r12, #0
		beq conjunt0
		cmp r12,#1
		beq conunto1
cmp r12, #2
		beq conjunto2
		cmp r12,#3
		beq conunto3
cmp r12, #4
		beq conjunto4
		cmp r12,#5
		beq conunto5
cmp r12, #6
		beq conjunto6
		cmp r12,#7
		beq conunto7
cmp r12, #8
		beq conjunto8
		cmp r12,#9
		beq conunto9
cmp r12, #10
		beq conjunto10
		
		b error
	
	conjunto1:
		
		ldr r0, =gato
		bl puts
		ldr r0, =perro
		bl puts
		ldr r0,=palDes0
		bl puts
		
		ldr r0,=
		ldr r1,=recibido
		bl scanf
		ldr r10,= palabra0
		b comparar

	conjunto2:

		ldr r0, =cama
		bl puts
		ldr r0, =leon
		bl puts
		ldr r0,=palDes1
		bl puts
		
		ldr r0,=
		ldr r1,=recibido
		bl scanf
		ldr r10,= palabra1
		b comparar

	conjunto3:
		ldr r0, =masculino
		bl puts
		ldr r0, =femenino
		bl puts
		ldr r0,=palDes2
		bl puts
		
		ldr r0,=
		ldr r1,=recibido
		bl scanf
		ldr r10,= palabra2
		b comparar

	comparar:
		



	b jugador

	jugador:
		cmp r5,#0
		beq puntuacion1
		b puntuacion2

	puntuacion1:

		cmp r7,#1
		addeq r8,r8,#1
		b ganador

	puntuacion2:
		cmp r7,#1
		addeq r9,r9,#1
		b ganador

	ganador:
		cmp r5,#0
		cmpeq r8, #3
		beq mensaje1

		cmp r5,#1
		cmpeq r9,#3
		beq mensaje2

		b random

	mensaje1:

		ldr r0,=ganador1
		bl puts
		b salir

	mensaje2:

		ldr r0,=ganador2
		bl puts
		b salir

	salir:
		
		mov r0, #0
		mov r3, #0
		
		ldmfd sp!,{lr}
		bx lr



.data
.align 2

@ VARIABLES

puntajeP1: 			.word 0
puntajeP2			.word 0
cantPalablas:			.word 11
recibido:			.asciz”                                                  ”

@ MENSAJES

titulo:				.asciz “****************1 Palabra 2 Imagenes****************”
bienvenida:			.asciz “Bienvenido!”
acierto:			.asciz “CORRECTO! Cargando nuevas imagenes…”
desacierto:			.asciz “INCORRECTO! Cargando nuevas imagenes…”
player1:			.asciz “>Player1- Adivine la palabra: “
player2:			.asciz “>Player2- Adivine la palabra: “
ganador:			.asciz “Has ganado!”

@ PALABRAS DESORDENADAS

palDes0:			.word “saotmasc”
palDes1:			.word “almeaocn”
palDes2:			.word “eeonrg”
palDes3:			.word “ponsmsi”
palDes4:
palDes5:
palDes6:
palDes7:
palDes8:
palDes9:
palDes10:

@ PALABRAS ORDENADAS ARREY DE CHARS

palabra0:			.byte ‘m’,’a’,’s’,’c’,’o’,’t’,’a’,’s’
palabra1:			.byte ‘c’,’a’,’m’,’a’,’l’,’e’,’o’,’n’
palabra2:			.byte ‘g’,’e’,’n’,’e’,’r’,’o’
palabra3:			.byte ‘s’,’i’,’m’,’p’,’s’,’o’,’n
palabra4:			.byte ‘c’,’o’,’r’,’o’,’n’,’a’,’v’,’i’,’r’,’u’,’s’
palabra5:			.byte ‘p’,’e’,’a’,’n’,’u’,’t’,’s’
palabra6:			.byte ‘f’,’r’,’u’,’t’,’a’,’s’
palabra7:			.byte ‘b’,’a’,’r’
palabra8:			.byte ‘n’,’a’,’v’,’i’,’d’,’a’,’d’
palabra9:			.byte ‘g’,’r’,’a’,’d’,’u’,’a’,’c’,’i’,’o’,’n’
palabra10:			.byte ‘h’,’a’,’l’,’l’,’o’,’w’,’e’,’e’,’n’



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
bart:				.asciz “ |\/\/\/|
\n |      |
\n |      |
\n | (o)(o)
\n C      _)
\n  | ,___|
\n  |   /
\n /____\
\n/      \\n”
lisa:				.asciz “/\ /\  /\
\n| V  \/  \---.
\n \_        /
\n  (o)(o)  <__.
\n _C         /
\n/____,   )  \
\n  \     /----’
\n   ooooo
\n  /     \\n”
corona:			.asciz “  +
\nqoOop
\n(===)
\n’’’’’”
virus:				.asciz “  ,-^-.
\n  |\/\|
\n  `-V-’
\n    H
\n .-;”:-.
\n,’|  `; \”
yellowBird:			.asciz “  \,`/ /
\n _)..  `_
\n( __  -\
\n    ‘`.
\n   ( \>_-_,
\n   _||_~-/”
snoopy:			.asciz “  ,-~~-.___.
\n / |  ‘     \
\n(  )         0
\n \_/-, ,....’
\n    ====”
manzana:			.asciz “  ,--./,-.
\n / #      \
\n|          |
\n \        /
\n  `._,._,’”
bananas:			.asciz “   _
\n _ \’-_,#
\n_\’--’,’`|
\n\`---`  /
\n `----’`”
vino:				.asciz “ _____
\n/.---.\
\n|`````|
\n\     /
\n `-.-’
\n   |
\n __|__”
cerveza:			.asciz “.~~~~.
\ni====i_
\n|cccc|_)
\n|cccc|
\n`-==-’”
mania:				.asciz “ ,+.
\n((|))
\n )|(
\n((|))
\n `-’”
almendra:			.asciz “ ,+.
\n//|\\
\n|||||
\n\\|//
\n `+’”
pino:				.asciz “    \|/
\n   --0--
\n    /|\
\n   //|\\
\n  ///|\\\
\n ////|\\\\
\n/////|\\\\\
\n0 0 ||| 0 0
\n  __|||__”
jengibre:			.asciz “   ,-.
\n _(*_*)_
\n(_  o  _)
\n  / o \
\n (_/ \_)”
birrete:				.asciz “  ,-‘’-.
\n,‘  .----.
\n`.     ,’ )
\n |`-.-’| #
\n  `---’”
diploma:			.asciz “ _________
\n(@)__))___)
\n     \\
\n      ^”
luna:				.asciz “  ((((
\n (((
\n(((
\n(((
\n (((
\n  ((((“
calabaza:			.asciz “      \\
\n .-’```^```’-.
\n/   /\ __ /\  \
\n|   ^^ \/ ^^  |
\n\   \_.__._/  /
\n `’-.......-’`”
