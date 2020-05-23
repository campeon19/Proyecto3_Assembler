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
	
	mov r11, #0 @Puntaje
	mov r10, #0 @Interador
	
	menu:
		cmp r10, #0
		beq conjunto0
		cmp r10, #1
		beq conjunto1
		cmp r10, #2
		beq conjunto2
		cmp r10, #3
		beq conjunto3
		cmp r10, #4
		beq conjunto4
		cmp r10, #5
		beq conjunto5
		cmp r10, #6
		beq conjunto6
		
		mov r10, #0
		
		b menu
		
	
	conjunto0:
		
		add r10, r10, #1
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
	
		add r10, r10, #1
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
	
		add r10, r10, #1
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
	
		add r10, r10, #1
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
	
		add r10, r10, #1
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
		add r10, r10, #1
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
		add r10, r10, #1
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

	
	
	lectura:
		mov r7, #3
		mov r0, #0
		mov r2, #30
		ldr r1, =recibido
		swi 0
		
		ldr r6,=recibido
		
		b comparar
	
	comparar:
		
		ldrb r7, [r4], #4
		ldrb r8, [r6], #4
		
		subeq r5, r5, #1
		
		cmp r5, #0
		beq acertado
		
		cmp r7,r8
		beq comparar
		bne fallo
	
	acertado:
		ldr r0,=acierto
		bl puts
		add r11, r11, #1
		cmp r11, #3
		beq salir
		b menu
		
	fallo:
		ldr r0,=desacierto
		bl puts
		b menu
		
	salir:
		ldr r0,=ganador
		bl puts
		
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
recibido:			.asciz "                               "

@ MENSAJES

titulo:				.asciz "****************1 Palabra 2 Imagenes****************"
bienvenida:			.asciz "Bienvenido!"
instruccion:		.asciz "Con ayuda de las imagenes, ordena la siguiente palabra:\n"
acierto:			.asciz "CORRECTO! Cargando nuevas imagenes…"
desacierto:			.asciz "INCORRECTO! Cargando nuevas imagenes…"
player1:			.asciz ">Player1- Adivine la palabra: "
player2:			.asciz ">Player2- Adivine la palabra: "
ganador:			.asciz "Has ganado!"

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

@ PALABRAS ORDENADAS

palabra0:			.asciz "mascotas"
palabra1:			.asciz "camaleon"
palabra2:			.asciz "genero"
palabra3:			.asciz "simpson"
palabra4:			.asciz "coronavirus"
palabra5:			.asciz "peanuts"
palabra6:			.asciz "frutas"
palabra7:			.asciz "bar"
palabra8:			.asciz "navidad"
palabra9:			.asciz "graduacion"
palabra10:			.asciz "halloween"

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



@ IMAGENES
cama:				.asciz "     ()___\n  ()//__/)_________________()\n   ||(___)//#/_/#/_/#/_/#()/||\n||----|#| |#|_|#|_|#|_|| ||\n   ||____|_|#|_|#|_|#|_|#||/||\njgs ||    |#|_|#|_|#|_|#|_|| "

leon:				.asciz "     / ;;:;; \\n   (:;/\,-,/\;;)\n   (:;{  d b  }:;)\n (:;\__Y__/;;)-----------,,_\n    ,..\  ,..\      ___/___)__`\\nldb (,,,)~(,,,)`-._##____________) "

gato:				.asciz "|\---/|\n| o_o |\n \_^_/\n"
perro:				.asciz "     __\n(___() ‘`;\n/,     /`\n\\´´--\\\n"
masculino:			.asciz "  _\n _/`\n(_)\n"
femenino:			.asciz " _\n(_)\n +\n"
bart:				.asciz " |\/\/\/|\n |      |\n |      |\n | (o)(o)\n\n  | ,___|\n\n /____\\n/      \\n"
lisa:				.asciz "/\ /\  /\\n| V  \/  \---.\n \_        /\n  (o)(o)  <__.\n _C         /\n/____,   )  \\n\n   ooooo\n  /     \\n"
corona:				.asciz "  +\nqoOop\n\n’’’’’"
virus:				.asciz "  ,-^-.\n  |\/\|\n\n    H\n\n,’|  `; \ "
yellowBird:			.asciz "  \,`/ /\n _)..  `_\n( __  -\\n    ‘`.\n   ( \>_-_,\n   _||_~-/ "
snoopy:				.asciz "  ,-~~-.___.\n / |  ‘     \\n(  )         0\n \_/-, ,....’\n    ==== "
manzana:			.asciz "  ,--./,-.\n / #      \\n\n \        /\n  `._,._,’ "
bananas:			.asciz "   _\n _ \’-_,#\n_\’--’,’`|\n\`---`  /\n `----’`"
vino:				.asciz " _____\n/.---.\\n|`````|\n\     /\n `-.-’\n   |\n __|__ "
cerveza:			.asciz ".~~~~.\ni====i_\n|cccc|_)\n|cccc|\n`-==-’"
mania:				.asciz " ,+.\n((|))\n )|(\n((|))\n `-’"
almendra:			.asciz " ,+.\n//|\\\n|||||\n\\|//\n `+’ "
pino:				.asciz "    \|/\n   --0--\n    /|\\n   //|\\\n  ///|\\\\n ////|\\\\\n/////|\\\\\\n0 0 ||| 0 0\n  __|||__ "
jengibre:			.asciz "   ,-.\n _(*_*)_\n\n  / o \\n (_/ \_)"
birrete:			.asciz "  ,-‘’-.\n,‘  .----.\n`.     ,’ )\n |`-.-’| #\n  `---’"
diploma:			.asciz " _________\n(@)__))___)\n     \\\n      ^"
luna:				.asciz "  ((((\n (((\n(((\n(((\n (((\n  (((("
calabaza:			.asciz "      \\\n .-’```^```’-.\n/   /\ __ /\  \\n|   ^^ \/ ^^  |\n\   \_.__._/  /\n `’-.......-’`"


