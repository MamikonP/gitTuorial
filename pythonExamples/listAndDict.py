#!/usr/bin/python3

keys = []
values = []
mydict = {}
def createKeyValue():
	condition = True
	while condition:
		keyEnter = input('Enter keys for dictionary: ')
		if keyEnter != '/':
			keys.append(keyEnter)
			print(keys)
		else:
			condition = False
	print('keys -> ',keys)
	
	condition = True	
	while condition:
		valueEnter = input('Enter values for dictionary: ')
		if valueEnter != '/':
			values.append(valueEnter)
			print(values)
		else:
			condition = False
	print('values -> ',values)

	mydict = dict.fromkeys(keys)

	i = 0
	for key in mydict:
		mydict[key] = values[i]
		i += 1
	
	print(mydict)

createKeyValue()
