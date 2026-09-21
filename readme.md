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

 [#] VortexDOS Core
     * Diseñada exclusivamente para la emulacion web de copy.sh.
     * Interfaz minimalista de comandos instantaneos por letra clave.

 [#] ApexVortexDOS
     * Compatible al 100% con emulacion web y maquinas QEMU locales.
     * Incorpora el comando real "echo" para imprimir cadenas de texto.
     * Juego de matematicas aleatorio con soporte de dos cifras y ENTER.

--- [ HARDWARE REQUIREMENTS ] -------------------------------------------------
[+] CPU:.......... Cualquier procesador x86 (Intel/AMD) de 32 o 64 bits.
[+] RAM:.......... 1 Kilobyte de memoria base (Humillando los gigas de Windows).
[+] DRIVE:........ 1 Disquete virtual (Sector de arranque MBR de 512 bytes).
[+] PRIVILEGIOS:.. Usuario estandar (No requiere permisos de Administrador).
[+] PALETA:....... Fondo negro, tipografia Cian y doble linea superior Amarilla.

--- [ OPERATOR COMMANDS (APEX EDITION) ] --------------------------------------
Escribe el comando completo en el prompt "vtx> " y presiona ENTER para ejecutar:

| COMANDO  | ACCION DEL MICROPROCESADOR
|----------|-------------------------------------------------------------------
| help     | Despliega la lista de comandos autorizados.
| echo     | Escribe "echo " seguido de tu frase y la CPU la repetira limpia.
| game     | Cortafuegos Matematico Avanzado (Suma/resta aleatoria de hasta 2 digitos).
| cls      | Limpia el historial sin mover el titulo doble de la parte superior.
| rb       | Fuerza un reinicio fisico del sistema de la BIOS virtual de QEMU.

* REGLAS DEL JUEGO (MATH LOCK):
  Al ejecutar "game", la CPU lee el reloj interno para generar una ecuacion 
  aleatoria (Ej: 5 + 5 =).
  1. Teclea tu respuesta (soporta numeros como el 10).
  2. Presiona ENTER para validar.
  3. Resultado: OK! en Verde Fosforo o ERR en Rojo Fuego con pitido (BEEP).

--- [ OPCION A: MANUAL PASO A PASO ONLINE (SIN INSTALAR NADA) ] ---------------
Ideal para las computadoras de la escuela o si no tienes permisos de administrador:

PASO 1: Copia todo el codigo fuente del archivo "vortexos.asm" de este repositorio.
PASO 2: Entra al compilador web: https://onecompiler.com
PASO 3: Borra el codigo de ejemplo, pega tu codigo de VortexDOS y presiona el 
        boton de los tres puntos (...) en la esquina superior del editor.
PASO 4: Haz clic en "Download", ve a tu carpeta de Descargas y cambia el nombre 
        del archivo descargado por "vortex_apex.bin".
PASO 5: Abre el emulador web: https://copy.sh
PASO 6: En la linea "Floppy disk image", haz clic en "Seleccionar archivo" y 
        sube tu "vortex_apex.bin".
PASO 7: Baja al fondo de la pagina de copy.sh y haz clic en "Start Emulation".

--- [ OPCION B: GUIA DE EJECUCION LOCAL (CON CMD) ] ---------------------------
Si tienes las herramientas descargadas en tu computadora local:

PASO 1: Pon los archivos "vortexos.asm" y "vortex_apex.bin" sueltos directamente 
        en tu Escritorio de Windows.
PASO 2: Abre la terminal de comandos de Windows (cmd) y muevete al Escritorio con:
`cd %userprofile%\Desktop`

PASO 3: ¿COMO COMPILAR CON NASM LOCAL?
Escribe `"C:\Users\wvilte\AppData\Local\bin\NASM\nasm.exe" -f bin vortexos.asm -o vortex_apex.bin` (o en donde este tu nasm.exe)

PASO 4: ¿COMO ARRANCAR EN QEMU (MSYS2) LOCAL?
Escribe `"C:\msys64\ucrt64\bin\qemu-system-x86_64.exe" -drive format=raw,file=vortex_apex.bin,if=floppy` (cambia las "" en donde esta tu qemu-system-x86_64.exe)

--- [ SYSTEM CREDITS ] --------------------------------------------------------
Codigo fuente desarrollado en lenguaje ensamblador puro por ElPanitaXD.
Resguardado en GitHub contra actualizaciones de empresa y borrados del disco.

[NOTA]: Cualquiera computadora icluso una computadora de 8GB puede correr
===============================================================================
