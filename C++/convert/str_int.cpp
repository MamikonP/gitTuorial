#include "method_of_string.h"

#ifndef MAIN_CPP

#define MAIN_CPP
#include <iostream>

#endif

int *string_to_int(const char *symbol)
{
	int length = 0;
	int len_sym = sizeof(symbol)-1;

	while(len_sym != 0)
	{
		length++;
		len_sym--;
	}

	int *res = new int [length];

	for(int i = 0; i < length; i++)
	{
		if(symbol[i] < 0 || symbol[i] > 255)
			continue;
		else
			res[i] = symbol[i];
	}

	return res;
}
