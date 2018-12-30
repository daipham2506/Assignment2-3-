################# Data segment #####################
.data
xa: .float 0
xb: .float 0
xc: .float 0
xd: .float 0
ya: .float 0
yb: .float 0
yc: .float 0
yd: .float 0
ab: .float 0
bc: .float 0
cd: .float 0
da: .float 0

txt_dientich: .asciiz "Square Area is: "


#cac cau nhac du lieu 
Nhac_xa: .asciiz "Nhap xa: "
Nhac_ya: .asciiz "Nhap ya: "
Nhac_xb: .asciiz "Nhap xb: "
Nhac_yb: .asciiz "Nhap yb: "
Nhac_xc: .asciiz "Nhap xc: "
Nhac_yc: .asciiz "Nhap yc: "
Nhac_xd: .asciiz "Nhap xd: "
Nhac_yd: .asciiz "Nhap yd: "


################# Code segment #####################
.text
.globl main
main: # main program entry

la $a0,Nhac_xa
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,xa 

la $a0,Nhac_ya
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,ya

la $a0,Nhac_xb
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,xb 


la $a0,Nhac_yb
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,yb 

la $a0,Nhac_xc
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,xc


la $a0,Nhac_yc
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,yc

la $a0,Nhac_xd
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,xd


la $a0,Nhac_yd
li $v0,4
syscall

li $v0, 6 # Read float
syscall # $f0 = value read
swc1 $f0,yd

#xu li

		
	#  dien tich tu giac ABCD   
	# p=(ab+bc+cd+da)/2
	# S=sqrt( (p-ab)(p-bc)(p-cd)(p-da) ) 
	lui $t0,0x0000
	mtc1 $t0,$f9  #$f9 = $t0= 0.0
	
	
	
	lwc1 $f1,xa
	lwc1 $f2,ya
	lwc1 $f3,xb
	lwc1 $f4,yb
	jal distance 
	swc1 $f0,ab
	lwc1 $f5,ab
 	add.s $f9,$f9,$f5
	
	lwc1 $f1,xb
	lwc1 $f2,yb
	lwc1 $f3,xc
	lwc1 $f4,yc
	jal distance
	swc1 $f0,bc
	lwc1 $f5,bc
	add.s $f9,$f9,$f5
	
	
	lwc1 $f1,xc
	lwc1 $f2,yc
	lwc1 $f3,xd
	lwc1 $f4,yd
	jal distance
	swc1 $f0,cd
	lwc1 $f5,cd
	add.s $f9,$f9,$f5
	
	lwc1 $f1,xd
	lwc1 $f2,yd
	lwc1 $f3,xa
	lwc1 $f4,ya
	jal distance
	swc1 $f0,da
	lwc1 $f5,da
	add.s $f9,$f9,$f5
	
	lui $t0,0x4000
	mtc1 $t0,$f1  #$f1 = $t0= 2.0
	
	
	div.s $f9,$f9,$f1   # $f9 = p=(ab+bc+cd+da)/2
	
	
	lwc1 $f5,ab
	sub.s $f6,$f9,$f5   # (p-ab)
	
	lwc1 $f5,bc
	sub.s $f7,$f9,$f5  # p-bc
	
	lwc1 $f5,cd
	sub.s $f8,$f9,$f5 # p-cd
	
	lwc1 $f5,da
	sub.s $f10,$f9,$f5 # p-da
	
	mul.s $f2,$f6,$f7
	mul.s $f2,$f2,$f8
	mul.s $f2,$f2,$f10  # $f2=(p-ab)(p-bc)(p-cd)(p-da)
	
	sqrt.s $f3,$f2  # $f3 = S
	
	la $a0,txt_dientich
	li $v0,4
	syscall
	
	mov.s $f12,$f3
	li $v0,2
	syscall
				
	li $v0, 10 # Exit program
	syscall
	
	
	
	

#===============DISTANCE===============
	#float distance(float x1,x2,y1,y2)
	#f1=x1 f2=y1  f3=x2 f4=y2
	# f0 tra ve
distance:
	sub.s $f5,$f1,$f3
	mul.s $f5,$f5,$f5
	
	sub.s $f6,$f2,$f4
	mul.s $f6,$f6,$f6
	
	add.s $f7,$f5,$f6
	
	sqrt.s $f7,$f7
	
	mov.s $f0,$f7
	jr $ra
	
	
	
	
	