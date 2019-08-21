/*##########################################################
# MODULE    : client.cpp
# PURPOSE   : In this file opend window, from which client connectt in port server. And given gui form of window.
# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################*/


#include "Widget.h"
#include "client.h"
#include "logWindow.h"
#include "socket.cpp"
#include "messageWindow.h"
#include <iostream>
#include <string>
#include <QFont>
#include <QColor>
#include <QString>
#include <QMessageBox>
#include <QPalette>
#include <QFormLayout>

using namespace std;
// This is our UserWindow constructor
UserWindow::UserWindow(QDialog *parent)
    : QDialog(parent)
{
	// Here use tools of QT for login and Connecting window: use layouts, buttons, 
        //labels, set Fonts, colors, Geomerty, connect any signals with slots and etc 
	LogWindow  window;
	window.get_name(names);
	window.hide();
	setWindowTitle(tr("Connect"));
	QFormLayout *connectLayout = new QFormLayout;
	QPalette Pal2(palette());
    Pal2.setColor(QPalette::Background, QColor(55, 123, 130));
    this->setAutoFillBackground(true);
    this->setPalette(Pal2);
    this->show();
	setGeometry(0,0,500,500);
	connectLayout->setContentsMargins(130,120,110,90);
	connectLayout->setAlignment(Qt::AlignTop);
	connectLayout->setSpacing(5);
	QFont f( "Arial", 15, QFont::Bold);
    this->name->setFont(f);
	this->name->setText(names);
	this->name->setStyleSheet("QLabel {color : white; }");
	host->setFocus();
	connectLayout->addRow(name);
	connectLayout->addRow(ConnectLab);
	connectLayout->addRow(tr("Host:"),host);
	connectLayout->addRow(tr("Port:"),port);
	connectLayout->addRow(Cancel,ConnectBut);
	QFont s( "Arial", 35, QFont::Bold);
    this->ConnectLab->setText("CONNECTING");
    ConnectLab->setStyleSheet("QLabel {color : white; }");
	ConnectBut->setDefault(true);
    this->ConnectLab->setFont(s);
    this->ConnectBut->setText("Connect");
    this->Cancel->setText("Cancel");
    this->Cancel->setGeometry(140,390,70,50);
	this->setLayout(connectLayout);
	connect(this->Cancel, SIGNAL(clicked()), this, SLOT(on_cancel_clicked()));
	connect(this->ConnectBut, SIGNAL(clicked()), this, SLOT(on_connect_clicked()));
}

UserWindow::~UserWindow()
{

}

//In this metod (slot) of class show client not correct login cancel way
void UserWindow::on_cancel_clicked()
{
	QMessageBox::StandardButton cancel;
	cancel = QMessageBox::question(this, "Exit", "Do you want to cancel?", QMessageBox::Yes | QMessageBox::No);
	if(cancel == QMessageBox::Yes) {
		Widget *window = new Widget();
		window->show();
		hide();
	}
	else
		hide();
	update();
}

//In this metod (slot) of class show with server clients connect correct way (with host and port) 
void UserWindow::on_connect_clicked()
{
	
	if(this->host->text() == NULL || this->port->text() == NULL){
		QMessageBox::warning(this, "Warning", "Host or port incorrect");
	}
	else{
		QString portN;
		QString hostN;
        portN = this->port->text(); 
        hostN = this->host->text(); 
        const char *Port = portN.toStdString().c_str();  
    	const char *Host = hostN.toStdString().c_str();

		hide();
	sock(Port, Host, names);
}
	//update();
}
