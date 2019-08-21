/*##########################################################
# MODULE    : regWindow .cpp
# PURPOSE   : This file consist of client registration form.

# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################*/


#include "logWindow.h"
#include "regWindow.h"
#include "Widget.h"
#include <iostream>
#include <fstream>
#include <string>
#include <QFont>
#include <QColor>
#include <QRect>
#include <QMouseEvent>
#include <QPainter>
#include <QString>
#include <QMessageBox>
#include <QPalette>

using namespace std;
// This is the RegWindow class that we have told to inherit from Regwindow:
RegWindow::RegWindow(QDialog *parent)
    : QDialog(parent)
{
	QPalette Pal2(palette());
	Pal2.setColor(QPalette::Background, QColor(76, 54, 112));
	this->setAutoFillBackground(true);
	this->setPalette(Pal2);
	this->show();
	connect(logCancle,SIGNAL(clicked()),this,SLOT(on_logCancel_clicked()));
	connect(regButton,SIGNAL(clicked()),this,SLOT(on_register_clicked()));
	setWindowTitle(tr("Registration"));
	layout->addRow(tr("User Name:"),usnameEd);
	layout->addRow(tr("Password:"),passwEd);
	layout->addRow(tr("Confirm:"),passwConEd);
	passwEd->setEchoMode(QLineEdit::Password);
	passwConEd->setEchoMode(QLineEdit::Password);
	layout->addRow(logCancle,regButton);
	layout->setContentsMargins(130,190,110,90);
	setGeometry(0,0,500,500);
	usnameEd->setFocus();
	this->regButton->setDefault(true);
	QFont f( "Arial", 28, QFont::Bold);
	this->labWelc->setText("CREATE ACCOUNT");
	labWelc->setStyleSheet("QLabel {color : white; }");
	this->labWelc->setFont(f);
	this->regButton->setText("ADD ACCOUNT");
	this->logCancle->setText("Cancel");
	this->logCancle->setGeometry(140,390,70,50);
	this->labWelc->setGeometry(105,145,339,50);
	this->setLayout(layout);
}
RegWindow::~RegWindow()
{


}

//In this metod (slot) of RegWindow class give registration cancle way
void RegWindow::on_logCancel_clicked()
{
	QMessageBox::StandardButton cancel;
	cancel = QMessageBox::question(this, "Exit", "Do you want to cancel?", QMessageBox::Yes | QMessageBox:: No);
	if(cancel == QMessageBox::Yes)
	{
		Widget *window = new Widget();
		window->show();
		this->hide();
	}
	else
		this->show();
	update();
}

//In this metod (slot) of RegWindow class count registrate clients (users) way
int RegWindow::counter(const char *user)
{
	int counter = 0;
	while(user[counter] != '\0')
		counter++;
	return counter;
}

//In this metod (slot) of RegWindow class give correct registration way, what name and password can have clients (user) and save registrate clients username and passwd in UserData.txt file
void RegWindow::on_register_clicked()
{

	QString userN = this->usnameEd->text();
	QString pass = this->passwEd->text();
	QString confpass = this->passwConEd->text();
	const char *username = userN.toStdString().c_str();
	const char *password = pass.toStdString().c_str();
	const char *confpassword = confpass.toStdString().c_str();
	string Name;
	int j = 0;
	while(username[j] != '\0')
	{
		Name += username[j];
		j++;
	}
	int countName = counter(username);
	int countPass = counter(password);
	int countConPass = counter(confpassword);
	bool condition;
	bool check = true;
	string path = "Database/UserData.txt";
	
    string str;
	ifstream fin;
    fin.open(path);
    if(!fin.is_open())
            cout << "File not openned" << endl;
    else
    {
        while(!fin.eof())
        {
			str = "";
        	fin >> str;
			if(str == Name) {
				QMessageBox::warning(this, "Warning", "That user already exist");
				check = false;
			}
        }
    fin.close();
    }


	for(int i = 0; i < countName; i++)
	{
		if((username[i] >= 'A' && username[i] <= 'Z') || (username[i] >= 'a' && username[i] <= 'z')) {
			condition = true;
		}
		else
		{
			condition = false;
			break;
		}
	
	}   

	for(int i = 0; i < countPass; i++)
	{
		if((countPass == countConPass) && (password[i] == confpassword[i]) && countPass > 6)
			condition = true;
		else {
			condition = false;
			break;
		}
	}
	
	if(condition == true && userN != NULL && pass != NULL && confpass != NULL && check != false) {
		QMessageBox::information(this, "Done", "Successful");
		this->hide();
		LogWindow *window = new LogWindow();
		window->show();
		ofstream fout;
		fout.open(path, ofstream::app);
		if(!fout.is_open())
			cout << "Not opened" << endl;
		else
		{
				for(int i = 0; i < countName; i++)
					fout << username[i];
				fout << " ";
				for(int i = 0; i < countPass; i++)
					fout << password[i];
				fout << "\n";
		}

		fout.close();
	}
	else {
		QMessageBox::warning(this, "Warning", "Wrong username or password");
		QMessageBox::information(this, "Info", "Username can be alphabet, password more at 6 symbol");
	}

	update();
}
