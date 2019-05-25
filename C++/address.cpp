#include <iostream>
#include <cstdlib>
#include <ctime>

void swap1 (int, int);
void swap2 (int *, int *);
void swap3 (int &, int &);
// перегрузка функцией
void max(int &, int &);
int max(int, int, int);
void max(const int *, int);
float& max(float&, float&);


int main()
{
	srand(time(NULL));
	using namespace std;
	int donuts = 6;
	double cups = 4.5;

	cout << "donuts value = " << donuts;
	cout << " and donut address = "<< &donuts << endl; 
	cout << "cups value = " << cups;
	cout << " and cups address = "<< &cups << endl; 

	int updates = 6;
	int *ptr_updates = &updates;
	cout << "Values: updates = " << updates;
	cout << ", *ptr_updates = " << *ptr_updates << endl;
	cout << "Adresses: &updates = " << &updates;
	cout << ", ptr_updates = " << ptr_updates << endl;
	*ptr_updates = * ptr_updates + 1;
	cout << "Now updates = " << updates << endl;

	void *ptr_ptrupdates = ptr_updates;
	cout << "ptr_ptrupdates = " <<ptr_ptrupdates << endl;

	int &up = updates;
	++up;
	cout << "updates = " << updates << ", up = " << up << endl;
	cout << "&updates = " << &updates << ", &up = " << &up << endl;

	int x = 9;
	int y = 15;
	
	cout << "\nx = " << x << ", y = " << y << endl;
	swap1(x, y);
	cout << "after swap1 -> x = " << x << ", y = " << y << endl;
	swap2(&x, &y);
	cout << "after swap2 -> x = " << x << ", y = " << y << endl;
	swap3(x, y);
	cout << "after swap3 -> x = " << x << ", y = " << y << endl;

	int value = 7;
	int *ptr_value = &value;
	cout << "\nvalue - " << value << endl;
	cout << "&value - " << &value << endl;
	cout << "ptr_value - " << ptr_value << endl;
	cout << "*ptr_value - " << *ptr_value << endl;
	cout << "&ptr_value - " << &ptr_value << endl;
	int **ptr_ptrvalue = &ptr_value;
	cout << "ptr_ptrvalue - " << ptr_ptrvalue << endl;
	cout << "*ptr_ptrvalue - " << *ptr_ptrvalue << endl;
	cout << "**ptr_ptrvalue - " << **ptr_ptrvalue << endl;


	int *p = new int(100);	//create object in the 'heap'
							//100 object inicializator
//	p = NULL;
	if (!p)	//выделилось память или NULL
	{
		cout << p;
	}
	else 
	{
		cout << "\n" << p << '\t' << *p << endl;
		x = *p;
		cout << "x = " << x << endl;
		
		*p = 2 * x;
		cout << p << '\t' << *p << endl << endl;
		delete p;
	}

	int *arr = new int[10];

	if(!arr)
		cout << arr;
	else
	{
		for(int i = 0; i < 10; ++i)
			arr[i] = i * i;
		for(int i = 0; i < 10; i++)
			cout << arr[i] << (i < 9 ? "," : "\n");

		delete [] arr;
	}

	int a, b, c;
	a = 11;
	b = 17;
	c = 19;

	cout << "\n";
	max(a, b);
	int my_max = max(a, b, c);
	cout << "max is max(int, int, int) " << my_max << endl;
	
	int count_arr = 10;
	int *array = new int[count_arr];
	for (int i = 0; i < count_arr; i++)
	{
		array[i] = rand() % 100;
		cout << arr[i] << ", ";
	}
	max(array, count_arr);

	int n1 = 8;
	int &nn1 = n1;
	cout << "\n&n1 = " << &n1 << ", &nn1 = " << &nn1 << endl;
	cout << "n1 = " << n1 << ", nn1 = " << nn1 << endl;
	nn1 = a;
	cout << "&n1 = " << &n1 << ", &nn1 = " << &nn1 << endl;
	cout << "n1 = " << n1 << ", nn1 = " << nn1 << endl;
	const int& nr = n1;
	n1 = 45;
//	nr = 78;	error read-only
	cout << "&n1 = " << &n1 << ", &nr = " << &nr << endl;
	cout << "n1 = " << n1 << ", nr = " << nr << endl;

	float num1 = 78.32; 
	float num2 = 78.31;
	float maximum = ++max(num1, num2);
	cout << "\nmax is float& max(num1, num2) is " << maximum << endl;

	return 0;
}

void swap1 (int a, int b)
{
	int temp = a;
	a = b;
	b = temp;
}

void swap2 (int *a, int *b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void swap3 (int &a, int &b)
{
	int temp = a;
	a = b;
	b = temp;
}

void max(int &a, int &b)
{
	if (a > b)
		std::cout << "max is " << a << std::endl;
	else
		std::cout << "max is " << b << std::endl;
}

int max(int a, int b, int c)
{
	int m = a;

	if (m < b)
		m = b;
	if (m < c)
		m = c;

	return m;	
}

void max(const int *arr, int count)
{
	int max = arr[0];
	
	for (int i = 1; i < count; i++)
	{
		if (max < arr[i])
			max = arr[i];
	}
	
	std::cout << "max is " << max << std::endl;
	delete [] arr;
}

float& max(float &a, float &b)
{
	return a > b ? a : b;
}
