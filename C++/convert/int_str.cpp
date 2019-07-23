#ifndef MAIN_CPP
#define MAIN_CPP

#include <iostream>

#endif

#include "method_of_string.h"

char int_to_string(int num)
{
	char symbol = 0;
	if(num < 0 || num > 255)
		exit(0);
	else
		symbol = (char)num;

	return symbol;
}

