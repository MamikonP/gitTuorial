#include <QApplication>
#include "Widget.h"

// This is your main() function.
int main(int argc,char *argv[]){

    // Every Qt GUI needs a QApplication.
    QApplication app(argc,argv);

    // This is your MainWindow that you created with Designer
        // Declare it and show it
    Widget wid;
    wid.show();

    // This will not return until the last window is closed.
        // This runs the GUI's event loop handling painting and
        // user input and stuff like that.
    return app.exec();
}
