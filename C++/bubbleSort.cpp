#include <iostream>
#include <ctime>

void setArray(int *, const int);
void getArray(int *, const int);
void bubbleSort(int *, const int);
void swap(int *, int *);

int main()
{
	srand(time(NULL));
	const int count = 10;
	int array[count];
	setArray(array, count);
	std::cout << "Before sorting -> ";
	getArray(array, count);
	bubbleSort(array, count);
	std::cout << "\nAfter sorting -> ";
	getArray(array, count);
	return 0;
}

void setArray(int *arr, const int size_arr)
{
	for(int i = 0; i < size_arr; i++)
		arr[i] = rand() % 100;
}

void getArray(int *arr, const int size_arr)
{
	for(int i = 0; i < size_arr; i++)
		std::cout << arr[i] << " ";
}

void swap(int *elem1, int *elem2)
{
	int temp = *elem1;
	*elem1 = *elem2;
	*elem2 = temp;
}

void bubbleSort(int *arr, const int size_arr)
{
	for(int i = 0; i < size_arr; i++)
		for(int j = 0; j < size_arr-1; j++)
			if(arr[j] > arr[j + 1])
				swap(&arr[j], &arr[j+1]);
}
