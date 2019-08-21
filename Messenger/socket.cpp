/*
* MODULE    : socket .cpp
* PURPOSE   : This file consists of client side all action: create socket, connect to server, receive all client list from server, send and receive  message, save chating history with other clients to file and read from file, show history in messageBox and etc.

* DATE      : 20.08.2019
* REVISIONS : 1.0
* V1.0 - 10-Aug-2019 -  Script creation
*/

#include "messageWindow.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <pthread.h>
#include <chrono>
#include <thread>
#include <iostream>
#include <QMessageBox>
#include <fstream>
#include <QFile>
#include <QTextStream>

using namespace std;
int socketFd;
void readOnlineUsers(int arg);
string retString(char nam[600],int k);
int r_w;
QString online_Users[10];
void *readMess(void *arg);
int countOfOU = 10;
int ArrSize=0;
static string PATH;
static string userName;
string allSendName[50];
string DEST_NAME;
QString anun;

//In this function show client socket creating, connect to server 
void sock(const char *Port, const char *Host, QString name)
{

	QMessageBox *box = new QMessageBox();
	int portno;
	struct sockaddr_in svrAdd;
    struct hostent *server;

	portno = atoi(Port);
	cout << portno << endl;
	if(portno > 65535 || portno < 2000) {
	        QMessageBox::warning(box, "Warning", "Enter port number between 2000-65535");
	        exit(0);
	}
	socketFd = socket(AF_INET, SOCK_STREAM, 0);
	cout <<"main " << socketFd << endl;
	if(socketFd < 0){
	        QMessageBox::warning(box, "Warning", "Can not open socket");
	        exit(0);
	}
	server = gethostbyname(Host);
	if(server == NULL){
	        QMessageBox::warning(box, "Warning", "Host does not exist");
	        exit(0);
	}
	bzero((char *)&svrAdd, sizeof(svrAdd));
	svrAdd.sin_family = AF_INET;
	bcopy((char *) server -> h_addr, (char *) &svrAdd.sin_addr.s_addr, server -> h_length);
	svrAdd.sin_port = htons(portno);
	
	if(connect(socketFd,(struct sockaddr *) &svrAdd, sizeof(svrAdd)) < 0){
	        QMessageBox::warning(box, "Warning", "Can not connect");
	        exit(0);
	}
	
		const char *usName = name.toStdString().c_str();
		int usNameCount = 0;
	int j = 0;
	while(usName[j] != '\0')
	{
		usNameCount++;
		j++;
	}
	send(socketFd,usName,usNameCount,MSG_EOR);
	this_thread::sleep_for(chrono::milliseconds(100));
	messSendWindow *windows = new messSendWindow();
	userName = name.toStdString().c_str();
	pthread_t th;
	pthread_create(&th, NULL, readMess, (void *)&socketFd);

	windows->setModal(true);
	windows->show();
}

// In this function count client name that receve from server for showing in Message window
int messSendWindow::counter(const char *user)
{
	int j = 0;


	int count = 0;
	while(user[j] != '\0')
	{
		count++;
		j++;
	}
	return count;
}

//In this function client (user) select other client whom want to send message and create file for each user chat history
 void messSendWindow::listWidgetClick(QListWidgetItem* item)
 {
	int iter=0;
	for(int i = 0; i < 50; i++) {
		if(userOnlineList->item(i)->isSelected())
		{
			iter = i;
			cout << "DONE" << endl;
			break;
		}
	}
	anun = userOnlineList->item(iter)->text();
	this->labelDest->show();
	this->labelDest->setText(anun);
	DEST_NAME = anun.toUtf8().constData(); 
	
	
	string messFolder = userName + DEST_NAME;
	PATH = "messages/"+messFolder+".txt";
	ifstream files(PATH);
	if(files) {
		PATH = "messages/"+messFolder+".txt";
	}
	else
	{
		messFolder = DEST_NAME + userName;
		PATH = "messages/"+messFolder+".txt";
	}
	
	files.close();
	ofstream fout(PATH, ofstream::app);
	if(!fout.is_open())
	{
	        QMessageBox::warning(this, "Warning", "Error to send message");
	        exit(0);
	}
	else
	{
		fout.close();
		const char* filePath = PATH.c_str();
		QFile file;
		file.setFileName(filePath);
		if(!file.open(QIODevice::ReadOnly))
		        QMessageBox::information(0, "info", file.errorString());
		
		QTextStream in(&file);
		textBrowser->setText(in.readAll());
		textBrowser->moveCursor(QTextCursor::End);
	}
}

// In this metod (slot) of class client send to server name of client who want to send message and message text, and client (user) can send message all of online client, selecktes in chat box and save chating history in files for each client (user)
void messSendWindow::on_sendButton_clicked()
{
	if(this->writeMessEd->text() != NULL) {
	if(checkBox->isChecked())
	{	
		for(int l=0;l<ArrSize;l++)
		{
			const char *dest_name = allSendName[l].c_str();
			int destNameCount = counter(dest_name);
			if(send(socketFd, dest_name, destNameCount, 0) < 0){
				QMessageBox::warning(this, "Warning", "Can not send DestName");
				exit(0);
			}
			else
			{
				    cout<<"Names	"<<dest_name<<endl;
					cout<<"is send "<<endl;
			}	
			this_thread::sleep_for(chrono::milliseconds(200));
		
			QString message = this->writeMessEd->text();
			string mess = message.toStdString().c_str();
			char msg[200];
			int lengthOfMess = mess.length();
			for(int i = 0; i < lengthOfMess; i++) {
				msg[i] = mess[i];
			}
			msg[mess.length()+1] = '\0';
			this_thread::sleep_for(chrono::milliseconds(100));
			
			if(send(socketFd, (char *)&msg, mess.length(), 0)  < 0){
				QMessageBox::warning(this, "Warning", "Can not send message");
				exit(0);
			}
		
			/////////////////SEND
			string messFolder = userName + allSendName[l];
			PATH = "messages/"+messFolder+".txt";
			ifstream files(PATH);
			if(files) {
				PATH = "messages/"+messFolder+".txt";
			}
			else
			{
				messFolder = allSendName[l] + userName;
				PATH = "messages/"+messFolder+".txt";
			}
		
			files.close();
			string MESSAGE = message.toStdString().c_str();	
			ofstream fout(PATH, ofstream::app);
			if(message != NULL)
			{
				if(!fout.is_open())
				{
					QMessageBox::warning(this, "Warning", "Error to send message");
					exit(0);
				}
				else
				{
					fout << userName << ": "<< MESSAGE << endl;
				}
			}
			const char* filePath = PATH.c_str();
			QFile file;
			file.setFileName(filePath);
			if(!file.open(QIODevice::ReadOnly))
				QMessageBox::information(0, "info", file.errorString());
		
			QTextStream in(&file);
			textBrowser->setText(in.readAll());
			textBrowser->moveCursor(QTextCursor::End);
			
			this_thread::sleep_for(chrono::milliseconds(100));
			if(send(socketFd, filePath, PATH.length(), 0)  < 0){
				QMessageBox::warning(this, "Warning", "Error to send file path");
				exit(0);
			}
			
			update();
		

		}
	}
	else
	{
		const char *dest_name = DEST_NAME.c_str();
		int destNameCount = counter(dest_name);
		if(send(socketFd, dest_name, destNameCount, 0) < 0){
			QMessageBox::warning(this, "Warning", "Can not send DestName");
			exit(0);
		}
		
		this_thread::sleep_for(chrono::milliseconds(200));
	
		QString message = this->writeMessEd->text();
		string mess = message.toStdString().c_str();
		char msg[200];
		int lengthOfMess = mess.length();
		for(int i = 0; i < lengthOfMess; i++) {
			msg[i] = mess[i];
		}
		msg[mess.length()+1] = '\0';
		this_thread::sleep_for(chrono::milliseconds(100));
		
		if(send(socketFd, (char *)&msg, mess.length(), 0)  < 0){
			QMessageBox::warning(this, "Warning", "Can not send message");
			exit(0);
		}
	
	
		string messFolder = userName + DEST_NAME;
		PATH = "messages/"+messFolder+".txt";
		ifstream files(PATH);
		if(files) {
			PATH = "messages/"+messFolder+".txt";
		}
		else
		{
			messFolder = DEST_NAME + userName;
			PATH = "messages/"+messFolder+".txt";
		}
	
		files.close();
		string MESSAGE = message.toStdString().c_str();	
		ofstream fout(PATH, ofstream::app);
		if(message != NULL)
		{
			if(!fout.is_open())
			{
				QMessageBox::warning(this, "Warning", "Error to send message");
				exit(0);
			}
			else
			{	
				fout << userName << ": "<< MESSAGE << endl;
			}
		}
		const char* filePath = PATH.c_str();
		QFile file;
		file.setFileName(filePath);
		if(!file.open(QIODevice::ReadOnly))
			QMessageBox::information(0, "info", file.errorString());
	
		QTextStream in(&file);
		textBrowser->setText(in.readAll());
		textBrowser->moveCursor(QTextCursor::End);
		
		this_thread::sleep_for(chrono::milliseconds(100));
		if(send(socketFd, filePath, PATH.length(), 0)  < 0){
			QMessageBox::warning(this, "Warning", "Error to send file path");
			exit(0);
		}
		
		update();
	}
	}
	this->writeMessEd->clear();

}


// In this function cast client name from char to string
string retString(char nam[200],int k){

  string d(1,nam[k]);
  return d;
}


// Online users: clients list that show at every clients dialog that send server
void readOnlineUsers(char onlineUsers[300])
{
	string d;
	int s=0;
	int nameIter;
	string h;
	string nam3[50];
	nameIter=0;
	int i=0;
	int count=0;
	while(onlineUsers[i] != '\0')
	{
		i++;
		count++;
	}
	
	for(s=0;s<count;++s)
	{
		d=retString(onlineUsers,s);
		nam3[nameIter]=h;
		if(onlineUsers[s] == '.')
		{
	        ++nameIter;
	        cout<<"dot"<<endl;
	        h="";
	        continue;
		}
		h=h+d;
	}
	cout<<"Online user   "<<endl;

	ofstream fout2;
	string logUs = "LoginUsers.txt";
        fout2.open(logUs);
        if(!fout2.is_open())
		cout << "Not openned file" << endl;
        else
        {
        	for(s=0;s<count;++s)
		        fout2 << nam3[s] << endl;
        }

        fout2.close();
	

		ofstream fout;
		string path = "Database/" + userName+".txt";
		fout.open(path);
       	ArrSize = nameIter-1;
		int index=0; 
		cout<<" Online User name	"<<userName<<endl;
        for(int l =0;l<nameIter;++l)
		{
			if(nam3[l] == userName)
			{
				nameIter++;
				continue;	
			}
			allSendName[index]=nam3[l];	
			index++;
			online_Users[l] = QString::fromLocal8Bit(nam3[l].c_str());
	
			if(!fout.is_open())
			{
				cout << "Not oppenned file" << endl;
			}
			else
			{
				fout << nam3[l];
				fout << "\n";
			}
	
        }
		fout.close();
}

// In this function client receive message from other client
void *readMess(void *arg)
{
	int desc = *(int *) arg;
	char names[300];
	char MSG[200];
	char path[50];
	
	while(true)
	{
		recv(desc, names, sizeof(names), 0);

		if(names[0] != '_'  && names[0] != '*'){
			if(names[0] == '\0' || names == NULL || names == 0){
				exit(0);
			}
			readOnlineUsers(names);
			bzero(names, 300);
		}
		else if(names[0] == '*'){	
			cout << "Msg from " << names << endl;
			bzero(names, 300);
			recv(desc, MSG, sizeof(MSG), 0);
			cout << "Message = " << MSG << endl;
			bzero(MSG, 200);
			recv(desc, path, sizeof(path), 0);	
			cout << "Path = " << path << endl;
			bzero(path, 50);
			continue;
		}
	}
}


//In this function read online users name from onlineUsers.txt file and show in messSend Window and before oline users name put icon
void messSendWindow::on_addUserOnline_clicked()
{

	DEST_NAME = anun.toUtf8().constData(); 
	string messFolder = userName + DEST_NAME;
	PATH = "messages/"+messFolder+".txt";
	ifstream files(PATH);
	if(files) {
	        PATH = "messages/"+messFolder+".txt";
	}
	else
	{
	        messFolder = DEST_NAME + userName;
	        PATH = "messages/"+messFolder+".txt";
	}
	
	files.close();
	ofstream fout(PATH, ofstream::app);
	if(!fout.is_open())
	{
	        QMessageBox::warning(this, "Warning", "Error to send message");
	        exit(0);
	}
	else
	{
		fout.close();
		const char* filePath = PATH.c_str();
		QFile file;
		file.setFileName(filePath);
		if(!file.open(QIODevice::ReadOnly))
			QMessageBox::information(0, "info", file.errorString());
	
		QTextStream in(&file);
		textBrowser->setText(in.readAll());
		textBrowser->moveCursor(QTextCursor::End);
	}
	
	userOnlineList->clear();
	ifstream fin;
	string usr[countOfOU];
	string path = "Database/" + userName+".txt";
	fin.open(path);
	if(!fin.is_open())
	{
		cout << "Not oppenned" << endl;
	}
	else
	{
		string str;
		int i = 0;
		while(!fin.eof())
		{
			str = "";
			fin >> str;
			if(str == "" || str == "\0" )
				break;
			usr[i] = str;
			i++;
		}
		QString onlineUser[countOfOU];
		for(int i = 0; i < countOfOU; i++)
		{
			if(usr[i] == "" || usr[i] == "\0")
				break;
			else
			{
				onlineUser[i] = QString::fromLocal8Bit(usr[i].c_str());
		    	QListWidgetItem *online = new QListWidgetItem(QIcon("./images/online.png"), onlineUser[i]);
		        userOnlineList->addItem(online);
			}
		}
	
}
fin.close();
}
