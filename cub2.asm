org 100h

mov al, 13h ;13h = mod grafic
mov ah, 0   ;seteaza modul video
int 10h 

mov al, 1110b ;seteaza culoarea
mov ah, 0ch 

;cx si dx stocheaza coordonatele unui pixel
;cx reprezinta coloana
;dx reprezinta linia

;unul dintre segmentele de dreapta oblice 
;incepe schimbarea culorii de la pixelul de coordonate (100, 100)      
mov cx, 100  ;incarca valoarea 100 in registrul cx, corespunzator coloanei
mov dx, 100  ;incarca valoarea 100 in registrul dx, corespunzator liniei
ol4: 
int 10h      ;interruptul care schimba culoarea unui pixel
inc cx 		 ;pentru a obtine un segment de dreapta oblic, atat cx, cat si dx trebuie incrementate/decrementate
dec dx      
cmp cx, 130  ;compara bx cu 130
jne ol4      ;jump if not equal*
			 ;repeta pana cand bx = 130, deci 30 de pixeli pe coloana

;unul dintre segmentele de dreapta verticale
mov dx, 70 
mov cx, 130
vl5:           
int 10h     
dec dx      ;pentru a obtine un segment de dreapta vertical, dx trebuie incrementat/decrementat
            ;cx(coloana) ramane constant 
cmp dx, 10 
jne vl5      



;unul dintre segmentele de dreapta orizontale
mov cx, 130
mov dx, 70                                   
hl6:           
int 10h     
inc cx      ;pentru a obtine un segment de dreapta orizontal, cx trebuie incrementat/decrementat
            ;dx(linia) ramane constant
cmp cx, 190 
jne hl6      


;schimba culoarea pentru a evidentia laturile care se vad
mov al, 1100b
mov ah, 0ch

 
;unul dintre segmentele de dreapta verticale
mov dx, 40  
mov cx, 100
vl:         
int 10h     
inc dx      
cmp dx, 100 
jne vl        

;unul dintre segmentele de dreapta orizontale
mov cx, 100  
mov dx, 100
hl:
int 10h     
inc cx      
cmp cx, 160 
jne hl      

;unul dintre segmentele de dreapta verticale
mov cx, 160
mov dx, 100 
vl2:
int 10h     
dec dx      
cmp dx, 40 
jne vl2      

;unul dintre segmentele de dreapta orizontale
mov cx, 160
mov dx, 40                                  
hl2:
int 10h     
dec cx      
cmp cx, 100 
jne hl2      
ret



