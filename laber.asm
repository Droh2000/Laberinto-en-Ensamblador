.model small
.stack 10h
.data
; DEFININ VARIABLE
x db ; columna   (va hacia los lados)
y db ; renglones (va hacia abajo)
conta db ; el contador vueltas
.code
.startup
; Pintar Barra Horizontal Arriba
mov ah,02;es la fucnion 02
mov bh,00; es la pagina de la pantalla, es 0 porque no se mueve
mov dh,0; Renglones
mov dl,0; COLUMNA
int 10h; (Es la Pantalla) la funcion 02 combinada con 10h posiciona el cursor
; 2? Se Pinta carcateres en esa posicion
mov ah, 0ah;impimie un caracter varaias vezes
mov al,223; aqui va el caracter, en hexadecimal (DBh) o 219 en decimal
mov bh,0h; Pagina 00
mov cx,80 ; Numero de Caracteres
int 10h ; es la pantalla

; Pintar barra Vertical de la IZQUIERDA
mov conta,0 
mov x,0; Columna
mov y,0; Renglon

   IMPRI:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah;impimie un caracter varaias vezes
        mov al,219; aqui va el caracter, en hexadecimal (DBh) o 219 en decimal
        mov bh,0h; Pagina 00
        mov cx,1 ; CADA VEZ QUE DE VUELTA IMPRME UN CARCTER POR ESO SE PONE UNO
        int 10h ; es la pantalla

        ; Anes que se regrese, que incremente
        inc y; Pra que vaya hacia abajo, la X se mantiene en la misma columna
        inc conta; incrementamos el incremento del contador
        ; Condicion del Ciclo para saber si termina y cuanto debe ejecutarse
        CMP conta,23; Numero de Carcater a Imprimir
        JNE IMPRI   ;SALTOS CONDICIONALES, Salta SI NO ES IGUAL (JUMP NPT EQUAL) en este caso '5', 'IMPRI' ES UNA ETIQUETA (es como una salida) no es una variable,esta se refiere a la comparacion 'cmp' de arriba
        ; Los saltos condicionales se compara antes para saber si se puede saltar (compara si se cumplen o NO la condicion)
        ; las etiquetas sirven para saltar de una parte del codigo a otro, NO PUEDE HABER ETIQUETAS REPITIDAS
   
        ; Pintar Barra Horizontal Abajo
mov ah,02;es la fucnion 02
mov bh,00; es la pagina de la pantalla, es 0 porque no se mueve
mov dh,23; Renglones
mov dl,0; COLUMNA
int 10h; (Es la Pantalla) la funcion 02 combinada con 10h posiciona el cursor
; 2? Se Pinta carcateres en esa posicion
mov ah, 0ah;impimie un caracter varaias vezes
mov al,223; aqui va el caracter, en hexadecimal (DBh) o 219 en decimal
mov bh,0h; Pagina 00
mov cx,80 ; Numero de Caracteres
int 10h ; es la pantalla

; Pintar barra Vertical de la Derecha
mov conta,0 
mov x,79; Columna
mov y,0; Renglon

   IMPRI1:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah;impimie un caracter varaias vezes
        mov al,219; aqui va el caracter, en hexadecimal (DBh) o 219 en decimal
        mov bh,0h; Pagina 00
        mov cx,1 ; CADA VEZ QUE DE VUELTA IMPRME UN CARCTER POR ESO SE PONE UNO
        int 10h ; es la pantalla

        ; Anes que se regrese, que incremente
        inc y; Pra que vaya hacia abajo, la X se mantiene en la misma columna
        inc conta; incrementamos el incremento del contador
        ; Condicion del Ciclo para saber si termina y cuanto debe ejecutarse
        CMP conta,23; Numero de Carcater a Imprimir
        JNE IMPRI1   ;SALTOS CONDICIONALES, Salta SI NO ES IGUAL (JUMP NPT EQUAL) en este caso '5', 'IMPRI' ES UNA ETIQUETA (es como una salida) no es una variable,esta se refiere a la comparacion 'cmp' de arriba
        ; Los saltos condicionales se compara antes para saber si se puede saltar (compara si se cumplen o NO la condicion)
        ; las etiquetas sirven para saltar de una parte del codigo a otro, NO PUEDE HABER ETIQUETAS REPITIDAS
    
; Empezar a Dibujar las demas Lineas
mov conta,0 
mov x,3; Columna
mov y,0; Renglon

   IMPRI2:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,8
        JNE IMPRI2      

mov conta,0 
mov x,3; Columna
mov y,10; Renglon

   IMPRI3:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,11
        JNE IMPRI3

mov conta,0 
mov x,6; Columna
mov y,2; Renglon

   IMPRI4:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,12
        JNE IMPRI4
; Linea Horizontal unida con lo de arriba
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,6; COLUMNA
int 10h

mov ah, 0ah
mov al,220
mov bh,0h
mov cx,14 
int 10h        
; Horizontal despues de dos espacios
; 3 horizontales con la vertical en 10
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,22; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,4 ; Numero carcateres
int 10h
;Vertical conectada con la horizontal de arriba
mov conta,0 
mov x,25; Columna
mov y,0; Renglon

   IMPRI11:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,13
        JNE IMPRI11
;Vertical hacia abajo con dos de separacion 
mov conta,0 
mov x,25; Columna
mov y,14; Renglon

   IMPRI12:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7
        JNE IMPRI12
;Horizontal en vertical 7
mov ah,02
mov bh,00
mov dh,20; Renglones
mov dl,26; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
; vertical hacia abajo unida a la de arriba
mov conta,0 
mov x,28; Columna
mov y,21; Renglon

   IMPRI13:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,2
        JNE IMPRI13
; Continuar con vertical hacia arriba        
mov conta,0 
mov x,31; Columna
mov y,8; Renglon

   IMPRI16:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,15
        JNE IMPRI16
; Horizontal conectada con arriba
mov ah,02
mov bh,00
mov dh,8; Renglones
mov dl,28; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
; Vertical conectada con la de arriba
mov conta,0 
mov x,28; Columna
mov y,5; Renglon

   IMPRI17:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,3
        JNE IMPRI17
; Horizontal que continua
mov ah,02
mov bh,00
mov dh,5; Renglones
mov dl,31; COLUMNA
int 10h

mov ah, 0ah
mov al,223 ; Tiene que cambiar caracter
mov bh,0h
mov cx,4 ; Numero carcateres
int 10h;
; Vertial hacia abajo desde la horizontal de arriba
mov conta,0 
mov x,34; Columna
mov y,5; Renglon

   IMPRI18:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,16
        JNE IMPRI18
        ; Vertical que continuara
mov conta,0 
mov x,49; Columna
mov y,8; Renglon

   IMPRI25:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,13
        JNE IMPRI25
; Horizontal con vertical en 13
mov ah,02
mov bh,00
mov dh,8; Renglones
mov dl,50; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,6 ; Numero carcateres
int 10h;
; Vertical unida con la de arriba
mov conta,0 
mov x,56; Columna
mov y,0; Renglon

   IMPRI30:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,14
        JNE IMPRI30
;Tomar como referencia para la vertical de abajo
mov conta,0 
mov x,56; Columna
mov y,16; Renglon

   IMPRI32:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7
        JNE IMPRI32
; Vertical de arriba con 18
mov conta,0 
mov x,59; Columna
mov y,5; Renglon

   IMPRI33:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI33
; Horizontal en 4 unida con la de arriba        
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,59; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,5 ; Numero carcateres
int 10h;
; VERTICAL que bajara
mov conta,0 
mov x,63; Columna
mov y,3; Renglon

   IMPRI34:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI34
; VERTICAL que subira
mov conta,0 
mov x,69; Columna
mov y,5; Renglon

   IMPRI35:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI35
; Horizontal de arriva
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,66; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,7 ; Numero carcateres
int 10h;

; Horizontal final de arriba
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,74; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,5; Numero carcateres
int 10h;
; Vertical que baja con la de arriba        
mov conta,0 
mov x,74; Columna
mov y,3; Renglon

   IMPRI37:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,10
        JNE IMPRI37

; Vertical separada de dos con 8
mov conta,0 
mov x,74; Columna
mov y,15; Renglon

   IMPRI38:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,6
        JNE IMPRI38        
; Horizonta que continua con la de arriba
mov ah,02
mov bh,00
mov dh,15; Renglones
mov dl,74; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
; Vertical que baja con la de arriba
mov conta,0 
mov x,76; Columna
mov y,16; Renglon

   IMPRI39:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7
        JNE IMPRI39
; Horizontal unido a 3
mov ah,02
mov bh,00
mov dh,12; Renglones
mov dl,76; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
; Vertical que termina con la de arriba
mov conta,0 
mov x,76; Columna
mov y,5; Renglon

   IMPRI40:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,8
        JNE IMPRI40

; Vertical 
mov conta,0 
mov x,72; Columna
mov y,3; Renglon

   IMPRI36:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI36
        
; Horizontal con 1
mov ah,02
mov bh,00
mov dh,10; Renglones
mov dl,73; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,1 ; Numero carcateres
int 10h;

; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,20; Renglones
mov dl,66; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
        
; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,15; Renglones
mov dl,66; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
        
; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,9; Renglones
mov dl,66; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
        
; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,18; Renglones
mov dl,64; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;        
        
; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,12; Renglones
mov dl,64; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
        
; Horizontal que sale 3      
mov ah,02
mov bh,00
mov dh,5; Renglones
mov dl,64; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;

; Horizontal con 3 unidad a la de arriba
mov ah,02
mov bh,00
mov dh,14; Renglones
mov dl,53; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,4 ; Numero carcateres
int 10h;
; Verticaal final con la de arriba
mov conta,0 
mov x,53; Columna
mov y,10; Renglon

   IMPRI31:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,11
        JNE IMPRI31
        
; Horizontal con vertical en 12
mov ah,02
mov bh,00
mov dh,9; Renglones
mov dl,46; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
; Vertical hacia abajo con 4 unida a la de arriba
mov conta,0 
mov x,46; Columna
mov y,9; Renglon

   IMPRI26:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,5
        JNE IMPRI26
; 6 horizontales de arriba
mov ah,02
mov bh,00
mov dh,14; Renglones
mov dl,40; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,7 ; Numero carcateres
int 10h;
; Vertical que llega con la de arriba
mov conta,0 
mov x,40; Columna
mov y,5; Renglon

   IMPRI27:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,9
        JNE IMPRI27


; Horizontal con vertical en 5
mov ah,02
mov bh,00
mov dh,16; Renglones
mov dl,46; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;        
        
; Horizontal 
mov ah,02
mov bh,00
mov dh,20; Renglones
mov dl,35; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,14 ; Numero carcateres
int 10h;

; vertical en 12
mov conta,0 
mov x,46; Columna
mov y,19; Renglon

   IMPRI24:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,2
        JNE IMPRI24
        
; vertical con 6 de la de arriba
mov conta,0 
mov x,40; Columna
mov y,18; Renglon

   IMPRI23:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,3
        JNE IMPRI23

; cuadro que llena arriba
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,37; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,16 ; Numero carcateres
int 10h;
; Vertical de 2
mov conta,0 
mov x,49; Columna
mov y,3; Renglon

   IMPRI22:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,2
        JNE IMPRI22
        
; Vertical con lo de arriba
mov conta,0 
mov x,43; Columna
mov y,3; Renglon

   IMPRI21:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7
        JNE IMPRI21
;Horizontal unida con la de arriba        
mov ah,02
mov bh,00
mov dh,5; Renglones
mov dl,44; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;

; Vertical 
mov conta,0 
mov x,37; Columna
mov y,3; Renglon

   IMPRI19:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI19
; Horizontal con vertical de arriba en 5
mov ah,02
mov bh,00
mov dh,16; Renglones
mov dl,38; COLUMNA
int 10h

mov ah, 0ah
mov al,223  ; Tiene que cambiar caracter
mov bh,0h
mov cx,6 ; Numero carcateres
int 10h;
; Vertical unida con la de arriba
mov conta,0 
mov x,43; Columna
mov y,16; Renglon

   IMPRI20:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,3
        JNE IMPRI20

; Horizontal que continua con la linea de arriba
mov ah,02
mov bh,00
mov dh,2; Renglones
mov dl,28; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,7 ; Numero carcateres
int 10h;        

;  Horizontal en vertical 5
mov ah,02
mov bh,00
mov dh,18; Renglones
mov dl,22; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h;
        
; horizontal con la linea de arriba en 13
mov ah,02
mov bh,00
mov dh,12; Renglones
mov dl,26; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h
; Vetical hacia abajo unida con la de arriba
mov conta,0 
mov x,28; Columna
mov y,13; Renglon

   IMPRI15:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,6
        JNE IMPRI15
        
; horizontal con la linea de arriba en 12
mov ah,02
mov bh,00
mov dh,11; Renglones
mov dl,23; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,2 ; Numero carcateres
int 10h        

; 12 hacia abajo
mov conta,0 
mov x,12; Columna
mov y,3; Renglon

   IMPRI6:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18 ; NUMERO DE CARacteres
        JNE IMPRI6
; 4 Horizontales Acostados
mov ah,02
mov bh,00
mov dh,13; Renglones
mov dl,13; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h

; Vertical unida a la de arriba
; 8 hacia abajo
mov conta,0 
mov x,15; Columna
mov y,14; Renglon

   IMPRI7:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7 ; NUMERO DE CARacteres
        JNE IMPRI7
; La vertical seprada que va arriba de esta de arriba
mov conta,0 
mov x,15; Columna
mov y,5; Renglon

   IMPRI8:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7 ; NUMERO DE CARacteres
        JNE IMPRI8
; 3 horizontales unidos a la de arriba        
mov ah,02
mov bh,00
mov dh,11; Renglones
mov dl,16; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h
;Vertical que le inicia de arriba y se une con la horizontal de arriba
mov conta,0 
mov x,18; Columna
mov y,5; Renglon

   IMPRI9:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,18
        JNE IMPRI9
; 3 horizontales con la vertical en 10
mov ah,02
mov bh,00
mov dh,14; Renglones
mov dl,19; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,4 ; Numero carcateres
int 10h        
; 3 horizontales en la vertical de arriba
mov ah,02
mov bh,00
mov dh,5; Renglones
mov dl,18; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,4 ; Numero carcateres
int 10h

; 4 verticales unidos con lo de arriba
mov conta,0 
mov x,21; Columna
mov y,6; Renglon

   IMPRI10:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,4
        JNE IMPRI10


; 3 Horizontales Acostados pero restar columnas
mov ah,02
mov bh,00
mov dh,18; Renglones
mov dl,9; COLUMNA
int 10h

mov ah, 0ah
mov al,220  ; Tiene que cambiar caracter
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h

; ----------------------------- horizontal
mov ah,02
mov bh,00
mov dh,13; Renglones
mov dl,7; COLUMNA
int 10h

mov ah, 0ah
mov al,220
mov bh,0h
mov cx,3 ; Numero carcateres
int 10h

mov conta,0 
mov x,6; Columna
mov y,16; Renglon

   IMPRI5:mov ah,02
        mov bh,00
        mov dh,y; Renglones, 
        mov dl,x;  COLUMNA 
        int 10h

        mov ah, 0ah
        mov al,219
        mov bh,0h
        mov cx,1
        int 10h
        
        inc y
        inc conta
        CMP conta,7
        JNE IMPRI5        
        
; Terminar el programa
mov ah,01h
int 21h
end