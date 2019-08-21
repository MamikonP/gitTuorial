/*##########################################################
# MODULE    : Widget.cpp
# PURPOSE   : In this file show mainwindow form, with gui. And include login, logout, regstration ways

# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################*/


#include "Widget.h"
#include "regWindow.h"
#include "logWindow.h"
#include "client.h"
#include <iostream>
#include <QFont>
#include <QColor>
#include <QMessageBox>
#include <QPalette>
using namespace std;
// This is the Widget class that we have told to inherit from Widget
Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    setWindowTitle(tr("Messenger"));
	QPalette Pal(palette());
	Pal.setColor(QPalette::Background, QColor(137, 179, 114));
	this->setAutoFillBackground(true);
	this->setPalette(Pal);
	this->show();
     setGeometry(0,0,500,500);
	QFont f( "Arial", 35, QFont::Bold);

 	this->labelWelcom->setText("WELCOME");  	
	labelWelcom->setStyleSheet("QLabel {color : white; }");
	this->labelWelcom->setFont(f);
 	this->labelWelcom->setGeometry(140,150,250,200);  	
	this->logButton->setDefault(true);
	this->logButton->setText("LOGIN");
	this->logButton->setGeometry(268,10,60,30);	
	connect(logButton,SIGNAL(clicked()),this,SLOT(on_logButton_clicked()));	
	connect(regButton,SIGNAL(clicked()),this,SLOT(on_regButton_clicked()));	
	this->regButton->setText("REGISTRATION");
	this->regButton->setGeometry(330,10,110,30);	

}


Widget::~Widget()
{


} 


//In this function of Widget class give after logButton_clicked window hide, exec. and update action
void Widget::on_logButton_clicked(){

	this->hide();
	LogWindow window;
	window.setModal(true);	
	window.exec();
	update();
}

//In this function show login cancle way and window hide and show action
void LogWindow::on_logCancle_clicked(){
	QMessageBox::StandardButton cancel;
	cancel = QMessageBox::question(this, "Cancel", "Do you want to cancel?", QMessageBox :: Yes | QMessageBox :: No);
	if(cancel == QMessageBox :: Yes) {
		Widget *window = new Widget();
		window->show();
		this->hide();
	}
	else
		this->show();
	update();
}

//In this function give after regButton click action, window hide and show action
void Widget::on_regButton_clicked(){
	RegWindow *window = new RegWindow();
	this->hide();
	window->show();
	update();
}

