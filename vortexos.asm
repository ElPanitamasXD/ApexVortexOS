[org 0x7c00]
start:
    ; Configurar pantalla en modo de texto estándar 80x25
    mov ah, 0x00
    mov al, 0x03
    int 0x10
terminal_init:
    ; Limpiar pantalla: Fondo Negro Profundo, Letras Celeste/Cian Brillante (0x0B)
    mov ah, 0x06
    mov al, 0
    mov bh, 0x0B        
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10
    ; Forzar al cursor a volver a la esquina superior izquierda (0,0)
    xor dx, dx          
    mov ah, 0x02        
    xor bh, bh          
    int 0x10
    
    ; Pintar el titulo en Amarillo Cyberpunk (0x0E) usando truco de BIOS
    mov ah, 0x09
    mov al, '-'
    mov bh, 0x0E
    mov cx, 23
    int 0x10
    mov si, msg_term_head
    call print_string
prompt_loop:
    mov si, prompt_str
    call print_string
    mov di, cmd_buffer
.read_loop:
    mov ah, 0x00
    int 0x16
    cmp al, 13          ; ENTER
    je .execute
    cmp al, 8           ; BACKSPACE
    je .backspace
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
    mov si, cmd_buffer
    mov di, cmd_ayuda
    call compare_string
    jc do_help
    mov si, cmd_buffer
    mov di, cmd_game
    call compare_string
    jc do_game
    mov si, cmd_buffer
    mov di, cmd_reboot
    call compare_string
    jc do_reboot
    mov si, cmd_buffer
    mov di, cmd_cls
    call compare_string
    jc near terminal_init
    mov si, msg_unknown
    call print_string
    jmp prompt_loop
do_help:
    mov si, msg_help
    call print_string
    jmp prompt_loop
do_game:
    mov si, msg_game_start
    call print_string
    mov ah, 0x00
    int 0x1A            ; Reloj BIOS
    rdtsc               ; Ciclos CPU
    add ax, dx
    xor dx, dx
    mov cx, 5
    div cx
    add dl, 4           ; Num 1 (4-8)
    mov bl, dl
    rdtsc
    xor dx, dx
    mov cx, 3
    div cx
    add dl, 1           ; Num 2 (1-3)
    mov cl, dl
    rdtsc
    and al, 1
    jz .is_sub
    mov ah, 0x0e        ; --- SUMA ---
    mov al, bl
    add al, '0'
    int 0x10
    mov al, '+'
    int 0x10
    mov al, cl
    add al, '0'
    int 0x10
    add bl, cl          ; BL = Resultado esperado
    jmp .ask
.is_sub:
    mov ah, 0x0e        ; --- RESTA ---
    mov al, bl
    add al, '0'
    int 0x10
    mov al, '-'
    int 0x10
    mov al, cl
    add al, '0'
    int 0x10
    sub bl, cl          ; BL = Resultado esperado
.ask:
    mov ah, 0x0e
    mov al, '='
    int 0x10
    mov ah, 0x00        ; Leer respuesta
    int 0x16
    mov ch, al
    mov ah, 0x0e
    int 0x10
.wait_enter:
    mov ah, 0x00        ; Esperar ENTER obligatorio
    int 0x16
    cmp al, 13
    jne .wait_enter
    add bl, '0'
    cmp ch, bl
    je .win
    ; --- INCORRECTA (ROJO BRILLANTE - 0x0C) ---
    mov ah, 0x0e
    mov al, 0x07        ; BEEP
    int 0x10
    mov si, msg_fail
    mov bh, 0x0C
    jmp .print_res
.win:
    ; --- CORRECTA (VERDE EN FOSFORO - 0x0A) ---
    mov si, msg_ok
    mov bh, 0x0A
.print_res:
    ; Guardar posicion exacta del cursor en DX para eliminar el glitch del cuadro
    push dx
    mov ah, 0x03
    xor bh, bh
    int 0x10
    mov ah, 0x09
    mov al, [si]
    mov cx, 5
    int 0x10
    pop dx
    
    call print_string
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
compare_string:
.loop:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne .not_equal
    cmp al, 0
    je .equal
    inc si
    inc di
    jmp .loop
.not_equal:
    clc
    ret
.equal:
    stc
    ret

; Textos optimizados
msg_term_head db '--- VORTEX OS v10.2 ---', 13, 10, 'Type "help"', 13, 10, 0
prompt_str  db 'vtx> ', 0
msg_unknown db 'Err.', 13, 10, 0
msg_help    db 'Cmds: help, game, cls, reboot', 13, 10, 0
msg_game_start db 'MATH:', 0
msg_ok db ' OK!', 13, 10, 0
msg_fail db ' ERR', 13, 10, 0
cmd_ayuda  db 'help', 0
cmd_game   db 'game', 0
cmd_reboot db 'reboot', 0
cmd_cls    db 'cls', 0
cmd_buffer:
times 510-($-$$) db 0
dw 0xAA55
