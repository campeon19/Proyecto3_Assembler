@ juego.s
@ ***************************************
@ USO:
@****************************************
@ AUTH: Christian Pérez 19710
@ AUTH: Javier Hernández 19202
@ AUTH: Edman Cotta
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
	
	mov r11, #0 @Puntaje player1
	mov r9, #0	@Turno jugador
	mov r3, #0	@Puntaje player2
	mov r10, #0	
	turnos:
		add r9, r9, #1
		cmp r9, #1
		beq jugador1
		
		bne jugador2
	
	jugador1:
		ldr r0, = player1
		bl puts
		b menu
	
	jugador2:
		ldr r0, = player2
		bl puts
		b menu
	
	
	menu:
	
		mov r12, #10		@valor max del random
		bl RANDOM		@llamada a la subrutina random
		
		cmp r12, #0
		beq conjunto0
		cmp r12, #1
		beq conjunto1
		cmp r12, #2
		beq conjunto2
		cmp r12, #3
		beq conjunto3
		cmp r12, #4
		beq conjunto4
		cmp r12, #5
		beq conjunto5
		cmp r12, #6
		beq conjunto6
		cmp r12, #7
		beq conjunto7
		cmp r12, #8
		beq conjunto8
		cmp r12, #9
		beq conjunto9
		cmp r12, #10
		beq conjunto10
		cmp r12, #11
		beq conjunto11
		
		b menu
		
	
	conjunto0:
		
		ldr r0,=perro
		bl puts
		ldr r0,=gato
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes0
		bl puts
		
		ldr r4,= palabra0
		ldr r5,=largo0
		ldr r5,[r5]
		
		b lectura
		
	conjunto1:
	
		ldr r0,=cama
		bl puts
		ldr r0,=leon
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes1
		bl puts
		
		ldr r4,= palabra1
		ldr r5,=largo1
		ldr r5,[r5]
		
		b lectura
	
	conjunto2:
	
		ldr r0,=masculino
		bl puts
		ldr r0,=femenino
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes2
		bl puts
		
		ldr r4,= palabra2
		ldr r5,=largo2
		ldr r5,[r5]
		
		b lectura
	
	conjunto3:
	
		ldr r0,=bart
		bl puts
		ldr r0,=lisa
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes3
		bl puts
		
		ldr r4,= palabra3
		ldr r5,=largo3
		ldr r5,[r5]
		
		b lectura
		
	conjunto4:
	
		
		ldr r0,=corona
		bl puts
		ldr r0,=virus
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes4
		bl puts
		
		ldr r4,= palabra4
		ldr r5,=largo4
		ldr r5,[r5]
		
		b lectura
	
	conjunto5:
		
		ldr r0,=snoopy
		bl puts
		ldr r0,=yellowBird
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes5
		bl puts
		
		ldr r4,= palabra5
		ldr r5,=largo5
		ldr r5,[r5]
		
		b lectura
	
	conjunto6:
		
		ldr r0,=manzana
		bl puts
		ldr r0,=bananas
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes6
		bl puts
		
		ldr r4,= palabra6
		ldr r5,=largo6
		ldr r5,[r5]
		
		b lectura
	
	conjunto7:
		
		ldr r0,=vino
		bl puts
		ldr r0,=cerveza
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes7
		bl puts
		
		ldr r4,= palabra7
		ldr r5,=largo7
		ldr r5,[r5]
		
		b lectura
	
	conjunto8:
		
		ldr r0,=pino
		bl puts
		ldr r0,=jengibre
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes8
		bl puts
		
		ldr r4,= palabra8
		ldr r5,=largo8
		ldr r5,[r5]
		
		b lectura
	
	conjunto9:
		
		ldr r0,=birrete
		bl puts
		ldr r0,=diploma
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes9
		bl puts
		
		ldr r4,= palabra9
		ldr r5,=largo9
		ldr r5,[r5]
		
		b lectura
	
	conjunto10:
		
		ldr r0,=luna
		bl puts
		ldr r0,=calabaza
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes10
		bl puts
		
		ldr r4,= palabra10
		ldr r5,=largo10
		ldr r5,[r5]
		
		b lectura
	
	conjunto11:
		
		ldr r0,=mania
		bl puts
		ldr r0,=almendra
		bl puts
		ldr r0,=instruccion
		bl puts
		ldr r0,=palDes11
		bl puts
		
		ldr r4,= palabra11
		ldr r5,=largo11
		ldr r5,[r5]
		
		b lectura
	
	
	lectura:
		mov r7, #3
		mov r0, #0
		mov r2, #30
		ldr r1, =recibido
		swi 0
		
		ldr r6,=recibido
		
		b comparar
	
	comparar:

		ldrb r7, [r4], #1
		ldrb r8, [r6], #1
		
		sub r5, r5, #1

		cmp r5, #0
		beq acertado
		
		cmp r7,r8
		beq comparar
		bne fallo
	
	acertado:
		ldr r0,=acierto
		bl puts
		cmp r9, #1
		beq guardarpuntaje1
		cmp r9, #2
		mov r9, #0
		beq guardarpuntaje2
		b guardarpuntaje2

		
	guardarpuntaje1:
		add r10, r10, #1
		ldr r0,=puntajeP1
		str r10,[r0]
		cmp r10, #3
		beq ganador1
		b turnos
		
	guardarpuntaje2:
		add r11, r11, #1
		ldr r0,=puntajeP2
		str r11,[r0]
		cmp r11, #3
		beq ganador2
		b turnos
		
	fallo:
		ldr r0,=desacierto
		bl puts
		cmp r9, #2
		moveq r9,#0
		b turnos
	
	ganador1:
		ldr r0,=ganadorP1
		bl puts
		b salir
	
	ganador2:
		ldr r0,=ganadorP2
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
puntajeP2:			.word 0
cantPalablas:		.word 11
recibido:			.string "                               "

@ MENSAJES

titulo:				.asciz "****************1 Palabra 2 Imagenes****************"
bienvenida:			.asciz "Bienvenido!"
instruccion:		.asciz "Con ayuda de las imagenes, ordena la siguiente palabra:\n"
acierto:			.asciz "CORRECTO! Cargando nuevas imagenes…"
desacierto:			.asciz "INCORRECTO! Cargando nuevas imagenes…"
player1:			.asciz ">Player1- Adivine la palabra: "
player2:			.asciz ">Player2- Adivine la palabra: "
ganadorP1:			.asciz "Jugador1, has ganado!"
ganadorP2:			.asciz "Jugador2, has ganado!"

@ PALABRAS DESORDENADAS

palDes0:			.asciz "saotmasc"
palDes1:			.asciz "almeaocn"
palDes2:			.asciz "eeonrg"
palDes3:			.asciz "ponsmsi"
palDes4:			.asciz "vciorrounsa"
palDes5:			.asciz "tspunea"
palDes6:			.asciz "trsafu"
palDes7:			.asciz "arb"
palDes8:			.asciz "divdana"
palDes9:			.asciz "uoincgraad"
palDes10:			.asciz "lowelenah"
palDes11:			.asciz "ilsalesm"

@ PALABRAS ORDENADAS

palabra0:			.string "mascotas"
palabra1:			.string "camaleon"
palabra2:			.string "genero"
palabra3:			.string "simpson"
palabra4:			.string "coronavirus"
palabra5:			.string "peanuts"
palabra6:			.string "frutas"
palabra7:			.string "bar"
palabra8:			.string "navidad"
palabra9:			.string "graduacion"
palabra10:			.string "halloween"
palabra11:			.string "semillas"

@ LARGO PALABRAS
largo0:				.word 8
largo1:				.word 8
largo2:				.word 6
largo3:				.word 7
largo4:				.word 11
largo5:				.word 7
largo6:				.word 6
largo7:				.word 3
largo8:				.word 7
largo9:				.word 10
largo10:			.word 9
largo11:			.word 8


@ IMAGENES
cama:				.asciz "      ()___ \n    ()//__/)_________________()\n    ||(___)//#/_/#/_/#/_/#()/||\n    ||----|#| |#|_|#|_|#|_|| ||\n    ||____|_|#|_|#|_|#|_|#||/||\njgs ||    |#|_|#|_|#|_|#|_||\n\n"

leon:				.asciz "      /'';;:;;''\\ \n    (:;/\,-,/\;;)\n   (:;{  d b  }:;)\n    (:;\__Y__/;;)-----------,,_\n     ,..\  ,..\      ___/___)__`\\ \nldb (,,,)~(,,,)`-._##____________)\n\n"

gato:				.asciz "|\\---/|\n| o_o |\n \\_^_/\n"
perro:				.asciz "     __\n(___() ‘`;\n/,     /`\n\\\´´--\\\\n"
masculino:			.asciz "  _\n _/`\n(_)\n"
femenino:			.asciz " _\n(_)\n +\n"
bart:				.asciz " |\\/\\/\\/|\n |      |\n |      |\n | (o)(o)\n\n C      _)\n  | ,___|\n  |   /\n /____\\n /      \\n"
lisa:				.asciz "/\\ /\\  /\\\n | V  \\/  \\---.\n \\_        /\n  (o)(o)  <__.\n _C         /\n/____,   )  \\n   ooooo\n  /     \\n "
corona:				.asciz "  +\nqoOop\n’’’’’\n"
virus:				.asciz "  ,-^-.\n  |\\/\\|\n    H\n,’|  `; \\ \n"
yellowBird:			.asciz "  \\,`/ /\n _)..  `_\n( __  -\\\n    ‘`.\n   ( \\>_-_,\n   _||_~-/ \n"
snoopy:				.asciz "  ,-~~-.___.\n / |  ‘     \\n (  )         0\n \\_/-, ,....’\n    ==== \n"
manzana:			.asciz "  ,--./,-.\n / #      \\\n \\        /\n  `._,._,’ \n"
bananas:			.asciz "   _\n _ \\’-_,#\n_\\’--’,’`|\n\\`---`  /\n `----’`\n"
vino:				.asciz " _____\n/.---.\\\n|`````|\n\\     /\n `-.-’\n   |\n __|__ \n"
cerveza:			.asciz ".~~~~.\ni====i_\n|cccc|_)\n|cccc|\n`-==-’\n"
mania:				.asciz " ,+.\n((|))\n )|(\n((|))\n `-’\n"
almendra:			.asciz " ,+.\n//|\\\n|||||\n\\|//\n `+’ \n"
pino:				.asciz "    \\|/\n   --0--\n    /|\\\n   //|\\\\\n  ///|\\\\\\n ////|\\\\\\\\\n/////|\\\\\\\\\\\n0 0 ||| 0 0\n  __|||__ \n"
jengibre:			.asciz "   ,-.\n _(*_*)_\n(_  o  _)\n  / o \\\n (_/ \_)\n"
birrete:			.asciz "  ,-‘’-.\n,‘  .----.\n`.     ,’ )\n |`-.-’| #\n  `---’\n"
diploma:			.asciz " _________\n(@)__))___)\n     \\\\\n      ^\n"
luna:				.asciz "  ((((\n (((\n(((\n(((\n (((\n  ((((\n"
calabaza:			.asciz "      \\\\\n .-’```^```’-.\n/   /\\ __ /\\  \\\n|   ^^ \\/ ^^  |\n\\   \\_.__._/  /\n `’-.......-’`"


