section	.datans10
quiz_Q1 dq "What is the smallest country in the world by land area? ", 10 ; Ask the user for a quess
quiz_Q1Len equ $- quiz_Q1 ; calculate the length of the guess message in bytes
quiz_Q2 dq "Who is the current Prime Minister of Canada? ", 10;
quiz_Q2Len equ $- quiz_Q2 ;
quiz_Q3 dq "Which planet in our solar system is the hottest? ", 10;
quiz_Q3Len equ $- quiz_Q3 ;
quiz_Q4 dq "What is the capital city of South Korea? ", 10;
quiz_Q4Len equ $- quiz_Q4 ;
quiz_Q5 dq "What is the highest mountain in Africa?", 10;
quiz_Q5Len equ $- quiz_Q5 ;
quiz_Q6 dq "Which American state is known as the unshine State?", 10;
quiz_Q6Len equ $- quiz_Q6 ;
quiz_Q7 dq "Who wrote the novel To Kill a Mockingbird ?", 10;
quiz_Q7Len equ $- quiz_Q7 ;
quiz_Q8 dq "What is the chemical symbol for gold?", 10;
quiz_Q8Len equ $- quiz_Q8 ;
quiz_Q9 dq "Which country is home to the world's largest rainforest?", 10;
quiz_Q9Len equ $- quiz_Q9 ;
quiz_Q10 dq "What is the name of the famous painting by Leonardo da Vinci that depicts a woman with a mysterious smile? ", 10;
quiz_Q10Len equ $- quiz_Q10 ;
correct_aswer db "you are correct ", 10 ; Message that the guess and the right answer are same
correct_aswerLen equ $- correct_aswer ; calculate the length of the message
ans1 dq "vatican city" ; variable that stores the correct answer
ans2 dq "justin trudeau"
ans3 dq "venus"
ans4 dq "seoul"
ans5 dq "mount kilimanjaro"
ans6 dq "florida"
ans7 dq "harper lee"
ans8 dq "au"
ans9 dq "brazil"
ans10 dq "mona lisa"
point_message db "The score is :" ; Message to present the inc value
point_messageLen equ $-point_message ; Getting the length of the inc message 
Userscore1 db 0
Userscore2 db 0 
newline db 10;
notcorrect_answer db "Your wrong", 10 ; Message that the guess and the right answer are same
notcorrect_answerLen equ $- notcorrect_answer ; calculate the length of the message
notcorrect_answer2 db "Your incorrect ", 10 ; message user guess is incorrect
samenotlen equ $-notcorrect_answer ;Calculate the length of the message
section .bss
   user1_quiz1 resq 1 ; variable containing letter entered by the user 8 bytes
   clear resq 1
   user1_quiz2 resq 1
   user1_quiz3 resq 1
   user1_quiz4 resq 1
   user1_quiz5 resq 1
   user1_quiz6 resq 1
   user1_quiz7 resq 1
   user1_quiz8 resq 1
   user1_quiz9 resq 1
   user1_quiz10 resq 1
   user2_quiz1 resq 1
   user2_quiz2 resq 1
   user2_quiz3 resq 1
   user2_quiz4 resq 1
   user2_quiz5 resq 1
   user2_quiz6 resq 1
   user2_quiz7 resq 1
   user2_quiz8 resq 1
   user2_quiz9 resq 1
   user2_quiz10 resq 1
   printScore resb 1;
   printScore1 resb 1 ;

  
   
section	.text
global _start      ;must be declared for using gcc
_start:	 ;tell linker entry point
  call printquiz_Q1
  call compareValue1user1_quiz1
  call compareValue1User2Q1
  call printUserscore1
  call printUserscore2

  call printquiz_Q2
  call compareValue1user1_quiz2
  call compareValue1user2_quiz2
  call printUserscore1
  call printUserscore2

  call printquiz_Q3
  call compareValue1user1_quiz3
  call compareValue1user2_quiz3
  call printUserscore1
  call printUserscore2

  call printquiz_Q4
  call compareValue1user1_quiz4
  call compareValue1user2_quiz4
  call printUserscore1
  call printUserscore2

  call printquiz_Q5
  call comparevalue1user1_quiz5
  call comparevalue1user2_quiz5
  call printUserscore1
  call printUserscore2

  call printquiz_Q6
  call comparevalue1user1_quiz6
  call comparevalue1user2_quiz6
  call printUserscore1
  call printUserscore2

  call printquiz_Q7
  call comparevalue1user1_quiz7
  call comparevalue1user2_quiz7
  call printUserscore1
  call printUserscore2

  call printquiz_Q8
  call comparevalue1user1_quiz8
  call comparevalue1user2_quiz8
  call printUserscore1
  call printUserscore2

  call printquiz_Q9
  call comparevalue1user1_quiz9
  call comparevalue1user2_quiz9
  call printUserscore1
  call printUserscore2

  call printquiz_Q10
  call comparevalue1user1_quiz10
  call comparevalue1user2_quiz10
  call printUserscore1
  call printUserscore2

  call end ; call subroutine to end the program
; subroutine to get user input and compare with correct answer
compareValue1user1_quiz1:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user1_quiz1 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   
  

  mov   rax, [user1_quiz1] ; move the value in variable guess into register eax
  cmp   rax, [ans1]  ; compare correct answer with what in eax (user guess)
  je    user1 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code
compareValue1User2Q1:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx,  user2_quiz1 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   
  
  mov   rax, [ user2_quiz1] ; move the value in variable guess into register eax
  cmp   rax, [ans1]  ; compare correct answer with what in eax (user guess)
  je    user2 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user1_quiz2:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user1_quiz2 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   

  xor rax, rax
  
  mov   rax, [user1_quiz2] ; move the value in variable guess into register eax
  cmp   rax, [ans2]  ; compare correct answer with what in eax (user guess)
  je    user1 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user2_quiz2:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user2_quiz2 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   

  xor rax, rax
 
  mov   rax, [user2_quiz2] ; move the value in variable guess into register eax
  cmp   rax, [ans2]  ; compare correct answer with what in eax (user guess)
  je    user2 ; if value in eax and variable answer are the same jump to same
  
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user1_quiz3:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user1_quiz3 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   

  xor rax, rax
  
  mov   rax, [user1_quiz3] ; move the value in variable guess into register eax
  cmp   rax, [ans3]  ; compare correct answer with what in eax (user guess)
  je    user1 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user2_quiz3:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user2_quiz3 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   

  xor rax, rax
 
  mov   rax, [user2_quiz3] ; move the value in variable guess into register eax
  cmp   rax, [ans3]  ; compare correct answer with what in eax (user guess)
  je    user2 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user1_quiz4:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user1_quiz4 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   
  
  xor rax, rax

  mov   rax, [user1_quiz4] ; move the value in variable guess into register eax
  cmp   rax, [ans4]  ; compare correct answer with what in eax (user guess)
  je    user1 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

compareValue1user2_quiz4:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz4 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz4] ; move the value in variable guess into register eax
    cmp   rax, [ans4]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user1_quiz5:
  mov eax, 3 ; read from keyboard using system call SYS_READ
  mov ebx, 2 ; stdin
  mov ecx, user1_quiz5 ; Move the character entered by the user into variable guess
  mov edx, 1 ;  As single letter input use 1 byte
  int 80h	; Invoke the kernel to get the user input   
  
  xor rax, rax

  mov   rax, [user1_quiz5] ; move the value in variable guess into register eax
  cmp   rax, [ans5]  ; compare correct answer with what in eax (user guess)
  je    user1 ; if value in eax and variable answer are the same jump to same
  call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user2_quiz5:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz5 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz5] ; move the value in variable guess into register eax
    cmp   rax, [ans5]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code
comparevalue1user1_quiz6:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user1_quiz6 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   

    xor rax, rax

    mov   rax, [user1_quiz6] ; move the value in variable guess into register eax
    cmp   rax, [ans6]  ; compare correct answer with what in eax (user guess)
    je    user1 ; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user2_quiz6:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz6 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz6] ; move the value in variable guess into register eax
    cmp   rax, [ans6]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user1_quiz7:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user1_quiz7 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user1_quiz7] ; move the value in variable guess into register eax
    cmp   rax, [ans7]  ; compare correct answer with what in eax (user guess)
    je    user1; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user2_quiz7:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz7 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz7] ; move the value in variable guess into register eax
    cmp   rax, [ans7]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user1_quiz8:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user1_quiz8 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user1_quiz8] ; move the value in variable guess into register eax
    cmp   rax, [ans8]  ; compare correct answer with what in eax (user guess)
    je    user1; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code


comparevalue1user2_quiz8:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz8 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz8] ; move the value in variable guess into register eax
    cmp   rax, [ans8]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user1_quiz9:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user1_quiz9 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user1_quiz9] ; move the value in variable guess into register eax
    cmp   rax, [ans9]  ; compare correct answer with what in eax (user guess)
    je    user1; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user2_quiz9:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz9 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz9] ; move the value in variable guess into register eax
    cmp   rax, [ans9]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user1_quiz10:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user1_quiz10 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user1_quiz10] ; move the value in variable guess into register eax
    cmp   rax, [ans10]  ; compare correct answer with what in eax (user guess)
    je    user1; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

comparevalue1user2_quiz10:
    mov eax, 3 ; read from keyboard using system call SYS_READ
    mov ebx, 2 ; stdin
    mov ecx, user2_quiz10 ; Move the character entered by the user into variable guess
    mov edx, 1 ;  As single letter input use 1 byte
    int 80h	; Invoke the kernel to get the user input   


    xor rax, rax

    mov   rax, [user2_quiz10] ; move the value in variable guess into register eax
    cmp   rax, [ans10]  ; compare correct answer with what in eax (user guess)
    je    user2; if value in eax and variable answer are the same jump to same
    call samenot ; go to samenot subroutine if answer and guess are not same
ret ; return to the main code

printquiz_Q1:
   mov   edx, quiz_Q1Len ; length of the guess request message
   mov   ecx,quiz_Q1 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
printquiz_Q2:
   mov   edx, quiz_Q2Len ; length of the guess request message
   mov   ecx,quiz_Q2 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message

   ret ; return to main code 
printquiz_Q3:
   mov   edx, quiz_Q3Len ; length of the guess request message
   mov   ecx,quiz_Q3 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q4:
   mov   edx, quiz_Q4Len ; length of the guess request message
   mov   ecx,quiz_Q4 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q5:
   mov   edx, quiz_Q5Len ; length of the guess request message
   mov   ecx,quiz_Q5 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q6:
   mov   edx, quiz_Q6Len ; length of the guess request message
   mov   ecx,quiz_Q6 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q7:
   mov   edx, quiz_Q7Len ; length of the guess request message
   mov   ecx,quiz_Q7 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q8:
   mov   edx, quiz_Q8Len ; length of the guess request message
   mov   ecx,quiz_Q8 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q9:
   mov   edx, quiz_Q9Len ; length of the guess request message
   mov   ecx,quiz_Q9 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
printquiz_Q10:
   mov   edx, quiz_Q8Len ; length of the guess request message
   mov   ecx,quiz_Q10 ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret ; return to main code 
; subroutine to deal with when user input and and real answer are the same
user1:
mov eax, 3 ; read from keyboard using system call SYS_READ
   mov ebx, 2 ; stdin
   mov ecx, clear ; Move the character entered by the user into variable guess
   mov edx, 1 ;  As single letter input use 1 byte
   int 80h	; Invoke the kernel to get the user input 
   mov   edx, correct_aswerLen ; length of the same message
   mov   ecx,correct_aswer ; same message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message 
   inc byte [Userscore1]
   ret ; return to main code 
user2:
mov eax, 3 ; read from keyboard using system call SYS_READ
   mov ebx, 2 ; stdin
   mov ecx, clear ; Move the character entered by the user into variable guess
   mov edx, 1 ;  As single letter input use 1 byte
   int 80h	; Invoke the kernel to get the user input  
   mov   edx, correct_aswerLen ; length of the same message
   mov   ecx,correct_aswer ; same message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
 inc byte [Userscore2]
   ret ; return to main code 

; subroutine to deal with when user input and and real answer are not the same
samenot: 
   mov   edx, notcorrect_answerLen ; not same message length
   mov   ecx,notcorrect_answer ; not same message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the kernel to print the message
   mov eax, 3 ; read from keyboard using system call SYS_READ
   mov ebx, 2 ; stdin
   mov ecx, clear ; Move the character entered by the user into variable guess
   mov edx, 1 ;  As single letter input use 1 byte
   int 80h	; Invoke the kernel to get the user input   
   ret ; return to main code

printUserscore1:
   mov eax, [Userscore1]
   add eax, 48
   mov [printScore], eax ;
   
   mov   edx, point_messageLen ; length of the guess request message
   mov   ecx, point_message ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   
   mov   edx, 1 ; length of the guess request message
   mov   ecx, printScore ; guess request message

   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   
   mov   edx, 1 ; length of the guess request message
   mov   ecx, newline ; guess request message

   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret
printUserscore2:
   mov eax, [Userscore2]
   add eax, 48
   mov [printScore1], eax ;
   
   mov   edx, point_messageLen ; length of the guess request message
   mov   ecx, point_message ; guess request message
   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   
   mov   edx, 1 ; length of the guess request message
   mov   ecx, printScore1 ; guess request message

   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   
   mov   edx, 1 ; length of the guess request message
   mov   ecx, newline ; guess request message

   mov   ebx,1	;file descriptor (stdout)
   mov   eax,4	;system call number (sys_write)
   int   0x80	;invoke the  kernel to display the message
   ret
;subroutine to end the program
end:
   mov eax, 1 ; system call number (sys_exit)
   int 80h ; invoke the kernel to end the program