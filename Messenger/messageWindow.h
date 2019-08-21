#ifndef MESSWINDOW_H
#define MESSWINDOW_H
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>
#include <QDialog>
#include <QString>
#include <QTextBrowser>
#include <QListWidget>
#include <QTimer>
#include <QCheckBox>
// This is the messSendWindow class that we have told to inherit from QDialog:
class messSendWindow : public QDialog
{
  Q_OBJECT
public:
    // Every QWidget needs a constructor, and they should allow
    // the user to pass a parent QDialog (or not).
    messSendWindow(QDialog *parent = 0);
    ~messSendWindow();

	QTextBrowser *textBrowser = new QTextBrowser(this); 
	QListWidget *userOnlineList = new QListWidget(this);
	QLineEdit *writeMessEd = new QLineEdit();
  	QPushButton *sendButton = new QPushButton();
  	QPushButton *logoutButton = new QPushButton();
	QLabel *labelName = new QLabel(); 
	QCheckBox *checkBox = new QCheckBox();
	QLabel *LabUsersOnline = new QLabel();
	QLabel *labelDest = new QLabel(this);
	QString name;
	QString userOnline;
    QString Dest_name;
	QPushButton *updateButton = new QPushButton();
	QTimer *timer;
	int counter(const char *user);
	int iterator = 0;
	void addUsersOnline();

public slots:
	//on_addUserOnline_clicked() metod (slot) definition, that show online users add way
	void on_addUserOnline_clicked();
	//on_sendButton_clicked() metod (slot) definition, that show message send way:
	void on_sendButton_clicked();
	//on_logOutButton_clicked() metod (slot) definition, that show client log out way
	void on_logOutButton_clicked();
	void listWidgetClick(QListWidgetItem* item);
};


#endif
