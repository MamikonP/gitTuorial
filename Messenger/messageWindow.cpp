/*##########################################################
# MODULE    : messageWindow.cpp
# PURPOSE   : This file consist of Message Dialog window window creation, whith Layout forms, lienEdits, messagebox, Labels, buttons, connect functions(that connect any signals ti slots). 
# DATE      : 20.08.2019
# REVISIONS : 1.0
# V1.0 - 10-Aug-2019 -  Script creation
##########################################################*/



#include "messageWindow.h"
#include "logWindow.h"
#include "Widget.h"
#include <iostream>
#include <string>
#include <QMessageBox>
#include <QPalette>
#include <QListWidgetItem>
#include <QTimer>
#include <QPixmap>
#include <QFormLayout>
using namespace std;
//This is our messSendWindow constructor
messSendWindow::messSendWindow(QDialog *parent)
    : QDialog(parent)
{
    this->setFixedSize(650,550);
    QVBoxLayout  *generalVlayout = new QVBoxLayout();
    logoutButton->setMinimumWidth(20);
    logoutButton->setMinimumHeight(10);

    this->sendButton->setStyleSheet("border-image:url(./images/icon3.png);");
    this->logoutButton->setStyleSheet("border-image:url(./images/icon5.png);    ");

    QHBoxLayout  *Hlayout = new QHBoxLayout();
    QHBoxLayout  *Hlayout2 = new QHBoxLayout();
    QHBoxLayout  *Hlayout3 =new QHBoxLayout();
    QHBoxLayout  *Hlayout4 =new QHBoxLayout();
    QVBoxLayout *vLayout = new QVBoxLayout();

    LogWindow log;
    log.get_name(name);
    log.hide();

    QLabel *labImage = new QLabel();
    QLabel *labImage2 = new QLabel();
    QLabel *labImage3 = new QLabel();

    QPixmap pix("./images/users.png");
    QPixmap pix2("./images/icon8.png");
    QPixmap pix3("./images/message.png");

    labImage->setPixmap(pix2.scaled(50,50));
    labImage2->setPixmap(pix.scaled(50,50));
    labImage3->setPixmap(pix3.scaled(35,35));

    labelName->setText(name);
    labImage2->setFixedHeight(50);
    labImage2->setFixedWidth(50);
    labImage3->setFixedHeight(35);
    labImage3->setFixedWidth(35);

    vLayout->addWidget(labImage2);
    vLayout->addWidget(LabUsersOnline);
    this->writeMessEd->setFocus();
    sendButton->setDefault(true);

    labImage->setFixedHeight(50);
    labImage->setFixedWidth(50);

    Hlayout->addWidget(labImage);
    Hlayout->addWidget(labelName);

    Hlayout4->addWidget(labImage3);
    Hlayout4->addWidget(labelDest);
    Hlayout->addWidget(logoutButton);

    textBrowser->setFixedHeight(350);
    userOnlineList->setFixedWidth(120);
    logoutButton->setFixedHeight(50);
    logoutButton->setFixedWidth(50);

    this->checkBox->setText("Send Message to all users");
    vLayout->addWidget(userOnlineList);
    vLayout->addWidget(checkBox);

    Hlayout2->addWidget(textBrowser);
    Hlayout3->addWidget(writeMessEd);

    sendButton->setFixedHeight(50);
    sendButton->setFixedWidth(50);

    Hlayout3->addWidget(sendButton);

    generalVlayout->addLayout(Hlayout);
    generalVlayout->addLayout(Hlayout2);
    generalVlayout->addLayout(Hlayout4);
    generalVlayout->addLayout(Hlayout3);
    Hlayout2->addLayout(vLayout);

    setLayout(generalVlayout);
    QObject::connect(sendButton, SIGNAL(clicked()), this, SLOT(on_sendButton_clicked()));

    QObject::connect(logoutButton, SIGNAL(clicked()), this, SLOT(on_logOutButton_clicked()));

    timer = new QTimer(0);
    connect(timer, SIGNAL(timeout()), this, SLOT(on_addUserOnline_clicked()));
    timer->start(1000);

    connect(userOnlineList,SIGNAL(itemClicked(QListWidgetItem*)),
    this, SLOT(listWidgetClick(QListWidgetItem*)));

    update();
}

messSendWindow::~messSendWindow()
{


}

//In this function show client logout way
void messSendWindow::on_logOutButton_clicked()
{
    QMessageBox::StandardButton logout = QMessageBox::question(this, "Log Out", "Do you want to log out?", QMessageBox::Yes | QMessageBox::No);
    if(logout == QMessageBox::Yes)
    {
		exit(0);
    }
    else
        this->show();
}
