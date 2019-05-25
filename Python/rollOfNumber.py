#!/usr/bin/env python3

#	Task	#
#	You should write five-digit number and you can show in reverse

while True:
	number = int(input("Введите пятизначное число: "))

	if (number < 10000 and number > 0 or number > 99999):
		print("Wrong number")
		continue
	elif number == 0:
		break
	else:
		a = number % 10
		b = number // 10 % 10
		c = number // 100 % 10
		d = number // 1000 % 10
		e = number // 10000
		print("Number is ", a, b, c, d, e)
print("Exit while")
