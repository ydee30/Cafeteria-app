section .data
    ; Messages
    m1 db "Welcome to group Dioko Restaurant", 0xA, 0
    m1_length equ $ - m1
    m2 db "Please select an Option: ", 0
    m2_length equ $ - m2
    m3 db "1. Breakfast", 0xA, 0
    m3_length equ $ - m3
    m4 db "2. Lunch", 0xA, 0
    m4_length equ $ - m4
    m5 db "3. Dinner", 0xA, 0
    m5_length equ $ - m5
    m6 db "4. Snack", 0xA, 0
    m6_length equ $ - m6
    m7 db "5. Sweet Meat", 0xA, 0
    m7_length equ $ - m7
    m8 db "6. Drinks", 0xA, 0
    m8_length equ $ - m8
    Invalid db "Please enter a valid choice", 0xA, 0
    Invalid_length equ $ - Invalid
    newline db 0xA
    
	; Prices for breakfast options
	BrkfastOpt1Price dw 500
	BrkfastOpt2Price dw 700
	BrkfastOpt3Price dw 600
	BrkfastOpt4Price dw 800
	BrkfastOpt5Price dw 400
	BrkfastOpt6Price dw 300
	BrkfastOpt7Price dw 500
	BrkfastOpt8Price dw 200
	BrkfastOpt9Price dw 400
	
	; Prices for lunch options
    	LunchOpt1Price dw 1000
    	LunchOpt2Price dw 1200
    	LunchOpt3Price dw 1100
    	LunchOpt4Price dw 1300
    	LunchOpt5Price dw 900
    	LunchOpt6Price dw 800
    	LunchOpt7Price dw 1000
    	LunchOpt8Price dw 700
    	LunchOpt9Price dw 900
    

    priceMessage db "Total Price: $", 0
    priceMessage_length equ $ - priceMessage


    BrkfastOpt db "Please select a breakfast option: ", 0
    BrkfastOpt_length equ $ - BrkfastOpt
    
    LunchOpt db "Please select a lunch option: ", 0
    LunchOpt_length equ $ - LunchOpt

    ; Breakfast options:
    BrkfastOpt1 db "1. Peanut Butter and Apple", 0xA, 0
    BrkfastOpt1_length equ $ - BrkfastOpt1
    BrkfastOpt2 db "2. Waffles and Yogurt", 0xA, 0
    BrkfastOpt2_length equ $ - BrkfastOpt2
    BrkfastOpt3 db "3. Oatmeal and Cherries", 0xA, 0
    BrkfastOpt3_length equ $ - BrkfastOpt3
    BrkfastOpt4 db "4. Apple and Brown Betty", 0xA, 0
    BrkfastOpt4_length equ $ - BrkfastOpt4
    BrkfastOpt5 db "5. Egg", 0xA, 0
    BrkfastOpt5_length equ $ - BrkfastOpt5
    BrkfastOpt6 db "6. Greek Yogurt", 0xA, 0
    BrkfastOpt6_length equ $ - BrkfastOpt6
    BrkfastOpt7 db "7. Whole Wheat Toast with Toppings", 0xA, 0
    BrkfastOpt7_length equ $ - BrkfastOpt7
    BrkfastOpt8 db "8. Nuts", 0xA, 0
    BrkfastOpt8_length equ $ - BrkfastOpt8
    BrkfastOpt9 db "9. Bagel and Cream Cheese", 0xA, 0
    BrkfastOpt9_length equ $ - BrkfastOpt9
    
    ; Lunch options:
    LunchOpt1 db "1. Grilled Chicken Salad", 0xA, 0
    LunchOpt1_length equ $ - LunchOpt1
    LunchOpt2 db "2. Beef Burger", 0xA, 0
    LunchOpt2_length equ $ - LunchOpt2
    LunchOpt3 db "3. Vegetarian Pasta", 0xA, 0
    LunchOpt3_length equ $ - LunchOpt3
    LunchOpt4 db "4. Fish Tacos", 0xA, 0
    LunchOpt4_length equ $ - LunchOpt4
    LunchOpt5 db "5. Club Sandwich", 0xA, 0
    LunchOpt5_length equ $ - LunchOpt5
    LunchOpt6 db "6. Caesar Salad", 0xA, 0
    LunchOpt6_length equ $ - LunchOpt6
    LunchOpt7 db "7. Margherita Pizza", 0xA, 0
    LunchOpt7_length equ $ - LunchOpt7
    LunchOpt8 db "8. Vegetable Curry", 0xA, 0
    LunchOpt8_length equ $ - LunchOpt8
    LunchOpt9 db "9. Sushi Platter", 0xA, 0
    LunchOpt9_length equ $ - LunchOpt9

    
section .bss
	breakfastOption resb 2
	choice resb 2
	lunchOption resb 2

section .text
    global _start

_start:
    ; Print welcome message and menu options
    mov eax, 4
    mov ebx, 1
    mov ecx, m1
    mov edx, m1_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m3
    mov edx, m3_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m4
    mov edx, m4_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m5
    mov edx, m5_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m6
    mov edx, m6_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m7
    mov edx, m7_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, m8
    mov edx, m8_length
    int 0x80

    ; Prompt for choice
    mov eax, 4
    mov ebx, 1
    mov ecx, m2
    mov edx, m2_length
    int 0x80

    ; Get user input for choice
    mov eax, 3
    mov ebx, 0
    mov ecx, choice
    mov edx, 2
    int 0x80

    ; Handle the selected choice
    call _handleChoice

exit_program:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
  
_handleChoice:
    cmp byte [choice], '1'
    je Breakfast
    cmp byte [choice], '2'
    je Lunch
    cmp byte [choice], '3'
    je Dinner
    cmp byte [choice], '4'
    je Snack
    cmp byte [choice], '5'
    je SweetMeat
    cmp byte [choice], '6'
    je Drinks

    ; Invalid choice
    call _invalidChoice
    jmp exit_program

Breakfast:
    ; Print breakfast options
    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt1
    mov edx, BrkfastOpt1_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt2
    mov edx, BrkfastOpt2_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt3
    mov edx, BrkfastOpt3_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt4
    mov edx, BrkfastOpt4_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt5
    mov edx, BrkfastOpt5_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt6
    mov edx, BrkfastOpt6_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt7
    mov edx, BrkfastOpt7_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt8
    mov edx, BrkfastOpt8_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt9
    mov edx, BrkfastOpt9_length
    int 0x80

    ; Prompt for breakfast option
    mov eax, 4
    mov ebx, 1
    mov ecx, BrkfastOpt
    mov edx, BrkfastOpt_length
    int 0x80

    ;get user input for Breakfast Option
    mov 	eax,3
    mov 	ebx,0
    mov 	ecx,breakfastOption
    mov 	edx,2
    int 	0x80
    
    ; Check for valid breakfast option
    cmp byte [breakfastOption], '1'
    jb invalidChoice
    cmp byte [breakfastOption], '9'
    ja invalidChoice
    

    ; Calculate and print the price
    call _calculatePrice

    ; Exit the program
    jmp exit_program
    
    ; Invalid choice
    invalidChoice:
    call _invalidChoice
    jmp exit_program

Lunch:
   ; Print lunch options
   mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt1
    mov edx, LunchOpt1_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt2
    mov edx, LunchOpt2_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt3
    mov edx, LunchOpt3_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt4
    mov edx, LunchOpt4_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt5
    mov edx, LunchOpt5_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt6
    mov edx, LunchOpt6_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt7
    mov edx, LunchOpt7_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt8
    mov edx, LunchOpt8_length
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt9
    mov edx, LunchOpt9_length
    int 0x80
   
    mov eax, 4
    mov ebx, 1
    mov ecx, LunchOpt
    mov edx, LunchOpt_length
    int 0x80
    
	;take in lunch user input
    mov eax, 3
    mov ebx, 0
    mov ecx, lunchOption
    mov edx, 2
    int 0x80
    
    ;Convert user choice to numeric value
    cmp byte [lunchOption], '1'
    jb invalidChoice
    cmp byte [lunchOption], '9'
    ja invalidChoice
    
	
	; Calculate and print the price
    	call _calculateLunchPrice
    
    ; Exit the program
    jmp exit_program
    
    ; Invalid choice
    call _invalidChoice
    jmp exit_program
    
Dinner:
    ; Handle dinner option
    ; ...

Snack:
    ; Handle snack option
    ; ...

SweetMeat:
    ; Handle sweet meat option
    ; ...

Drinks:
    ; Handle drinks option
    ; ...

_invalidChoice:
    ; Print invalid choice message
    mov eax, 4
    mov ebx, 1
    mov ecx, Invalid
    mov edx, Invalid_length
    int 0x80
    jmp exit_program
    ret


_calculatePrice:
    ; Get the selected option from the choice register
    movzx eax, byte [choice]

    ; Calculate the price based on the selected option
    cmp eax, '1'
    je _option1
    cmp eax, '2'
    je _option2
    cmp eax, '3'
    je _option3
    cmp eax, '4'
    je _option4
    cmp eax, '5'
    je _option5
    cmp eax, '6'
    je _option6
    cmp eax, '7'
    je _option7
    cmp eax, '8'
    je _option8
    cmp eax, '9'
    je _option9

    ret

_option1:
    movzx eax, word [BrkfastOpt1Price]
    jmp calculatePriceDone

_option2:
    movzx eax, word [BrkfastOpt2Price]
    jmp calculatePriceDone

_option3:
    movzx eax, word [BrkfastOpt3Price]
    jmp calculatePriceDone

_option4:
    movzx eax, word [BrkfastOpt4Price]
    jmp calculatePriceDone

_option5:
    movzx eax, word [BrkfastOpt5Price]
    jmp calculatePriceDone

_option6:
    movzx eax, word [BrkfastOpt6Price]
    jmp calculatePriceDone

_option7:
    movzx eax, word [BrkfastOpt7Price]
    jmp calculatePriceDone

_option8:
    movzx eax, word [BrkfastOpt8Price]
    jmp calculatePriceDone

_option9:
    movzx eax, word [BrkfastOpt9Price]
    jmp calculatePriceDone

calculatePriceDone:
    ; Convert the price to a string
    mov edi, choice
    mov ebx, 10
    add edi, 2

.convertPrice:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .convertPrice

    ; Calculate the length of the price string
    mov eax, edi
    sub eax, choice
    neg eax

    ; Output the total price message
    mov eax, 4
    mov ebx, 1
    mov ecx, priceMessage
    mov edx, priceMessage_length
    int 0x80

    ; Output the total price
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, eax
    int 0x80    
    
    jmp exit_program
    
  ;calculating the price of Lunch Options
_calculateLunchPrice:
    ; Get the selected option from the choice register
    movzx eax, byte [choice]

    ; Calculate the price based on the selected option
    cmp eax, '1'
    je _Lunchoption1
    cmp eax, '2'
    je _Lunchoption2
    cmp eax, '3'
    je _Lunchoption3
    cmp eax, '4'
    je _Lunchoption4
    cmp eax, '5'
    je _Lunchoption5
    cmp eax, '6'
    je _Lunchoption6
    cmp eax, '7'
    je _Lunchoption7
    cmp eax, '8'
    je _Lunchoption8
    cmp eax, '9'
    je _Lunchoption9

    ret

_Lunchoption1:
    movzx eax, word [LunchOpt1Price]
    jmp LunchcalculatePriceDone

_Lunchoption2:
    movzx eax, word [LunchOpt2Price]
    jmp LunchcalculatePriceDone

_Lunchoption3:
    movzx eax, word [LunchOpt3Price]
    jmp LunchcalculatePriceDone

_Lunchoption4:
    movzx eax, word [LunchOpt4Price]
    jmp LunchcalculatePriceDone

_Lunchoption5:
    movzx eax, word [LunchOpt5Price]
    jmp LunchcalculatePriceDone

_Lunchoption6:
    movzx eax, word [LunchOpt6Price]
    jmp LunchcalculatePriceDone

_Lunchoption7:
    movzx eax, word [LunchOpt7Price]
    jmp LunchcalculatePriceDone

_Lunchoption8:
    movzx eax, word [LunchOpt8Price]
    jmp LunchcalculatePriceDone

_Lunchoption9:
    movzx eax, word [LunchOpt9Price]
    jmp LunchcalculatePriceDone

LunchcalculatePriceDone:
    ; Convert the price to a string
    mov edi, choice
    mov ebx, 10
    add edi, 2

.convertPrice:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .convertPrice

    ; Calculate the length of the price string
    mov eax, edi
    sub eax, choice
    neg eax

    ; Output the total price message
    mov eax, 4
    mov ebx, 1
    mov ecx, priceMessage
    mov edx, priceMessage_length
    int 0x80

    ; Output the total price
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, eax
    int 0x80

    jmp exit_program
