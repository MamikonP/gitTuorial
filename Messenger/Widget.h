// We need to include a couple Qt classes that we'll use:
#ifndef WIDGET_H
#define WIDGET_H
#include <QWidget>
#include <QPushButton>
#include <QLabel>

/*
 * This is the MainWindow class that we have told to inherit from
 * our Designer MainWindow (ui::MainWindow)
 */
class Widget : public QWidget
{
    Q_OBJECT
public:
    // Every QWidget needs a constructor, and they should allow
    // the user to pass a parent QWidget (or not).
    Widget(QWidget *parent = 0);
    ~Widget();
public:
    
private: 
    
    QLabel *labelWelcom = new QLabel(this);
    QPushButton *logButton = new QPushButton(this);
    QPushButton *regButton = new QPushButton(this);
    QWidget widget;	
 
signals:

public slots:
    // This function gets called when a user clicks on the loginButton 
    void on_logButton_clicked();

    // This function gets called when a user clicks on the regButton 
    void on_regButton_clicked();
	
};

#endif 
