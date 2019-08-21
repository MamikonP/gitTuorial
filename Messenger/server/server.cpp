/*##########################################################
# MODULE    :server.cpp
# PURPOSE   :This file consists of server's socket creating, bind, listen clients, accepting clients connect requests, send and receve message, online client list action 
# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################*/


#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <iostream>
#include <fstream>
#include <strings.h>
#include <stdlib.h>
#include <string>
#define MAX 80
#include <pthread.h>
#include <map>
#include <thread>
#include <list> 
#include <mutex>

using namespace std;
map<int, string> sockName;
static int callReadF = 0;
static int onlineCount = 0;
list<string>userNOnline;
int listenFd;
void *R_W(void *sockD);
void *sendMclient(void *);
void crSock(int lis);
void ReadMess(int connfd);
void less_acc(int listenfd);
void *sendToClient(void *sockDes);
static int connFd;
struct sockaddr_in svrAdd, clntAdd;


 string temp_name;

map <string, int> staff;


socklen_t len; //store size of the address
//main function, that have 2 arguments; count of arguments and its value
int main(int argc, char* argv[])
{
    int  portNo, listenFd;    
    if (argc < 2)
    {
        cerr << "Syntam : ./server <port>" << endl;
        return 0;
    }
    
    portNo = atoi(argv[1]);
    
    if((portNo > 65535) || (portNo < 2000))
    {
        cerr << "Please enter a port number between 2000 - 65535" << endl;
        return 0;
    }
 
   
    //The socket() system call creates a new socket. It takes three arguments
    listenFd = socket(AF_INET, SOCK_STREAM, 0);
    if(listenFd < 0)
    {
        cerr << "Cannot open socket" << endl;
        return 0;
    }
    //The function bzero() sets all values in a buffer to zero. This line initializes serv_addr to zeros
    bzero((char*) &svrAdd, sizeof(svrAdd));
    //A svrAdd is a structure containing an internet address. This structure is defined in <netinet/in.h>
    svrAdd.sin_family = AF_INET;
    svrAdd.sin_addr.s_addr = INADDR_ANY;
    svrAdd.sin_port = htons(portNo);
    
    //The bind() system call binds a socket to an address, in this case the address of the current host and port number on which the server will run
    if(bind(listenFd, (struct sockaddr *)&svrAdd, sizeof(svrAdd)) < 0)
    {
        cerr << "Cannot bind" << endl;
        return 0;
    }
	    
    less_acc(listenFd);    
    len = sizeof(clntAdd);
    
}

// Create new sockets
void crSock(int lis){
    	lis = socket(AF_INET, SOCK_STREAM, 0);
}

// In this function create pthread, server listen clients, accept there connect request
void less_acc(int listenfd){
	int noThread = 0;
	int c= 0;
	  
	crSock(listenfd);
	pthread_t thr;
	pthread_t thr2;
	cout << "Listening" << endl;
	for(;;)
	{
		// The listen system call allows the process to listen on the socket for connections
		listen(listenfd, 50);
		connFd = accept(listenfd, (struct sockaddr *)&clntAdd, &len);
		pthread_create(&thr, NULL, R_W, (void*)&connFd);
	}
}

//This function use in pthread, that send  onlineUsers list to all clients, receve and send Message and names from one client to other client
void *R_W (void *sockD)
{
  
	char text[200];
	char client_name[15];
    int h = *(int *)sockD;
 	char dest_name[15];
    static int iter = 0;
    string temp[200];
    string temp2[200];
	char PATH[50];
    const char *Usname;
    const char *MsgText;
    const char *sendDestName;
    const char *offlineMessage;

    string dest_name_send;
    string allN;
    string allText;
    string allOFF;
    cout << "Descriptor: " << h << endl;
	bzero(client_name, 15);
	recv(h,client_name,sizeof(client_name), 0);
	staff.insert(std::pair<std::string, int>(std::string(client_name), h));
	onlineCount++;
    userNOnline.push_back(client_name);
	sockName.emplace(h, client_name);
	
    int dd = 5;
    int j = 0;
    int val = 0;
    for(auto i = userNOnline.begin();i != userNOnline.end();i++)
	{
    	cout<<"Online user "<<*i<<endl;
    	temp[j] = *i;
    	allN =temp[j] + "." + allN;
    	j++;
    	val = sizeof(Usname)*j;
	}
	cout<<"ONLINE:  "<<allN<<endl;
	Usname=allN.c_str();	

	for(auto i = userNOnline.begin();i != userNOnline.end();i++){
	                dd = staff[std::string(*i)];
	                send(dd, Usname, val, 0);
				
	}

    cout << "Online Users count: " << onlineCount << endl;
	while(1){
		bzero(dest_name, 15);
		if((recv(h,dest_name,sizeof(dest_name), 0)) > 0) 
		{
			recv(h,text,sizeof(text), 0);
			recv(h,PATH, sizeof(PATH), 0);
			string str(text);	
			str="_"+str + "\0";		
			MsgText=str.c_str();
			int iter = 0;
			while(MsgText[iter] != '\0'){
				text[iter] = MsgText[iter];
				iter++;
			}
		    cout << "From: " << client_name << "\nDest_name "<< dest_name<< "\nMessage:" << text << endl;
		}
		else
			break;

		int dd = staff[std::string(dest_name)];
		string str2(client_name);
		str2="*"+str2 + "\0";		
		sendDestName=str2.c_str();
		send(dd, sendDestName, sizeof(text), 0);
		this_thread::sleep_for(chrono::milliseconds(100));
		text[200] = '\0';
		send(dd, text, sizeof(text), 0);
		temp_name = client_name;
		bzero(text, 200);
		send(dd, PATH, sizeof(PATH), 0);
		bzero(PATH, 50);
	}

    auto iterator = staff.find(std::string(client_name ));
	auto it = sockName.find(h);

    cout << "\nAny user add to offline" << endl;
    cout << "client_name " << client_name << endl;
	
    userNOnline.remove(client_name);
	staff.erase(client_name);
	int t=0;
	for(auto i = userNOnline.begin();i != userNOnline.end();i++)
	{
		cout<<"online user      "<<*i<<endl;
		temp2[t] = *i;
		allOFF =temp2[t] + "." + allOFF;
		t++;
		val = sizeof(offlineMessage)*t;
	}

	offlineMessage=allOFF.c_str();	

	for(auto i = userNOnline.begin();i != userNOnline.end();i++){
		dd = staff[std::string(*i)];
		cout << dd << endl;
		send(dd, offlineMessage, val, 0);
	}

	for(auto i = userNOnline.begin();i != userNOnline.end();i++)
	{
		cout<<"online user      "<<*i<<endl;
	}


	string cl_name;
	int m = 0;
	while(client_name[m] != '\0')
	{
		cl_name += client_name[m];
		m++;
	}
    onlineCount--;
    cout << "Online Users  : " << onlineCount << endl;

	if(onlineCount==0){

		remove("../LoginUsers.txt");
	} 
    cout<<"CLOSE"<<endl;
	return 0;
}
