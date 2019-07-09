#include <iostream>
/*
##########################################################
# MODULE    : main.cpp  
# PURPOSE   : Program - declaration methods of class List STL
# DATE      : 09.07.2019
# REVISIONS : 1.0
##########################################################
*/

template <typename T>
class List
{
public:
	List();
	~List();
	void push_back(T data);			// add element at the end
	void push_front(T data);		// add element at the first
	void insert(T data, int index);	// add element at index N
	void pop_front();				// delete first element
	void pop_back();				// delete first element
	void removeAt(int index);		// delete element at index
	void clear();					// delete all elements
	int get_size() { return _size; }// size of list elements
	T& operator[](const int index); // operator[] for take index of list
private:
	// Node - element List
	template <typename t>
	class Node {
	public:
		Node<T> *pNext;		// next address list
		T data;				// data - variable for list
		Node(T data = T(), Node *pNext = nullptr)
		{
			this->data = data;
			this->pNext = pNext;
		}
	};
	int _size;		// size of element
	Node<T> *head;	// the first element in list
};

