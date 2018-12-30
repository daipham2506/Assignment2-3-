$LC0:
        .ascii  "Nhap chuoi: \000"
$LC1:
        .ascii  "Chuoi sau khi da chuyen la: %s\000"
main:
        addiu   $sp,$sp,-2040
        sw      $31,2036($sp)
        sw      $fp,2032($sp)
        move    $fp,$sp
        sw      $0,1028($fp)
        addiu   $2,$fp,1032
        li      $3,996                  # 0x3e4
        move    $6,$3
        move    $5,$0
        move    $4,$2
        jal     memset
        nop

        lui     $2,%hi($LC0)
        addiu   $4,$2,%lo($LC0)
        jal     printf
        nop

        lui     $2,%hi(stdin)
        lw      $3,%lo(stdin)($2)
        addiu   $2,$fp,28
        move    $6,$3
        li      $5,1000           # 0x3e8
        move    $4,$2
        jal     fgets
        nop

        sw      $0,24($fp)
        b       $L2
        nop

$L6:
        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        slt     $2,$2,91
        beq     $2,$0,$L3
        nop

        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        slt     $2,$2,65
        bne     $2,$0,$L3
        nop

        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        andi    $2,$2,0x00ff
        addiu   $2,$2,32
        andi    $2,$2,0x00ff
        sll     $3,$2,24
        sra     $3,$3,24
        lw      $2,24($fp)
        addiu   $4,$fp,24
        addu    $2,$4,$2
        sb      $3,1004($2)
        b       $L4
        nop

$L3:
        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        slt     $2,$2,123
        beq     $2,$0,$L5
        nop

        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        slt     $2,$2,97
        bne     $2,$0,$L5
        nop

        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        andi    $2,$2,0x00ff
        addiu   $2,$2,-32
        andi    $2,$2,0x00ff
        sll     $3,$2,24
        sra     $3,$3,24
        lw      $2,24($fp)
        addiu   $4,$fp,24
        addu    $2,$4,$2
        sb      $3,1004($2)
        b       $L4
        nop

$L5:
        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $3,4($2)
        lw      $2,24($fp)
        addiu   $4,$fp,24
        addu    $2,$4,$2
        sb      $3,1004($2)
$L4:
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
$L2:
        lw      $2,24($fp)
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lb      $2,4($2)
        nop
        bne     $2,$0,$L6
        nop

        addiu   $2,$fp,1028
        move    $5,$2
        lui     $2,%hi($LC1)
        addiu   $4,$2,%lo($LC1)
        jal     printf
        nop

        jal     _getch
        nop

        nop
        move    $sp,$fp
        lw      $31,2036($sp)
        lw      $fp,2032($sp)
        addiu   $sp,$sp,2040
        j       $31
        nop