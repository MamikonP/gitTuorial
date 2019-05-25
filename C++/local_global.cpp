#include <iostream>
#include <iomanip>

void example();

int var = 50;
int a = 45;
float num = 78.64;

int main()
{
	int var = 12;
	var++;
	std::cout << "local var = " << var << std::endl;
	
	example();

	double a = 78.23;
	std::cout << "local a = " << a << std::endl;
	std::cout << "global a = " << ::a << std::endl;

	a = static_cast<double>(::a);
	a = 64.3256;
	std::cout << std::fixed;
	std::cout << std::setprecision(2) << "after cast global a = " << a << std::endl;

	int num = 12;
	std::cout << "local num = " << num << std::endl;
	std::cout << "global num = " << ::num << std::endl;
	num = static_cast<int>(::num);
	std::cout << "after cast local num = " << num << std::endl;
	
	return 0;
}

void example()
{
	var++;
	std::cout << "global var = " << var << std::endl;	
}
