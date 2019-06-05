#include <iostream>
#include <string>

int main()
{
	using namespace std;
	string str = " ";
	while (str != "exit")
	{
		bool is_polindrom = true;
		cout << "Enter word: ";
		cin >> str;
		int len = str.length();
		for(int i = 0; i < len / 2; i++)
		{
			if(str[i] == str[len-i-1])
				continue;
			else 
			{
				is_polindrom = false;
				break;
			}
		}
		if(is_polindrom == true)
			cout << "is polindrom\n";
		else
			cout << "isn't polindrom\n";
	}

	return 0;
}
