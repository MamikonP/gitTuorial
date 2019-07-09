#include <iostream>
#include <ctime>
#include "swap.cpp"

int main()
{
	using namespace std;
	srand(time(NULL));

	int size = 0;
	cout << "Enter count of array:";
	cin >> size;
	
	int arr[size];
	
	for(int i = 0; i < size; i++)
		arr[i]= rand() % 100;
	
	cout << "Before shell sort\n";
	
	for(int i = 0; i < size; i++)
		cout << arr[i] << " ";
	
	bool condition = true;
	
	if(condition)
	{
		for(int i = 0; i < size / 2; i++)
		{
			if(arr[i] > arr[size/2 + i])
				swap(arr[i], arr[size/2 + i]);
		}

		for(int i = 0; i < size / 2; i++)
		{
			if(arr[i] > arr[i + 2])
				swap(arr[i], arr[i+2]);
		}
		
		for(int i = 1; i < size; i++)
		{
			int index = i;
			while(index > 0 && arr[index - 1] > arr[index])
			{
				swap(arr[index-1], arr[index]);
				index--;
			}
		}
		condition = false;
	}	

	cout << "\nAfter shell sort\n";
	
	for(int i = 0; i < size; i++)
		cout << arr[i] << " ";
	
	return 0;
}
