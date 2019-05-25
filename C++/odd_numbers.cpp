#include <iostream>
#include <ctime>

int main()
{
	srand(time(NULL));
	int count = 0;
	std::cout << "Enter count of array:";
	std::cin >> count;
	int arr[count];

	for (int i = 0; i < count; i++)
	{
		arr[i] = rand() % 100;
		if(arr[i] % 2 == 1)
			std::cout << "odd number -> " << arr[i] << std::endl;
		else if(arr[i] % 2 == 0)
			std::cout << "even number -> " << arr[i] << std::endl;
	}

	return 0;
}
