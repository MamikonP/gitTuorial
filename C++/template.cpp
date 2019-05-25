#include <iostream>
#include <string>

template<typename T>

//void tswap(T &, T &);
void tswap(T & a, T & b)
{
	a = a + b;
	b = a - b;
	a = a - b;
}

void swap(std::string& a, std::string& b)
{
	std::string temp = a;
	a = b;
	b = temp;
}

void tswap(char* a, char* b)
{
	tswap(*a, *b);
}

int main()
{
	using namespace std;
	int a = 5;
	int b = 7;
	cout << "a = " << a << " b = " << b << endl;
	tswap(a, b);
	cout << "a = " << a << " b = " << b << endl;

	float fa = 5.5, fb = 7.7;
	cout << "\nfa = " << fa << " fb = " << fb << endl;
	tswap(fa, fb);
	cout << "fa = " << fa << " fb = " << fb << endl;

	char ca = 'A', cb = 'B';
	cout << "\nca = " << ca << " cb = " << cb << endl;
	tswap(ca, cb);
	cout << "ca = " << ca << " cb = " << cb << endl;

	char pc[10] = "ABCDE", pd[10] = "ZXY";
	tswap(pc, pd);
	cout << "pc->" << pc << ", pd->" << pd << endl;

	string str1 = "Hello my name is Mamikon", str2 = "i am programmer";
	cout << "str1 = " << str1 << ", str2 = " << str2 << endl;
	swap(str1, str2);
	cout << "str1 = " << str1 << ", str2 = " << str2 << endl;

	return 0;
}

