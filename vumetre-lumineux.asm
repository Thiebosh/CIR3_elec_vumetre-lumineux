;*******************************************************************************
;                                                                              *
;    Microchip licenses this software to you solely for use with Microchip     *
;    products. The software is owned by Microchip and/or its licensors, and is *
;    protected under applicable copyright laws.  All rights reserved.          *
;                                                                              *
;    This software and any accompanying information is for suggestion only.    *
;    It shall not be deemed to modify Microchip?s standard warranty for its    *
;    products.  It is your responsibility to ensure that this software meets   *
;    your requirements.                                                        *
;                                                                              *
;    SOFTWARE IS PROVIDED "AS IS".  MICROCHIP AND ITS LICENSORS EXPRESSLY      *
;    DISCLAIM ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING  *
;    BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS    *
;    FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL          *
;    MICROCHIP OR ITS LICENSORS BE LIABLE FOR ANY INCIDENTAL, SPECIAL,         *
;    INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO     *
;    YOUR EQUIPMENT, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR    *
;    SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY   *
;    DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER      *
;    SIMILAR COSTS.                                                            *
;                                                                              *
;    To the fullest extend allowed by law, Microchip and its licensors         *
;    liability shall not exceed the amount of fee, if any, that you have paid  *
;    directly to Microchip to use this software.                               *
;                                                                              *
;    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF    *
;    THESE TERMS.                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Filename:                                                                 *
;    Date:                                                                     *
;    File Version:                                                             *
;    Author:                                                                   *
;    Company:                                                                  *
;    Description:                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Notes: In the MPLAB X Help, refer to the MPASM Assembler documentation    *
;    for information on assembly instructions.                                 *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Known Issues: This template is designed for relocatable code.  As such,   *
;    build errors such as "Directive only allowed when generating an object    *
;    file" will result when the 'Build in Absolute Mode' checkbox is selected  *
;    in the project properties.  Designing code in absolute mode is            *
;    antiquated - use relocatable mode.                                        *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Revision History:                                                         *
;                                                                              *
;*******************************************************************************



;*******************************************************************************
; Processor Inclusion
;
; TODO Step #1 Open the task list under Window > Tasks.  Include your
; device .inc file - e.g. #include <device_name>.inc.  Available
; include files are in C:\Program Files\Microchip\MPLABX\mpasmx
; assuming the default installation path for MPLAB X.  You may manually find
; the appropriate include file for your device here and include it, or
; simply copy the include generated by the configuration bits
; generator (see Step #2).
;
;*******************************************************************************

; TODO INSERT INCLUDE CODE HERE
#include "p18F25K40.inc"

;*******************************************************************************
;
; TODO Step #2 - Configuration Word Setup
;
; The 'CONFIG' directive is used to embed the configuration word within the
; .asm file. MPLAB X requires users to embed their configuration words
; into source code.  See the device datasheet for additional information
; on configuration word settings.  Device configuration bits descriptions
; are in C:\Program Files\Microchip\MPLABX\mpasmx\P<device_name>.inc
; (may change depending on your MPLAB X installation directory).
;
; MPLAB X has a feature which generates configuration bits source code.  Go to
; Window > PIC Memory Views > Configuration Bits.  Configure each field as
; needed and select 'Generate Source Code to Output'.  The resulting code which
; appears in the 'Output Window' > 'Config Bits Source' tab may be copied
; below.
;
;*******************************************************************************

; TODO INSERT CONFIG HERE

; PIC18F25K40 Configuration Bit Settings

; Assembly source line config statements

; CONFIG1L
  CONFIG  FEXTOSC = OFF         ; External Oscillator mode Selection bits (Oscillator not enabled)
  CONFIG  RSTOSC = HFINTOSC_64MHZ; Power-up default value for COSC bits (HFINTOSC with HFFRQ = 4 MHz and CDIV = 4:1)

; CONFIG1H
  CONFIG  CLKOUTEN = ON         ; Clock Out Enable bit (CLKOUT function is enabled)
  CONFIG  CSWEN = ON            ; Clock Switch Enable bit (Writing to NOSC and NDIV is allowed)
  CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)

; CONFIG2L
  CONFIG  MCLRE = EXTMCLR       ; Master Clear Enable bit (If LVP = 0, MCLR pin is MCLR; If LVP = 1, RE3 pin function is MCLR )
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable bit (Power up timer disabled)
  CONFIG  LPBOREN = OFF         ; Low-power BOR enable bit (ULPBOR disabled)
  CONFIG  BOREN = SBORDIS       ; Brown-out Reset Enable bits (Brown-out Reset enabled , SBOREN bit is ignored)

; CONFIG2H
  CONFIG  BORV = VBOR_2P45      ; Brown Out Reset Voltage selection bits (Brown-out Reset Voltage (VBOR) set to 2.45V)
  CONFIG  ZCD = OFF             ; ZCD Disable bit (ZCD disabled. ZCD can be enabled by setting the ZCDSEN bit of ZCDCON)
  CONFIG  PPS1WAY = ON          ; PPSLOCK bit One-Way Set Enable bit (PPSLOCK bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle)
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  DEBUG = OFF           ; Debugger Enable bit (Background debugger disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Extended Instruction Set and Indexed Addressing Mode disabled)

; CONFIG3L
  CONFIG  WDTCPS = WDTCPS_31    ; WDT Period Select bits (Divider ratio 1:65536; software control of WDTPS)
  CONFIG  WDTE = OFF            ; WDT operating mode (WDT Disabled)

; CONFIG3H
  CONFIG  WDTCWS = WDTCWS_7     ; WDT Window Select bits (window always open (100%); software control; keyed access not required)
  CONFIG  WDTCCS = SC           ; WDT input clock selector (Software Control)

; CONFIG4L
  CONFIG  WRT0 = OFF            ; Write Protection Block 0 (Block 0 (000800-001FFFh) not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection Block 1 (Block 1 (002000-003FFFh) not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection Block 2 (Block 2 (004000-005FFFh) not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection Block 3 (Block 3 (006000-007FFFh) not write-protected)

; CONFIG4H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-30000Bh) not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot Block (000000-0007FFh) not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not write-protected)
  CONFIG  SCANE = ON            ; Scanner Enable bit (Scanner module is available for use, SCANMD bit can control the module)
  CONFIG  LVP = OFF             ; Low Voltage Programming Enable bit (HV on MCLR/VPP must be used for programming)

; CONFIG5L
  CONFIG  CP = OFF              ; UserNVM Program Memory Code Protection bit (UserNVM code protection disabled)
  CONFIG  CPD = OFF             ; DataNVM Memory Code Protection bit (DataNVM code protection disabled)

; CONFIG5H

; CONFIG6L
  CONFIG  EBTR0 = OFF           ; Table Read Protection Block 0 (Block 0 (000800-001FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection Block 1 (Block 1 (002000-003FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection Block 2 (Block 2 (004000-005FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection Block 3 (Block 3 (006000-007FFFh) not protected from table reads executed in other blocks)

; CONFIG6H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot Block (000000-0007FFh) not protected from table reads executed in other blocks)


;*******************************************************************************
;
; TODO Step #3 - Variable Definitions
;
; Refer to datasheet for available data memory (RAM) organization assuming
; relocatible code organization (which is an option in project
; properties > mpasm (Global Options)).  Absolute mode generally should
; be used sparingly.
;
; Example of using GPR Uninitialized Data
;
;   GPR_VAR        UDATA
;   MYVAR1         RES        1      ; User variable linker places
;   MYVAR2         RES        1      ; User variable linker places
;   MYVAR3         RES        1      ; User variable linker places
;
;   ; Example of using Access Uninitialized Data Section (when available)
;   ; The variables for the context saving in the device datasheet may need
;   ; memory reserved here.
;   INT_VAR        UDATA_ACS
;   W_TEMP         RES        1      ; w register for context saving (ACCESS)
;   STATUS_TEMP    RES        1      ; status used for context saving
;   BSR_TEMP       RES        1      ; bank select used for ISR context saving
;
;*******************************************************************************

; TODO PLACE VARIABLE DEFINITIONS GO HERE
INT_VAR        UDATA_ACS
temp RES 1
filbleu RES 1
var0 RES 1
var1 RES 1
varW0 RES 1
varW1 RES 1
puissanceB RES 1
puissanceMB RES 1
puissanceMH RES 1
puissanceA RES 1
RESULTHIGH RES 1
RESULTLOW RES 1
result8 RES 1
  
;*******************************************************************************
; Reset Vector
;*******************************************************************************

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    STARTPRGM                   ; go to beginning of program

;*******************************************************************************
; TODO Step #4 - Interrupt Service Routines
;
; There are a few different ways to structure interrupt routines in the 8
; bit device families.  On PIC18's the high priority and low priority
; interrupts are located at 0x0008 and 0x0018, respectively.  On PIC16's and
; lower the interrupt is at 0x0004.  Between device families there is subtle
; variation in the both the hardware supporting the ISR (for restoring
; interrupt context) as well as the software used to restore the context
; (without corrupting the STATUS bits).
;
; General formats are shown below in relocatible format.
;
;------------------------------PIC16's and below--------------------------------
;
; ISR       CODE    0x0004           ; interrupt vector location
;
;     <Search the device datasheet for 'context' and copy interrupt
;     context saving code here.  Older devices need context saving code,
;     but newer devices like the 16F#### don't need context saving code.>
;
;     RETFIE
;
;----------------------------------PIC18's--------------------------------------
;
; ISRHV     CODE    0x0008
;     GOTO    HIGH_ISR
; ISRLV     CODE    0x0018
;     GOTO    LOW_ISR
;
; ISRH      CODE                     ; let linker place high ISR routine
; HIGH_ISR
;     <Insert High Priority ISR Here - no SW context saving>
;     RETFIE  FAST
;
; ISRL      CODE                     ; let linker place low ISR routine
; LOW_ISR
;       <Search the device datasheet for 'context' and copy interrupt
;       context saving code here>
;     RETFIE
;
;*******************************************************************************

; TODO INSERT ISR HERE

ZERO
    BSF LATB, 5
    NOP
    NOP
    NOP
    BCF LATB, 5
RETURN 1
    
UN
    BSF LATB, 5
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    BCF LATB, 5
RETURN 1
    
Ruban_LED
    MOVWF filbleu
    MOVLW b'00000000'
    MOVWF temp
    parcours
	BTFSC filbleu, 0
	GOTO un
	BTFSS filbleu, 0
	CALL ZERO
	GOTO suite
	
	un
	CALL UN
	NOP
	
	suite
	INCF temp
	RLNCF filbleu,1,0
	MOVLW 8
	CPFSEQ temp
    GOTO parcours
RETURN 1
    
LED_VERTE
    MOVLW b'00100000'
    CALL Ruban_LED, FAST;moins d instructions
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_NOIRE
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_ROUGE
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'01100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_BLEUE
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_BLANCHE
    MOVLW b'00000100'
    CALL Ruban_LED, FAST
    MOVLW b'00000100'
    CALL Ruban_LED, FAST
    MOVLW b'00000100'
    CALL Ruban_LED, FAST
    MOVLW b'00000100'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_JAUNE
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_ORANGE
    MOVLW b'00001000'
    CALL Ruban_LED, FAST
    MOVLW b'00011110'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_VIOLETTE
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_CYAN
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
    MOVLW b'00100000'
    CALL Ruban_LED, FAST
    MOVLW b'00000000'
    CALL Ruban_LED, FAST
RETURN 1
    
LED_END
 
    MOVLW d'5'
    MOVFF WREG,var0

    boucle0
    MOVLW d'255'
    MOVFF WREG,var1

    boucle1
    DECFSZ var1
    GOTO boucle1
    DECFSZ var0
    GOTO boucle0
 RETURN
 
 
    
LED_WAIT
 
    MOVLW d'1'
    MOVFF WREG,varW0

    boucleW0
    MOVLW d'255'
    MOVFF WREG,varW1

    boucleW1
    CALL LED_END
    DECFSZ varW1
    GOTO boucleW1
    DECFSZ varW0
    GOTO boucleW0
 RETURN
 
 ZERO_DE_PUISSANCE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 UN_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 DEUX_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 TROIS_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 QUATRE_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 CINQ_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 SIX_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
 RETURN 1
 
 SEPT_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ORANGE
    CALL LED_NOIRE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ORANGE
    CALL LED_NOIRE
 RETURN 1
 
 HUIT_DE_PUISSANCE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ORANGE
    CALL LED_ROUGE
    CALL LED_VIOLETTE
    CALL LED_BLEUE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ORANGE
    CALL LED_ROUGE
 RETURN 1
 

 BASSES
    MOVLW 0
    CPFSEQ puissanceB
    GOTO suiteB
    CALL ZERO_DE_PUISSANCE
    
    suiteB
    MOVLW 1
    CPFSEQ puissanceB
    GOTO suiteB1
    CALL UN_DE_PUISSANCE
    
    suiteB1
    MOVLW 2
    CPFSEQ puissanceB
    GOTO suiteB2
    CALL DEUX_DE_PUISSANCE
    
    suiteB2
    MOVLW 3
    CPFSEQ puissanceB
    GOTO suiteB3
    CALL TROIS_DE_PUISSANCE
    
    suiteB3
    MOVLW 4
    CPFSEQ puissanceB
    GOTO suiteB4
    CALL QUATRE_DE_PUISSANCE
    
    suiteB4
    MOVLW 5
    CPFSEQ puissanceB
    GOTO suiteB5
    CALL CINQ_DE_PUISSANCE
    
    suiteB5
    MOVLW 6
    CPFSEQ puissanceB
    GOTO suiteB6
    CALL SIX_DE_PUISSANCE
    
    suiteB6
    MOVLW 7
    CPFSEQ puissanceB
    GOTO suiteB7
    CALL SEPT_DE_PUISSANCE
    
    suiteB7
    MOVLW 8
    CPFSEQ puissanceB
    GOTO suiteB8
    CALL HUIT_DE_PUISSANCE
    
    suiteB8
 RETURN 1
 

 MEDIUM_BAS
    MOVLW 0
    CPFSEQ puissanceMB
    GOTO suiteMB
    CALL ZERO_DE_PUISSANCE
    
    suiteMB
    MOVLW 1
    CPFSEQ puissanceMB
    GOTO suiteMB1
    CALL UN_DE_PUISSANCE
    
    suiteMB1
    MOVLW 2
    CPFSEQ puissanceMB
    GOTO suiteMB2
    CALL DEUX_DE_PUISSANCE
    
    suiteMB2
    MOVLW 3
    CPFSEQ puissanceMB
    GOTO suiteMB3
    CALL TROIS_DE_PUISSANCE
    
    suiteMB3
    MOVLW 4
    CPFSEQ puissanceMB
    GOTO suiteMB4
    CALL QUATRE_DE_PUISSANCE
    
    suiteMB4
    MOVLW 5
    CPFSEQ puissanceMB
    GOTO suiteMB5
    CALL CINQ_DE_PUISSANCE
    
    suiteMB5
    MOVLW 6
    CPFSEQ puissanceMB
    GOTO suiteMB6
    CALL SIX_DE_PUISSANCE
    
    suiteMB6
    MOVLW 7
    CPFSEQ puissanceMB
    GOTO suiteMB7
    CALL SEPT_DE_PUISSANCE
    
    suiteMB7
    MOVLW 8
    CPFSEQ puissanceMB
    GOTO suiteMB8
    CALL HUIT_DE_PUISSANCE
    
    suiteMB8
 
 RETURN 1
 

 MEDIUM_HAUT
    MOVLW 0
    CPFSEQ puissanceMH
    GOTO suiteMH
    CALL ZERO_DE_PUISSANCE
    
    suiteMH
    MOVLW 1
    CPFSEQ puissanceMH
    GOTO suiteMH1
    CALL UN_DE_PUISSANCE
    
    suiteMH1
    MOVLW 2
    CPFSEQ puissanceMH
    GOTO suiteMH2
    CALL DEUX_DE_PUISSANCE
    
    suiteMH2
    MOVLW 3
    CPFSEQ puissanceMH
    GOTO suiteMH3
    CALL TROIS_DE_PUISSANCE
    
    suiteMH3
    MOVLW 4
    CPFSEQ puissanceMH
    GOTO suiteMH4
    CALL QUATRE_DE_PUISSANCE
    
    suiteMH4
    MOVLW 5
    CPFSEQ puissanceMH
    GOTO suiteMH5
    CALL CINQ_DE_PUISSANCE
    
    suiteMH5
    MOVLW 6
    CPFSEQ puissanceMH
    GOTO suiteMH6
    CALL SIX_DE_PUISSANCE
    
    suiteMH6
    MOVLW 7
    CPFSEQ puissanceMH
    GOTO suiteMH7
    CALL SEPT_DE_PUISSANCE
    
    suiteMH7
    MOVLW 8
    CPFSEQ puissanceMH
    GOTO suiteMH8
    CALL HUIT_DE_PUISSANCE
    
    suiteMH8
 
 RETURN 1
 

 AIGUS
    MOVLW 0
    CPFSEQ puissanceA
    GOTO suiteA
    CALL ZERO_DE_PUISSANCE
    
    suiteA
    MOVLW 1
    CPFSEQ puissanceA
    GOTO suiteA1
    CALL UN_DE_PUISSANCE
    
    suiteA1
    MOVLW 2
    CPFSEQ puissanceA
    GOTO suiteA2
    CALL DEUX_DE_PUISSANCE
    
    suiteA2
    MOVLW 3
    CPFSEQ puissanceA
    GOTO suiteA3
    CALL TROIS_DE_PUISSANCE
    
    suiteA3
    MOVLW 4
    CPFSEQ puissanceA
    GOTO suiteA4
    CALL QUATRE_DE_PUISSANCE
    
    suiteA4
    MOVLW 5
    CPFSEQ puissanceA
    GOTO suiteA5
    CALL CINQ_DE_PUISSANCE
    
    suiteA5
    MOVLW 6
    CPFSEQ puissanceA
    GOTO suiteA6
    CALL SIX_DE_PUISSANCE
    
    suiteA6
    MOVLW 7
    CPFSEQ puissanceA
    GOTO suiteA7
    CALL SEPT_DE_PUISSANCE
    
    suiteA7
    MOVLW 8
    CPFSEQ puissanceA
    GOTO suiteA8
    CALL HUIT_DE_PUISSANCE
    
    suiteA8
 
 RETURN 1
 

 
 TEST_VOLUME
    MOVLW 6
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 3
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 8 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 1
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 7
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 4
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 7 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 2
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 8
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 5
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 6 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 1
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 6
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 6
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 4 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 3
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 4
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 7
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 2 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 5
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 3
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 7
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 1 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 4
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 4
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 7
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 3 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 2
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 5
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 4
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 6 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 0
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   
   
   MOVLW 6
    MOVWF puissanceB
   CALL BASSES,FAST
   MOVLW 3
    MOVWF puissanceMB
   CALL MEDIUM_BAS, FAST
   MOVLW 8 
    MOVWF puissanceMH
   CALL MEDIUM_HAUT, FAST
   MOVLW 1
    MOVWF puissanceA
   CALL AIGUS, FAST
   
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   
   ;CALL SMILEY
 RETURN 1
 
 
 
 ADC_BASSES
    BANKSEL ADPCH
    MOVLW b'00000000'
    MOVWF ADPCH,1
    BANKSEL ANSELA
    BSF ANSELA,0
    BSF ADCON0,ADGO 
    labelB
    BTFSC ADCON0,ADGO 
    GOTO labelB 
    BANKSEL ADRESH 
    MOVF ADRESH,W 
    MOVWF RESULTHIGH ;changer RESULTHI en RESULTBHI, RESULTMBHI etc...
    BANKSEL ADRESL 
    MOVF ADRESL,W 
    MOVWF RESULTLOW ;pareil
 RETURN 1
 
 ADC_MEDIUM_BAS
    BANKSEL ADPCH
    MOVLW b'00000001'
    MOVWF ADPCH,1
    BANKSEL ANSELA 
    BSF ANSELA,1
    BSF ADCON0,ADGO 
    labelMB
    BTFSC ADCON0,ADGO 
    GOTO labelMB 
    BANKSEL ADRESH 
    MOVF ADRESH,W 
    MOVWF RESULTHIGH ;changer RESULTHI en RESULTBHI, RESULTMBHI etc...
    BANKSEL ADRESL 
    MOVF ADRESL,W 
    MOVWF RESULTLOW ;pareil
 RETURN 1

 
 ADC_MEDIUM_HAUT
    BANKSEL ADPCH
    MOVLW b'00000010'
    MOVWF ADPCH,1
    BANKSEL ANSELA 
    BSF ANSELA,2 
    BSF ADCON0,ADGO 
    labelMH
    BTFSC ADCON0,ADGO 
    GOTO labelMH 
    BANKSEL ADRESH 
    MOVF ADRESH,W 
    MOVWF RESULTHIGH ;changer RESULTHI en RESULTBHI, RESULTMBHI etc...
    BANKSEL ADRESL 
    MOVF ADRESL,W 
    MOVWF RESULTLOW ;pareil
 RETURN 1
 
 ADC_AIGUS
    BANKSEL ADPCH
    MOVLW b'00000011'
    MOVWF ADPCH,1
    BANKSEL ANSELA
    BSF ANSELA,3
    BSF ADCON0,ADGO 
    labelA
    BTFSC ADCON0,ADGO 
    GOTO labelA 
    BANKSEL ADRESH 
    MOVF ADRESH,W 
    MOVWF RESULTHIGH ;changer RESULTHI en RESULTBHI, RESULTMBHI etc...
    BANKSEL ADRESL 
    MOVF ADRESL,W 
    MOVWF RESULTLOW ;pareil
 RETURN 1
 
 FROM1024TO8
    MOVLW b'00000000'
    CPFSGT RESULTHIGH
    GOTO OO
    MOVLW b'00000001'
    CPFSGT RESULTHIGH
    GOTO Ol
    MOVLW b'00000010'
    CPFSGT RESULTHIGH
    GOTO lO
    MOVLW b'00000011'
    CPFSGT RESULTHIGH
    GOTO ll
    
    OO
    BTFSS RESULTLOW, 7
    GOTO ZERO_OU_UN
    BTFSC RESULTLOW, 7
    RETLW 2
    GOTO fin8
    
    Ol
    BTFSS RESULTLOW, 7
    RETLW 3
    BTFSC RESULTLOW, 7
    RETLW 4
    GOTO fin8
    
    lO
    BTFSS RESULTLOW, 7
    RETLW 5
    BTFSC RESULTLOW, 7
    RETLW 6
    GOTO fin8
    
    ll
    BTFSS RESULTLOW, 7
    RETLW 7
    BTFSC RESULTLOW, 7
    RETLW 8
    GOTO fin8
    
    ZERO_OU_UN
    BTFSS RESULTLOW, 6
    BTFSC RESULTLOW, 5
    GOTO its1
    RETLW 0
    GOTO fin8
    its1
    RETLW 1
    fin8
    ;MOVWF result8
 RETURN 1
 
 
 GETSIGNALS
    CLRF RESULTHIGH
    CLRF RESULTLOW
    CALL ADC_BASSES
    CALL FROM1024TO8
    MOVWF puissanceB
    
    CLRF RESULTHIGH
    CLRF RESULTLOW
    CALL ADC_MEDIUM_BAS
    CALL FROM1024TO8
    MOVWF puissanceMB
    
    CLRF RESULTHIGH
    CLRF RESULTLOW
    CALL ADC_MEDIUM_HAUT
    CALL FROM1024TO8
    MOVWF puissanceMH
    
    CLRF RESULTHIGH
    CLRF RESULTLOW
    CALL ADC_AIGUS
    CALL FROM1024TO8
    MOVWF puissanceA
    
    CALL BASSES
    CALL MEDIUM_BAS
    CALL MEDIUM_HAUT
    CALL AIGUS
    CALL LED_END
 RETURN 1
 
 
 
 
 
 POCE_BLO
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
 RETURN
 
 FACEBOOK
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    
 RETURN
 
 YOUTUBE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_NOIRE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
        
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_NOIRE
    
 RETURN
 
 TWEETER
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLANCHE
    CALL LED_BLANCHE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    
 RETURN
 
 
 
 
 RESEAUX_SOCIAUX
   CALL POCE_BLO
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT 
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL TWEETER
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT 
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL YOUTUBE
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT 
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL FACEBOOK
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT 
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT
   CALL LED_WAIT 
 RETURN
 
 
 CUBE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_ROUGE
    
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_VERTE
    CALL LED_JAUNE
    
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    CALL LED_JAUNE
    
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
 RETURN
    
    
    
 
 
 
 
  SMILEY
 ;boucle_smiley
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
 
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
 
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
 
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
 
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_BLEUE
 
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_NOIRE
 
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_BLEUE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    
    
    
    
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
 
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
 
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_ROUGE
 
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
 
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
 
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_ROUGE
 
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_NOIRE
 
    CALL LED_NOIRE
    CALL LED_NOIRE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_ROUGE
    CALL LED_NOIRE
    CALL LED_NOIRE
    
    
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
    CALL LED_WAIT
 ;GOTO boucle_smiley
 RETURN 1
 
 
 
 
;*******************************************************************************
; MAIN PROGRAM
;*******************************************************************************

MAIN_PROG CODE                      ; let linker place main program

STARTPRGM

    ; TODO Step #5 - Insert Your Program Here

    BANKSEL ADCON0 
    MOVLW b'10000100'
    MOVWF ADCON0,1 
    BANKSEL ADCON1 
    MOVLW b'00000000' 
    MOVWF ADCON1,1
    BANKSEL ADCLK
    MOVLW b'00111111'
    MOVWF ADCLK,1
    BANKSEL ADCON2
    MOVLW b'00000000'
    MOVWF ADCON2,1
    BANKSEL ADACQ
    CLRF ADACQ,1
    BANKSEL ADPRE
    CLRF ADPRE,1
    BANKSEL ADREF
    MOVLW b'00010011'
    MOVWF ADREF,1
    BANKSEL FVRCON
    MOVLW b'11000010'
    MOVWF FVRCON,1

   MOVLW b'00000000'
   MOVWF OSCCON1


   ;MOVLW b'00000000'
   ;MOVWF TRISC

   ;MOVLW b'11111111'
   ;MOVWF LATC

   MOVLW b'11001111'
   MOVWF TRISB

   ;MOVLW b'00010000'
   ;MOVWF LATB


   MOVLW b'11111111'
   MOVWF TRISA

   clignote
      CALL Ruban_LED
      ;CALL GETSIGNALS
      ;CALL TEST_VOLUME
      ;CALL CUBE
      ;CALL RESEAUX_SOCIAUX

   GOTO clignote
   END
   