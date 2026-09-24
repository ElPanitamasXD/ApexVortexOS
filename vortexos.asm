[org 0x7c00]

start:
    mov ah, 0x00
    mov al, 0x03
    int 0x10

terminal_init:
    mov ah, 0x06
    mov al, 0
    mov bh, 0x0B
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    xor dx, dx
    mov ah, 0x02
    xor bh, bh
    int 0x10

    mov ah, 0x09
    mov al, ' '
    mov bh, 0x0E ; Titulo Amarillo
    mov cx, 30
    int 0x10

    mov si, msg_term_head
    call print_string

prompt_loop:
    mov si, prompt_str
    call print_string
    
    ; --- PUNTO DE ENTRADA COMPARTIDO PARA EL TECLADO ---
_reset_and_read_buffer:
    mov di, cmd_buffer
.read_loop:
    mov ah, 0x00
    int 0x16
    cmp al, 13
    je .execute
    cmp al, 8
    je .backspace
    
    ; Limitar la escritura a 2 caracteres si estamos dentro del juego
    cmp byte [game_active], 1
    jne .skip_limit
    cmp di, cmd_buffer+2
    je .read_loop
.skip_limit:
    mov ah, 0x0e
    int 0x10
    stosb
    jmp .read_loop

.backspace:
    cmp di, cmd_buffer
    je .read_loop
    dec di
    mov ah, 0x0e
    mov al, 8
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 8
    int 0x10
    jmp .read_loop

.execute:
    mov al, 0
    stosb
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10

    ; Si el juego está activo, desviamos el ENTER hacia la evaluación matemática
    cmp byte [game_active], 1
    je do_game.game_eval

    mov si, cmd_buffer
    mov al, [si]
    cmp al, 'e' ; Detecta comando 'echo'
    je do_echo
    cmp al, 'h' ; Detecta comando 'help'
    je do_help
    cmp al, 'g' ; Detecta comando 'game'
    je do_game
    cmp al, 'r' ; Detecta comando 'rb'
    je do_reboot
    cmp al, 'c' ; Detecta comando 'cls'
    je near terminal_init

    mov si, msg_unknown
    call print_string
    jmp prompt_loop

do_help:
    mov si, msg_help
    call print_string
    jmp prompt_loop

do_echo: ; --- RUTA DE ECHO CORREGIDA ---
    mov si, cmd_buffer
    add si, 5 ; Salta "echo "
    call print_string
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

; =========================================================================
; JUEGO MATEMÁTICO ULTRA-COMPACTADO (REDUCCIÓN DEFINITIVA DE BYTES)
; =========================================================================
do_game:
    mov si, msg_game_start
    call print_string

    ; 1. Generar Num1 y Num2 (1-9) con el reloj
    mov ah, 0x00
    int 0x1A
    mov ax, dx
    xor dx, dx
    mov cx, 9
    div cx
    inc dl
    mov bl, dl      ; bl = Num1

    mov ax, bx
    add ax, dx
    xor dx, dx
    div cx
    inc dl
    mov bh, dl      ; bh = Num2

    ; 2. Decidir suma o resta usando el reloj
    mov ah, 0x00
    int 0x1A
    and dl, 1
    jz .do_sub

.do_add:
    mov cl, '+'
    mov al, bl
    add al, bh
    jmp .print_eq

.do_sub:
    mov cl, '-'
    mov al, bl
    cmp al, bh      ; Evitar negativos
    jae .calc_sub
    xchg al, bh
    mov bl, al
.calc_sub:
    sub al, bh

.print_eq:
    aam             ; ah = Decenas, al = Unidades
    add ax, 0x3030
    mov [game_target], ax ; Guardar resultado esperado en memoria estática

    ; Mostrar ecuación: Num1 [op] Num2 =
    mov ah, 0x0e
    mov al, bl
    add al, '0'
    int 0x10
    mov al, cl
    int 0x10
    mov al, bh
    add al, '0'
    int 0x10
    mov al, '='
    int 0x10

    ; Activar bandera de juego y saltar al lector de teclado principal
    mov byte [game_active], 1
    jmp _reset_and_read_buffer

.game_eval:
    mov byte [game_active], 0 ; Desactivar bandera inmediatamente
    mov cx, [game_target]     ; ch = Decena correcta, cl = Unidad correcta
    
    mov si, cmd_buffer
    lodsb                     ; al = Primer carácter escrito por el usuario
    mov dl, [si]              ; dl = Segundo carácter escrito (o 0)

    cmp dl, 0                 ; ¿El usuario escribió 2 dígitos?
    jne .eval_two

    cmp ch, '0'               ; Si se esperaba decena y metió solo 1, pierde
    jne .lose
    cmp al, cl
    je .win
    jmp .lose

.eval_two:
    cmp al, ch
    jne .lose
    cmp dl, cl
    je .win

.lose:
    mov ah, 0x0e
    mov al, 0x07    ; Sonido Beep
    int 0x10
    mov al, 'L'     ; Imprime L (Lose)
    int 0x10
    jmp .end_game

.win:
    mov ah, 0x0e
    mov al, 'W'     ; Imprime W (Win)
    int 0x10

.end_game:
    mov ah, 0x0e
    mov al, 13      ; Salto de línea limpio
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

do_reboot:
    db 0xea
    dw 0x0000
    dw 0xffff

print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0e
    int 0x10
    jmp print_string
.done:
    ret

; --- SECCIÓN DE VARIABLES Y TEXTO INTEGRADO ---
game_active    db 0
game_target    dw 0

msg_term_head  db 'VortexDOS', 13, 10, 'CMD "HELP"', 13, 10, 0
prompt_str     db 'vtx> ', 0
msg_unknown    db '?', 13, 10, 0
msg_help       db 'help,echo,game,cls,rb', 13, 10, 0
msg_game_start db 'M:', 0

cmd_buffer:
    times 510-($-$$) db 0
    dw 0xAA55
