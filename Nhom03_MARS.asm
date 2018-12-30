
################### Data segment #####################
.data
name_prompt: 	.asciiz "Nhap chuoi : "
out_msg: 	.asciiz "Chuoi sau khi chuyen : "
in_name: 	.space 1001 # space for input string
################### Code segment #####################
.text
.globl main
main:
	la 	$a0,name_prompt 	# xuat yeu cau nhap chuoi
	li 	$v0,4
	syscall

	la 	$a0,in_name 		# read the input string
	li	$a1,1001		# at most 1000 chars + 1 null char
	li 	$v0,8
	syscall


	la 	$t0,in_name

loop:
	lb 	$t1,($t0)
	beqz 	$t1,exit_loop 	# if NULL, we are done
	blt 	$t1,'a',case1
	bgt 	$t1,'z',case2
	addiu 	$t1,$t1,-32 	#  'A'='a'-32
	sb 	$t1,($t0)
	j 	case2
case1:				# khong phai ki tu thuong
	blt 	$t1,'A',case2
	bgt 	$t1,'Z',case2
	addiu 	$t1,$t1,32 	#  'a'='A'+32
	sb 	$t1,($t0)
case2:				# tang index
	addiu 	$t0,$t0,1 	# increment pointer
	j 	loop


exit_loop:

	la 	$a0,out_msg 	# write output message
	li 	$v0,4
	syscall

	la 	$a0,in_name 	# output converted string
	li 	$v0,4
	syscall

	li 	$v0,10 		# exit program
	syscall
