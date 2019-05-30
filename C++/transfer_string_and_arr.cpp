#include <iostream>
#include <string>

void myStr(std::string *, std::string *);
void my_arr_str(int, int, char [], char []);
int main()
{
    using namespace std;
/*  for string */
    string str1, str2;
    cout << "str1: ";
    cin >> str1;
    cout << "str2: ";
    cin >> str2;
    cout << "Before transfer-> str1 = " << str1 << ", str2 = " << str2 << endl;
    myStr(&str1, &str2);
    cout << "After transfer-> str1 = " << str1 << ", str2 = " << str2 << endl;

/*  for array*/
    cout << "Enter count of arr1: ";
    int count1 = 0;
    cin >> count1;
    char str_arr1[count1];
    cout << "Enter count of arr2: ";
    int count2 = 0;
    cin >> count2;
    char str_arr2[count2];
    cout << "str1:";
    cin >> str_arr1;
    cout << "str2:";
    cin >> str_arr2;
    cout << "Before transfer-> str1 = " << str_arr1 << " str2 = " << str_arr2 << endl;
    my_arr_str(count1, count2, str_arr1, str_arr2);
    cout << "After transfer-> str1 = " << str_arr1 << " str2 = " << str_arr2 << endl;

    return 0;
}

void myStr(std::string *s1, std::string *s2)
{
    std::string temp = *s1;
    *s1 = *s2;
    *s2 = temp;
}

void my_arr_str(int count1, int count2, char s1[], char s2[])
{
    int length = 0;
    if(count1 > count2)
    {
        length = count1;
        s1[length] = 0;
    }
    else
    {
        length = count2;
        s2[length] = 0;
    }


    for(int i = 0; i < length; i++){
        char temp = s1[i];
        s1[i] = s2[i];
        s2[i] = temp;
    }
}
