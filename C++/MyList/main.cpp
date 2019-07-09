#include <iostream>
#include <ctime>
#include "List.cpp"
/*
##########################################################
# MODULE    : main.cpp  
# PURPOSE   : Program - realization class List STL
# DATE      : 09.07.2019
# REVISIONS : 1.0
##########################################################
*/

int main()
{
	using namespace std;
	srand(time(NULL));

	List<int> lst;

	int number = 0;
	cout << "Enter count for added element to list: ";
	cin >> number;

	for(int i = 0; i < number; i++)
		lst.push_back(rand() % 100);	

	cout << "\nCount of list elements is " << lst.get_size() << endl;

	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";
	///////////////////////////////////////
	cout << "\n\nMethod pop_front()\n";
	lst.pop_front();
	cout << "Now count of list elements is " << lst.get_size() << endl;
	
	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";

	///////////////////////////////////////
	cout << "\n\nMethod push_front()\n";
	lst.push_front(rand() % 100);
	cout << "Now count of list elements is " << lst.get_size() << endl;
	
	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";

	///////////////////////////////////////
	cout << "\n\nMethod insert()\n";
	lst.insert(5000, 3);
	cout << "Now count of list elements is " << lst.get_size() << endl;
	
	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";
	
	///////////////////////////////////////
	cout << "\n\nMethod removeAt()\n";
	lst.removeAt(3);
	cout << "Now count of list elements is " << lst.get_size() << endl;
	
	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";

	///////////////////////////////////////
	cout << "\n\nMethod pop_back()\n";
	lst.pop_back();
	cout << "Now count of list elements is " << lst.get_size() << endl;
	
	for(int i = 0; i < lst.get_size(); i++)
		cout << lst[i] << " ";

	///////////////////////////////////////
	cout << "\n\nMethod clear()\n";
	lst.clear();
	cout << "Now count of list elements is " << lst.get_size() << endl;

	cout << endl;
	
	return 0;
}
