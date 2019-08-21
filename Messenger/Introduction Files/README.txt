This is the README file of the project C++ and Qt, project name is "Messanger".
CONTENTS
	1. Author
	2. Introduction
	3. Directory structure
	4. Usage

1. Author
	1. 	Name: Mamikon
		Surname: Papikyan
		E-mail: papikyan.mamikon@yandex.com
		Phone: +374-94-06-02-54
	2. 
		Name: Nura 
		Surname: Asoyan
		E-mail: asoyan.1991.02@gmail.com
		Phone: +374-98-49-43-41

	3.	Name: David
		Surname: Kukulikyan
		E-mail: davidkuk25@gmail.com
		Phone: +374-99-46-65-22


2. Introduction
	Here are the implementation of tasks, which were given durig the C++ and Qt courses organized by Instigate Design. Project name is “Messanger”.

3. Directory structure
	This project consist of several header and source files. Project name of "Messanger", that created using C++ programming language and QT. Clients can send and receve messange from unother clients. Here the server is considered a connecting node beetwen clients. And we use QT creator with its components (Classes, widgets. signals, slotes, layouts and etc)for grafical interface: user registration, user login, connect with hostname and host, send and receve private and public message and etc.

Clients side:
HEADERS += client.h logWindow.h messageWINDOW.h regWindow.h Widget.h

	client.h		-This file consists of definition of class and function, these impliment in client.cpp

	logWindow.h		-This file consists of class and functions definitions for client login, these implement in logWindow.cpp

	messageWINDOW.h		-This header file include classes and functions definitions, that initialised in messWINDOW.cpp file

	regWindow.h		-This file consists of definition of class and functions, these implement in regWindow.cpp

	Widget.h		-This file consists of definition of class and function, these implement in Widget.cpp

 
SOURCES += client.cpp socket.cpp logWindow.cpp messageWINDOW.cpp main.cpp regWindow.cpp Widget.cpp 

	client.cpp		-opened window, from which client connect in port server

	socket.cpp		-This file consists of client side all action: create socket, connect to server, receive all client list from server, send and receive 					 message, save chating history with other clients to file and read from file, show history in messageBox and etc.

	logWindow.cpp		-This file include client log window form with its properties.

	messageWINDOW.cpp		-This file consist of Message Dialog window window creation, whith Layout forms, lienEdits, messagebox, Labels, buttons, connect  					 functions(that connect any signals ti slots). 

	main.cpp		-This is our main file
	regWindow.cpp		-This file consist of client registration form
	Widget.cpp		-This file include login, logout, regstration buttons creation, setText in buttons, seGeometry buttons and connect logButton and 					 RegButton clicked() signals with on_logButton_clicked() and on_regButton_clicked() slotes


Server side:
SOURCE += server.cpp
	server.cpp		-This file consists of server's socket creating, bind, listen clients, accepting clients connect requests, send and receve message, 					 online client list action 

You will find a description of each file in devspec document.
You will find "Messanger" project steps of work in fspec document.
 
	
4. Usage
Server side
		1. g++ -pthread server.cpp -o server
		2. ./server “port number from 2000-65535”

Client side	
		1. cd folder of project and do “qmake -project”
		2. vim *.pro and add 2 lines: QT += widgets
                                          QT += gui;  after “INCLUDEPATH += .” line.
		3. qmake *.pro
		4. make 
		5. ./”name out file” 



		
