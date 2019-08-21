// We need to include a couple Qt classes that we'll use:
#ifndef LOGWINDOW_H
#define LOGWINDOW_H
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>
#include <QDialog>
#include <QString>
#include <QFormLayout>
#include <map>
#include <string>


//This is the LogWindow class that we have told to inherit from QDialog
 
class LogWindow : public QDialog
{
    Q_OBJECT
public:
    // Every QWidget needs a constructor, and they should allow
    // the user to pass a parent QDialog (or not).
    LogWindow(QDialog *parent = 0);
    ~LogWindow();


public:
    QFormLayout *layout = new QFormLayout(this);
    QLabel *labWelc = new QLabel(this);
    QLineEdit *usnameEd = new QLineEdit(this);
    QLineEdit *passwEd = new QLineEdit(this);
    QPushButton *logCancle = new QPushButton(this);
    QPushButton *logCheck = new QPushButton(this);
    int counter(const char *user); 
    std::map <std::string, std::string> user;
	void get_name(QString &name);
	std::string name_pass(const char *user);

signals:

public slots:
    // This function gets called when a user clicks on the
    // on_logButton_clicked
    void on_logCancle_clicked();

    // This gets called when you click the on_logCheck_clicked
    // the login page.
    void on_logCheck_clicked();
};
#endif
