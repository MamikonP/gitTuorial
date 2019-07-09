#include <iostream>
#include <ctime>
#include "swap.cpp"

int main()
{
	using namespace std;

	srand(time(NULL));	

	int size_arr = 0;
	cout << "Enter count of array:";
	cin >> size_arr;
	
	int arr[size_arr];
	
	for(int i = 0; i < size_arr; i++)
		arr[i] = rand() % 100;
	
	cout << "Before insertion sort" << endl;

	for(int i = 0; i < size_arr; i++)
		cout << arr[i] << " ";
	
	for(int index = 1; index < size_arr; index++)
	{
		int arr_index = index;
		while(arr_index > 0 && arr[arr_index - 1] > arr[arr_index])
		{
			swap(arr[arr_index-1], arr[arr_index]);
			arr_index--;
		}
	}

	cout << "\nAfter insertion sort" << endl;

	for(int i = 0; i < size_arr; i++)
		cout << arr[i] << " ";
	cout << endl;

	return 0;
}
