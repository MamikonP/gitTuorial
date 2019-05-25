#!/usr/bin/python3

################## Task - my string methods

mystring = "Welcome to 1 Armenia, 2 My name 44 is Mamikon,55 I live in Gyumri"
def my_count(string, symbol):
	count = 0
	for i in string:
		if ord(i) == ord(symbol) - 32 or i == symbol:
			count += 1
	return count

#print(my_count(mystring, 'm'))


def my_find(string, symbol):
	count = 0
	for i in string:
		if i == symbol or ord(i) == ord(symbol) -32:
			print(i,'->',count)
		count += 1

#my_find(mystring, 'm')

def my_replace(string, sourceSymbol, replaceSymbol):
	my_list = []
	index = 0
	for i in string:
		my_list.append(i)
	for i in my_list:
		if i == sourceSymbol or ord(i) == ord(sourceSymbol) - 32:
			my_list[index] = replaceSymbol
		index += 1
	return my_list

#print(my_replace(mystring, 'm', 'e'))

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

def my_capitalize(string):
	my_list = []
	str1 = ''
	for i in string:
		if i != ' ':
			my_list.append(i)
			if my_list[0] >= 'a' and my_list[0] <= 'z':
				word = ord(my_list[0]) - 32
				my_list[0] = chr(word)
				str1 += my_list[0]
			else:
				str1 += i
		else:
			str1 += ' '
			my_list = []
	print(str1)

my_capitalize(mystring)


