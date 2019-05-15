#!/usr/bin/python3

a = []
def board(bvalue = '*'):
	for i in range(3):
		b = []
		for j in range(3):
			b.append(bvalue)
		a.append(b)

	lengthCols = len(a[0])
	lengthRow = len(a)
	
	print('N', end = ' ')
	for i in range(lengthCols):
		print(i, end = ' ')
	print()	
	for i in range(lengthRow):
		print(i, end = ' ')
		for j in range(lengthCols):
			print(a[i][j], end = ' ')
		print()

def player_one():
	condition = True
	while condition:
		pl1 = int(input('Enter pl1(row):'))
		pl11 = int(input('Enter pl1(col):'))
		print('N', end = ' ')
		for i in range(lengthCols):
			print(i, end = ' ')
		print()	

		for i in range(lengthRow):
			print(i, end = ' ')
			for j in range(lengthCols):
				print(a[i][j], end = ' ')
				if a[pl1][pl11] != 'X' and a[pl1][pl11] != 'O':
					a[pl1][pl11]='X'
					condition = False
			print()

def player_two():
	condition = True
	while condition:
		pl2 = int(input('Enter pl2(row):'))
		pl22 = int(input('Enter pl2(col):'))
				
		print('N', end = ' ')
		for i in range(lengthCols):
			print(i, end = ' ')
		print()	

		for i in range(lengthRow):
			print(i, end = ' ')
			for j in range(lengthCols):
				print(a[i][j], end = ' ')
				if a[pl2][pl22] != 'X' and a[pl2][pl22] != 'O' :
					a[pl2][pl22] = 'O'
					condition = False
			print()

board()
lengthCols = len(a[0])
lengthRow = len(a)

def winner():
	condition = True
	while condition:
		mylistX = [] 	# for diagonal player 1
		mylistO = []	# for diagonal player 2
		listX = []		# for diagonal 2 player 1
		listO = []		# for diagonal 2 player 2
		colsX = []
		colsO = []
		player_one()
		for i in range(lengthRow):									# Winner to rows
			if '*' not in a[i] and 'X' in a[i] and 'O' not in a[i]:
				print('\tWinner player1')
				condition = False
				return 'Congradulations'

		for i in range(lengthRow):									# Winner to diagonal 1
			if 'X' in a[i][i]:
				mylistX.append(a[i][i])
				countX = mylistX.count('X')
		if countX == 3:
			print('\tWinner player1')
			condition = False
			return 'Congradulations'

		for i in range(lengthRow -1, -1, -1):						# Winner to diagonal 2
			if 'X' in a[i][i]:
				listX.append(a[i][i])
				cX = listX.count('X')
		if cX == 3:
			print('\tWinner player1')
			condition = False
			return 'Congradulations'

		for i in range(lengthRow):
			for j in range(lengthCols):
				if 'X' in a[j][i] and 'O' not in a[j][i] and '*' not in a[j][i]:
					colsX.append('X')
					countcolX = colsX.count('X')
			colsX = []
		if countcolX == 3:
			print('\tWinner player1')
			condition = False
			return 'Congradulations'

		##### Player 2  winners	
		player_two()
		for i in range(lengthRow):
			if '*' not in a[i] and 'O' in a[i] and 'X' not in a[i]:
				print('\tWinner player2')
				condition = False
				return 'Congradulations'

		for i in range(lengthRow):
			if 'O' in a[i][i]:
				mylistO.append(a[i][i])
				countO = mylistO.count('O')
		if countO == 3:
			print('\tWinner player2')
			condition = False
			return 'Congradulations'
		
		for i in range(lengthRow -1, -1, -1):
			if 'O' in a[i][i]:
				listO.append(a[i][i])
				cO = listO.count('O')
		if cO == 3:
			print('\tWinner player2')
			condition = False
			return 'Congradulations'
		
		for i in range(lengthRow):
			for j in range(lengthCols):
				if 'O' in a[j][i] and 'X' not in a[j][i] and '*' not in a[j][i]:
					colsO.append('X')
					countcolO = colsO.count('O')
			colsO = []
		if countcolO == 3:
			print('\tWinner player2')
			condition = False
			return 'Congradulations'

winner()	
