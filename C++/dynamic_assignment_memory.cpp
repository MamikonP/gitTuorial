#include <iostream>

int main()
{
	using namespace std;
	
	int countOfArr = 1;
	int* arr = new int[countOfArr];
	int num_for_array = 0;
	int first_element_arr = 0;

	if (countOfArr == 1)	//condition for first element array
	{
		cout << "Enter element for array: ";
		cin >> num_for_array;
		if (num_for_array >= 0)
			*(arr+first_element_arr) = num_for_array;
		first_element_arr++;
	}

	if(countOfArr == 1)
	{
		cout << *arr;
		num_for_array = 0;
		cout << "\nEnter element for array: ";
		cin >> num_for_array;
		
		while (num_for_array != -1)
		{
			int* arr2 = new int[countOfArr+1];
			
			for(int i = 0; i < countOfArr; i++)
				arr2[i] = arr[i];
			arr2[countOfArr] = num_for_array;

			delete [] arr;

			arr = new int[countOfArr+1];

			for(int i = 0; i < countOfArr+1; i++)
				*(arr + i) = *(arr2 + i);
	
			for(int i = 0; i < countOfArr+1; i++)
				cout << *(arr + i) << (i < countOfArr ? "," : "\n");
	
			delete [] arr2;
			countOfArr++;
		
			cout << "\nEnter element for array: ";
			cin >> num_for_array;
		}
	}
	return 0;
}
