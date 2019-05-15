#!/usr/bin/python3

name = "BillGates"
i = 0
mylist = []
secMyList = []

def appendName():
	for i in name:
		mylist.append(i)
	
	for i in mylist:
		secMyList.append(i)
	
	for i in range(len(secMyList)):
		secMyList[i] = '*'


def startGame():
	condition = True
	length = len(mylist)
	word = input("Who is Windows creator? ")
	while condition:
		if name.upper() == word.upper():
			print(mylist)
			print('Congradulations')		
			break
		for i in range(len(secMyList)):
			if word.upper() in mylist[i].upper() and word.upper() != '':
				mylist[i] = ''
				secMyList[i] = word.upper()
				length -= 1
			if length == 0:
				print(secMyList)
				print('Congradulations')
				condition = False
		if condition == False:
			break
		print(secMyList)
		word = input('Who is Windows creator? ')

appendName()
startGame()
