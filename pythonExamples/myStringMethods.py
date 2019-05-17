#!/usr/bin/python3

mystring = "Welcome to 1 Armenia, 2 My name 44 is Mamikon,55 I live in Gyumri"

def my_count(string, symbol):
	count = 0
	for i in range(len(string)):
		if string[i].upper() == symbol.upper():
			count += 1
	return count

#print(my_count(mystring, 'm'))


def my_find(string, symbol):
	for i in range(len(string)):
		if string[i].upper() == symbol.upper():
			print(string[i],'->',i)

#myfind(my_string, 'm')
###############################################################

def my_replace(string, sourceSymbol, replaceSymbol):
	for i in range(len(string)):
		if string[i].upper() == sourceSymbol.upper():
			string[i] = replaceSymbol

	return string

#print(my_replace(mystring, 'm', "e"))
###############################################################

def my_isalpha(string):
	for i in string:
		if i >= 'a' and i <= 'z' or i >= 'A' and i <= 'Z':
			print(i, end='')
		if i == ' ':
			print(end=' ')

#my_isalpha(mystring)


def my_isdigit(string):
	for i in string:
		if i >= '0' and i <= '9':
			print(int(i), end=' ')

#my_isdigit(mystring)


def my_split(string, symbol):
	arr = ''
	forSplit = []
	for i in string:
		if i != symbol:
			arr += i
		else:
			forSplit.append(arr)
			arr = ''
	return forSplit

#print(my_split(mystring, ' '))


def my_len(string):
	count = 0
	for i in string:
		count += 1
	return count

#print(my_len(mystring))


def my_islower(string):
	for i in string:
		if i >= 'A' and i <= 'Z':
			lower = ''
			break
		elif i >= 'a' and i <= 'z':
			lower = True
	return lower

#str1 = 'i am lower string 44 78974 and not upper case' ### for example
#print(my_islower(str1))

def my_isupper(string):
	for i in string:
		if i >= 'a' and i <= 'z':
			upper = ''
			break
		elif i >= 'A' and i <= 'Z':
			upper = True
	return upper

#str2 = 'I AM UPPER STRING 44 78974 AND NOT LOWER CASE' ### for example
#print(my_isupper(str2))


def my_upper(string):
	for i in string:
		if i >= 'a' and i <= 'z':
			up = ord(i) - 32
			el = chr(up)
			i = el
			print(i,end='')
		else:
			print(i, end='')
	print('\n')

#my_upper(mystring)


def my_lower(string):
	for i in string:
		if i >= 'A' and i <= 'Z':
			low = ord(i) + 32
			el = chr(low)
			i = el
			print(i,end='')
		else:
			print(i, end='')
	print('\n')

#my_lower(mystring)
#######################################
def my_capitalize(string):
	arr = []
	str1 = ''
	for i in string:
		if i != ' ':
			str1 += i
		else:
			arr.append(str1)
			str1 = ''
	i = j = 0
	while i <= len(arr):
		if arr[i][j] >= 'a' and arr[i][j] <= 'z':
			up = ord(arr[i][j]) - 32
			el = chr(up)
			arr[i][j] = el
			print(arr[i], end='')
		else:
			print(arr[i], end ='')
		i += 1
		j += 1

#my_capitalize(mystring)
##########################################
