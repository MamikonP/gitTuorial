#include "int_str.cpp"
#include "str_int.cpp"

#ifdef MAIN_CPP

int main()
{
	using namespace std;

	int a = 65;

	cout << int_to_string(a) << endl;

	const char *name = "Mamikon";

	int *ptr= string_to_int(name);

	cout << name << " -> ";
	for(int i = 0; i < sizeof(ptr) - 1; i++)
		cout << ptr[i] << " ";

	cout << endl;

	return 0;
}

#else

#error "Please attach library!!!"

#endif
