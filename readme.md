===============================================================================
    _   ____   _____ __   __ __     __ ___   ____  _____  _____ __  __
   /_\  |  _ \ | ____|\ \ / / \ \   / / _ \ |  _ \|_   _|| ____|\ \/ /
  / _ \ | |_) ||  _|   \ V /   \ \ / / | | || |_) | | |  |  _|   \  / 
 / ___ \|  __/ | |___   | |     \ V /| |_| ||  _ <  | |  | |___  /  \ 
/_/   \_\_|    |_____|  |_|      \_/  \___/ |_| \_\ |_|  |_____|/_/\_\
                                                                      
===============================================================================
[RAMA DEFINITIVA: APEX EDITION] | [VERSION 10.6] | [DESARROLLADOR: ElPanitaXD]

--- [ ECOSYSTEM MATRIX: LAS 2 EDICIONES OFICIALES ] ---------------------------
El proyecto se resume en dos versiones estables resguardadas en la nube:

 [#] VortexDOS Core (Rama Antigua / Legacy)
     * La reliquia historica. 
     * Diseñada exclusivamente para la emulacion web de copy.sh [3.02].
     * Interfaz minimalista de comandos instantaneos por letra clave [3.02].

 [#] ApexVortexDOS (Esta Rama / Edicion "CMD Help")
     * La obra maestra actual de 512 bytes exactos con titulo doble Amarillo [3.02].
     * Compatible al 100% con emulacion web y maquinas QEMU locales [3.02].
     * Incorpora el comando real "echo" para imprimir cadenas de texto [3.02].
     * Juego de matematicas aleatorio con soporte de dos cifras y ENTER [3.02].

--- [ HARDWARE REQUIREMENTS ] -------------------------------------------------
[+] CPU:.......... Cualquier procesador x86 (Intel/AMD) de 32 o 64 bits.
[+] RAM:.......... 1 Kilobyte de memoria base (Humillando los gigas de Windows) [3.02].
[+] DRIVE:........ 1 Disquete virtual (Sector de arranque MBR de 512 bytes) [3.02].
[+] PRIVILEGIOS:.. Usuario estandar (No requiere permisos de Administrador).
[+] PALETA:....... Fondo negro, tipografia Cian y doble linea superior Amarilla [3.02].

--- [ OPERATOR COMMANDS (APEX EDITION) ] --------------------------------------
Escribe el comando completo en el prompt "vtx> " y presiona ENTER para ejecutar:

| COMANDO  | ACCION DEL MICROPROCESADOR
|----------|-------------------------------------------------------------------
| help     | Despliega la lista de comandos autorizados [3.02].
| echo     | Escribe "echo " seguido de tu frase y la CPU la repetira limpia [3.02].
| game     | Cortafuegos Matematico Avanzado (Suma/resta aleatoria de hasta 2 digitos) [3.02].
| cls      | Limpia el historial sin mover el titulo doble de la parte superior [3.02].
| rb       | Fuerza un reinicio fisico del sistema de la BIOS virtual de QEMU [3.02].

* REGLAS DEL JUEGO (MATH LOCK):
  Al ejecutar "game", la CPU lee el reloj interno para generar una ecuacion 
  aleatoria (Ej: 5 + 5 =) [3.02].
  1. Teclea tu respuesta (soporta numeros como el 10) [3.02].
  2. Presiona ENTER para validar [3.02].
  3. Resultado: OK! en Verde Fosforo o ERR en Rojo Fuego con pitido (BEEP) [3.02].

--- [ GUIA DE EJECUCION PASO A PASO EN EL CMD ] -------------------------------
Para compilar y correr esta version Apex en cualquier PC del mundo sin tocar 
las variables de entorno de Windows, sigue estos pasos:

PASO 1: Descarga y pon los archivos "vortexos.asm" y "vortex_apex.bin" sueltos 
        directamente en tu Escritorio de Windows [3.02].

PASO 2: Abre la terminal de comandos de Windows (cmd) y muevete al Escritorio con:
`cd %userprofile%\Desktop`

PASO 3: ¿COMO COMPILAR EL CODIGO FUENTE SI TIENES NASM?
Escribe "C:\Users\wvilte\AppData\Local\bin\NASM\nasm.exe" -f bin vortexos.asm -o vortex_apex.bin (puedes cambiar las "" segun donde tu nasm.exe
PASO 4: ¿COMO ARRANCAR EL SISTEMA OPERATIVO EN QEMU (MSYS2)?
Escribe "C:\msys64\ucrt64\bin\qemu-system-x86_64.exe" -drive format=raw,file=vortex_apex.bin,if=floppy (tambien cambia las "" si te da error y ve donde esta tu qemu-system-x86_64.exe)

--- [ SYSTEM CREDITS ] --------------------------------------------------------
Codigo fuente desarrollado en lenguaje ensamblador puro por ElPanitaXD.
Resguardado en GitHub contra actualizaciones de empresa y borrados del disco.

[NOTA]: Puede correr en cualquier computadora de gama baja
===============================================================================

