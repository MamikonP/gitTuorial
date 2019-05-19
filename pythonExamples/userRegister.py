#!/usr/bin/python3

#	Task	#
#	In database have 3 username and 3 password, you can log in input true data. Or you can register 

mylist = {}
usersLogin = {'John':'1234', 'Jack':'5678', 'Jim':'9876'}
mylist = usersLogin
print(mylist)

boolean = True
while boolean:
	ask = input("Do you want to login (y/n): ")
	if ask == 'y':
		string = input("Enter login: ")
		if string in usersLogin:
			password = input("Enter password: ")
			if password in usersLogin.values():
				print("Hello",string)
	else:
		ask = input("Do you want to register? (y/n) ")
		if ask == 'y':
			string = input("Enter login: ")
			password = input("Enter password: ")
			confirmPass = input("Confirm password: ")
			if password == confirmPass:
				mylist.setdefault(string, password)
				print('Done!!! you are register')
			else:
				print("Incorrect password")
		else:
			print("You are not loggined and registered")
			boolean = False

print(mylist)
