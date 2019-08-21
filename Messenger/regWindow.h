// We need to include a couple Qt classes that we'll use:
#ifndef REGWINDOW_H
#define REGWINDOW_H
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>
#include <QDialog>
#include <QFormLayout>

//This is the RegWindow class that we have told to inherit QDialog

class RegWindow : public QDialog
{
    Q_OBJECT
public:

    // Every QWidget needs a constructor, and they should allow
    // the user to pass a parent RegWindow (or not).
    RegWindow(QDialog *parent = 0);
    ~RegWindow();


public:
    QFormLayout *layout = new QFormLayout(this);
    QLabel *labWelc = new QLabel(this);
    QLineEdit *usnameEd = new QLineEdit(this);
    QLineEdit *passwEd = new QLineEdit(this);
    QLineEdit *passwConEd = new QLineEdit(this);
    QPushButton *logCancle = new QPushButton(this);
    QPushButton *regButton = new QPushButton(this);
	int counter(const char *user);

signals:

public slots:
    // on-logCancle_clichked metod (slot)definition, that show login cancle way
    void on_logCancel_clicked();
    // on-register_clichked metod (slot)definition, that show registration way
    void on_register_clicked();
};

#endif


