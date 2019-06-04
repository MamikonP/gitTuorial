#include "stdio.h"

struct human
{
	int age;
	float weight;
	long long salary;
	char *name;
} Human;

struct human2
{
	char *name;
	float weight;
	int age;
	long long salary;
} Human2;

void swap_struct (struct human *hum, struct human2 *hum2)
{
	//----->>> age
	struct human temp;
	temp.age = hum->age;
	hum->age = hum2->age;
	hum2->age = temp.age;
	//----->>> salary
	temp.salary = hum->salary;
	hum->salary = hum2->salary;
	hum2->salary = temp.salary;
	//----->>> weight
	temp.weight = hum->weight;
	hum->weight = hum2->weight;
	hum2->weight = temp.weight;
	//----->>> name
	temp.name = hum->name;
	hum->name = hum2->name;
	hum2->name = temp.name;
}

int main()
{
	Human.age = 45;
	Human.weight = 78.36;
	Human.salary = 54000000;
	Human.name = "James Bond";

	Human2.age = 36;
	Human2.weight = 54.62;
	Human2.salary = 4858000;
	Human2.name = "Jack";

	printf("Before swap-------------------\n");
	printf("h1->name = %s\t", Human.name);
	printf("h2->name = %s\n", Human2.name);

	printf("h1->age = %d\t", Human.age);
	printf("h2->age = %d\n", Human2.age);

	printf("h1->salary = %lld\t", Human.salary);
	printf("h2->salary = %lld\n", Human2.salary);

	printf("h1->weight = %f\t", Human.weight);
	printf("h2->weight = %f\n", Human2.weight);

	swap_struct(&Human, &Human2);
	printf("\nAfter swap-------------------\n");
	
	printf("h1->name = %s\t", Human.name);
	printf("h2->name = %s\n", Human2.name);

	printf("h1->age = %d\t", Human.age);
	printf("h2->age = %d\n", Human2.age);

	printf("h1->salary = %lld\t", Human.salary);
	printf("h2->salary = %lld\n", Human2.salary);

	printf("h1->weight = %f\t", Human.weight);
	printf("h2->weight = %f\n", Human2.weight);

	return 0;	
}
