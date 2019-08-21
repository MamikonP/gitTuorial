// We need to include a couple Qt classes that we'll use:
#ifndef CLIENT_H
#define CLIENT_H
#include <QLabel>
#include <QPushButton>
#include <QLineEdit>
#include <QString>
#include <QDialog>
#include <QMessageBox>
#include <iostream>


/*
 * This is the UserWindow class that we have told to inherit from
 * our Designer UserWindow
 */
class UserWindow : public QDialog
{
    Q_OBJECT
public:
    // Every QWidget needs a constructor, and they should allow
    // the user to pass a parent QDialog (or not).
    UserWindow(QDialog *parent = 0);
    ~UserWindow();

public:
	QLabel *name = new QLabel(this);
	QLabel *ConnectLab= new QLabel(this);
	QPushButton *ConnectBut = new QPushButton(this);
	QPushButton *Cancel = new QPushButton(this);
	QLineEdit *host = new QLineEdit(this);
   	QLineEdit *port = new QLineEdit(this);
	QString names;	
signals:

public slots:
        // This function gets called when a user clicks on the
        // connect, cancel and logout Buttons 
	void on_cancel_clicked();
	void on_connect_clicked();



};


#endif
