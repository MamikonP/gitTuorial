#include <iostream>
#include "swap.cpp"

int main()
{
	using namespace std;

	const int count = 5;
	int arr[count] = {30, 20, 60, 10, 50};

	cout << "Before Selection Sort\n";
	for(int index = 0; index < count; index++)
		cout << arr[index] << " ";

	for(int startIndex = 0; startIndex < count - 1; startIndex++)
	{
		int smallIndex = startIndex;
		for(int currentIndex = startIndex + 1; currentIndex < count; currentIndex++)
		{
			if(arr[currentIndex] < arr[smallIndex])
				smallIndex = currentIndex;				
		}

		swap(arr[startIndex], arr[smallIndex]);
	}

	cout << "\nAfter Selection Sort\n";
	for(int index = 0; index < count; index++)
		cout << arr[index] << " ";
	cout << "\n";

	return 0;
}
