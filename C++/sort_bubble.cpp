#include <iostream>
#include <iomanip>
#include <ctime>

void bubble(int *, const int, int(*)(int, int));
int ascending(const int, const int);
int descending(const int, const int);
void swap(int *, int *);
void setarray(int *, const int);
void getarray(int *, const int);

int main()
{
	using namespace std;
	srand(time(NULL));

	int count = 0;
	cout << "Enter count of array: ";
	cin >> count;
	int *ptr_arr = new int[count];

	setarray(ptr_arr, count);
	getarray(ptr_arr, count);	

	int order = 0;
	cout << "\nEnter order (1/2) to sort array (ascending/descending): ";
	cin >> order;

	if (order == 1)
	{
		bubble(ptr_arr, count, ascending);
		cout << "Elements sorted is ascending:\n";
		getarray(ptr_arr, count);
	}

	else
	{
		bubble(ptr_arr, count, descending);
		cout << "Elements sorted is descending:\n";
		getarray(ptr_arr, count);		
	}
	
	return 0;
}

int ascending(const int a, const int b)
{
	return a > b;
}

int descending(const int a, const int b)
{
	return a < b;
}

void swap(int *el1, int *el2)
{
	int temp = *el1;
	*el1 = *el2;
	*el2 = temp;
}

void bubble(int *array, const int size, int(*compare)(int, int))
{
	for(int i = 0; i < size; i++)
		for(int j = 0; j < size-1; j++)
			if((*compare)(array[j], array[j+1]))
				swap(&array[j], &array[j+1]);
}

void setarray(int *arr, const int size)
{
	for(int i = 0; i < size; i++)
		*(arr + i) = rand() % 100;
}

void getarray(int *arr, const int size)
{
	for(int i = 0; i < size; i++)
		std::cout << *(arr + i) << std::setw(4);
}
