#include <iostream>
#include <string>

void tableWorkerData();

struct WorkerData {
	int id;
	std::string name;
	std::string surname;
	std::string post;
	int hour_pay;
	int hours;
	int salary;
};

int main()
{
	using namespace std;
	
	tableWorkerData();
	WorkerData workers[10];
	int indexData = 0;
	char operation = 0;
	bool condition = true;
	int my_id = 0;
	bool both_id = true;

	while(condition)
	{
		std::cout << "Enter operation: ";
		std::cout << "\nN New worker.";
		std::cout << "\nF Find worker.";
		std::cout << "\nD Delete data.";
		std::cout << "\nV Show all workers.";
		std::cout << "\nQ Quit." << std::endl;
		std::cin >> operation;
		switch(operation)
		{
			case 'N':
			case 'n':
				cout << "Enter data: \nid: ";
				cin >> workers[indexData].id;
				for(int i = 0; i < indexData; i++)
					for(int j = 0; j < i; j++)
						if(workers[indexData].id == workers[j].id) {
							cout << "That ID is busy" << endl;
							both_id = false;
							break;
						}
				if(both_id)
				{
					cout << "Name: ";
					cin >> workers[indexData].name;
					cout << "Surname: ";
					cin >> workers[indexData].surname;
					cout << "Post: ";
					cin >> workers[indexData].post;
					cout << "h/pay: ";
					cin >> workers[indexData].hour_pay;
					cout << "Hours: ";
					cin >> workers[indexData].hours;
					workers[indexData].salary = workers[indexData].hour_pay * workers[indexData].hours;
				}
				else
					break;
				break;
			case 'F':
			case 'f':
				cout << "Enter ID to find worker: ";
				cin >> my_id;
				for(int i = 0; i < 10; i++)
				{
					if (workers[i].id == my_id)
						tableWorkerData();
						cout << workers[i].id << "\t" << workers[i].surname << "\t" << workers[i].name << "\t\t";
						cout << workers[i].post << "\t" << workers[i].hour_pay << "\t\t" << workers[i].hours << "\t" << workers[i].salary << endl;
						break;
				}
				my_id = 0;
				break;
			case 'D':
			case 'd':
				cout << "Enter ID to delete worker: ";
				cin >> my_id;
				for (int i = 0; i < 10; i++)
				{
					if(workers[i].id == my_id)
					{
						for(int j = i; j < 9; j++)
						{
							workers[j].id = workers[j+1].id;
							workers[j+1].id = 0;
							workers[j].surname = workers[j+1].surname;
							workers[j+1].name = "";
							workers[j].name = workers[j+1].name;
							workers[j+1].surname = "";
							workers[j].post = workers[j+1].post;
							workers[j+1].post = "";
							workers[j].hour_pay = workers[j+1].hour_pay;
							workers[j+1].hour_pay = 0;
							workers[j].hours = workers[j+1].hours;
							workers[j+1].hours = 0;
							workers[j].salary = workers[j+1].salary;
							workers[j+1].salary = 0;
						}
					}
				}
				break;
			case 'V':
			case 'v':
				tableWorkerData();
				for(int i = 0; i < indexData; i++)
				{
					if(workers[i].id == 0 and workers[i].name == "" and workers[i].surname == "")
						continue;
					else {
						cout << workers[i].id << "\t" << workers[i].surname << "\t" << workers[i].name << "\t\t";
						cout << workers[i].post << "\t" << workers[i].hour_pay << "\t\t" << workers[i].hours << "\t" << workers[i].salary << endl;
					}
				}
				break;
			case 'Q':
			case 'q':
				return 0;
			default:
				continue;
		}
		indexData++;
	}

	return 0;
}

void tableWorkerData()
{
	std::cout << "ID\tSurname\t\tName\t\tPost\t\th/pay\t\thours\tSalary" << std::endl;
	for(int i = 0; i < 100; i++)
		std::cout << "-";
	std::cout << "\n";
}
