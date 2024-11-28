section .data
    welcome_msg db "Welcome to Dioko Cafeteria!", 0
    menu_msg db "Menu:", 0
    item1_msg db "1. Hamburger - $5", 0
    item2_msg db "2. Pizza - $7", 0
    item3_msg db "3. Salad - $4", 0
    prompt_msg db "Please select an item: ", 0
    error_msg db "Invalid input. Please try again.", 0
    newline db 10, 0  ; newline character

section .text
    global _start

_start:
    ; Display welcome message
    mov eax, 4
    mov ebx, 1
    mov ecx, welcome_msg
    mov edx, 28
    int 0x80
    
    ; Print a newline character for spacing
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Display menu
    mov eax, 4
    mov ebx, 1
    mov ecx, menu_msg
    mov edx, 6
    int 0x80

    ; Print a newline character for spacing
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, item1_msg
    mov edx, 17
    int 0x80

    ; Print a newline character for spacing
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, item2_msg
    mov edx, 13
    int 0x80
    
    ; Print a newline character for spacing
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, item3_msg
    mov edx, 13
    int 0x80

    ; Print a newline character for spacing
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Prompt for user input
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_msg
    mov edx, 23
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 2
    int 0x80

    ; Validate and process user input
    cmp byte [input_buffer], '1'
    je hamburger_selected
    cmp byte [input_buffer], '2'
    je pizza_selected
    cmp byte [input_buffer], '3'
    je salad_selected
    jmp input_error

hamburger_selected:
    ; Code for handling the hamburger selection goes here
    ; You can modify this section to suit your needs
    jmp exit_program

pizza_selected:
    ; Code for handling the pizza selection goes here
    ; You can modify this section to suit your needs
    jmp exit_program

salad_selected:
    ; Code for handling the salad selection goes here
    ; You can modify this section to suit your needs
    jmp exit_program

input_error:
    ; Display error message
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 30
    int 0x80
    jmp _start

exit_program:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    input_buffer resb 2

