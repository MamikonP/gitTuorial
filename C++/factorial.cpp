#include <iostream>

int main()
{
	using namespace std;

	int number = 0;
	cout << "Enter number:";
	cin >> number;
	int fact = 1;
	for(int i = 1; i <= number; i++)
		fact *= i;
	cout << number << "! = " << fact << endl;

	number = 0;
	fact = 1;
	cout << "Enter number:";
	cin >> number;
	int temp = number;
	while(number != 0)
	{
		fact *= number;
		number--;
	}
	cout << temp << "! = " << fact << endl;

	return 0;
}
