#include "swap.h"
void swap(int &small, int &large)
{
	if(small > large)
	{
		int temp = small;
		small = large;
		large = temp;
	}
}
