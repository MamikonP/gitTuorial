#include <iostream>
#include <ctype.h>

void convertToUpper(char *);
void f(const int *);

int main()
{
	using namespace std;

	char str[] = "My name is Mamikon";
	cout << "Before converting to upper->" << str << endl;
	convertToUpper(str);
	cout << "After converting to upper->" << str << endl;

	return 0;
}

void convertToUpper(char *sPtr)
{
	while(*sPtr != '\0') {
		*sPtr = toupper(*sPtr);
		++sPtr;
	}
}
