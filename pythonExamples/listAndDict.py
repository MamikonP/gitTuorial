#!/usr/bin/python3

#	Task	#
#	You have empty dictionary. Add keys and values in dictionary, if keys is grather than values, that keys will be None

keys = []
values = []
mydict = {}
def createKeyValue():
	condition = True
	while condition:
		keyEnter = input('Enter keys for dictionary(. - to exit): ')
		if keyEnter != '.':
			keys.append(keyEnter)
			print(keys)
		else:
			condition = False
	print('keys -> ',keys)
	
	condition = True	
	while condition:
		valueEnter = input('Enter values for dictionary(. - to exit): ')
		if valueEnter != '.':
			values.append(valueEnter)
			print(values)
		else:
			condition = False
	print('values -> ',values)

	mydict = dict.fromkeys(keys)
	
	if len(keys) > len(values):
		difference = len(keys) - len(values)	
		for i in range(difference):
			values.append('None')

	i = 0
	for key in mydict:
		mydict[key] = values[i]
		i += 1
	
	print(mydict)

createKeyValue()
