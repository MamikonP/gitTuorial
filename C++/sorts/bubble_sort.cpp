#include <iostream>
#include "swap.cpp"

int main()
{
	using namespace std;

	const int count = 5;
	int arr[count] = {30, 20, 60, 10, 50};

	cout << "Before bubble sort\n";
	for(int index = 0; index < count; index++)
		cout << arr[index] << " ";

	for(int iterator = 0; iterator < count; iterator++)
		for(int index = 0; index < count - 1; index++)
			swap(arr[index], arr[index + 1]);

	cout << "\nAfter bubble sort\n";
	for(int index = 0; index < count; index++)
		cout << arr[index] << " ";
	cout << endl;

	return 0;
}
