/*
##########################################################
# MODULE    :logWindow.cpp 
# PURPOSE   : This file include client log window form with its properties.Here count of users name, saved registrate client (user) username and passwd in UserData.txt file used for login
 
# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################
*/

#include "logWindow.h"
#include "client.h"
#include <iostream>
#include <QFont>
#include <QColor>
#include <QMessageBox>
#include <QPalette>
#include <fstream>

using namespace std;
using namespace Qt;
static QString names; 

//This is LogWindow constructor:
LogWindow::LogWindow(QDialog *parent)
    : QDialog(parent)
{
	QPalette Pal2(palette());
	Pal2.setColor(QPalette::Background, QColor(55, 123, 130));
	this->setAutoFillBackground(true);
	this->setPalette(Pal2);
	this->show();
	connect(logCancle,SIGNAL(clicked()),this,SLOT(on_logCancle_clicked()));
	connect(logCheck,SIGNAL(clicked()),this,SLOT(on_logCheck_clicked()));
	setWindowTitle(tr("Login"));
	layout->addRow(labWelc);
	layout->addRow(tr("User Name:"),usnameEd);
	layout->addRow(tr("Password:"),passwEd);
	passwEd->setEchoMode(QLineEdit::Password);
	layout->addRow(logCancle,logCheck);
	layout->setContentsMargins(130,150,110,90);
	usnameEd->setFocus();
	logCheck->setDefault(true);
	setGeometry(0,0,500,500);
	QFont f( "Arial", 35, QFont::Bold);
	this->labWelc->setText("LOGIN");
	labWelc->setStyleSheet("QLabel {color : white; }");
	this->labWelc->setFont(f);
	this->logCheck->setText("Login");
	this->logCancle->setText("Cancel");
	this->logCancle->setGeometry(140,390,70,50);
}

LogWindow::~LogWindow()
{


}

//Client(user) name count:
int LogWindow::counter (const char *user)
{
	int count = 0;
	while(user[count] != '\0')
		count++;
	return count;
}

//Function that give passwrd
string LogWindow::name_pass(const char *user)
{
	int i = 0;
	string forName;
	while(user[i] != '\0')
	{
		forName += user[i];
		i++;
	}
	return forName;
}

//in this function saved registrate client (user) username and passwd in UserData.txt file used for login
void LogWindow::on_logCheck_clicked(){

    QString forname = this->usnameEd->text();
	QString forpass = this->passwEd->text();
	names = forname;
    const char *Usname=forname.toStdString().c_str();
    const char *UsPass=forpass.toStdString().c_str();
	string UserName;
	string userPassword;
	string path = "Database/UserData.txt";
	ifstream fin;
	fin.open(path);
	string forPass = name_pass(UsPass);
	string forName = name_pass(Usname);	
	
	if(!fin.is_open())
		cout << "File not openned" << endl;
	else
	{
		string str;
		int i = 2;
		while(!fin.eof())
		{
			if(i % 2 == 0) {
				str = "";
				fin >> str;
				if(str == "")
					break;
				UserName = str;
				user.emplace(UserName, "");
			}
			else {
				str = "";
				fin >> str;
				userPassword = str;
				user[UserName] = userPassword;
			}
			i++;			
		}
	}

	fin.close();
	if(user[forName] == forPass && forname != NULL && forpass != NULL) {
		string path = "LoginUsers.txt";
		ifstream fin;
		fin.open(path);
		if(!fin.is_open())
			cout << " ";
		else
		{
			string str;
			while(!fin.eof())
			{
				fin >> str;
				if(str == forName){ 
					QMessageBox::warning(this, "Warning", "User already exist");
				exit(0);
				}
			}
		}

		fin.close();

		this->hide();
		UserWindow window;
		window.setModal(true);
		window.show();			
		window.exec();
	}
	else {
        QMessageBox::warning(this, "Warning", "This user doesn't exist");
	}


	update();
}

	
// Get client name
void LogWindow::get_name(QString &name)
{
	name = names;
}
