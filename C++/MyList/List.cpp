#include <iostream>
#include "List.h"
/*
##########################################################
# MODULE    : List.cpp  
# PURPOSE   : Program - realization class List STL
# DATE      : 09.07.2019
# REVISIONS : 1.0
##########################################################
*/

template <typename T>
List<T>::List()
{
	_size = 0;
	head = nullptr;
}

template <typename T>
List<T>::~List()
{
	std::cout << "Calling destructor" << std::endl;
	clear();
}

template <typename T>
void List<T>::push_back(T data)
{
	if (head == nullptr)
		head = new Node<T>(data);
	else {
		Node<T> *current = this->head;	// current element

		while(current->pNext != nullptr)
			current = current->pNext;	 

		current->pNext = new Node<T>(data);
	}
	_size++;
}

template <typename T>
T& List<T>::operator[](const int index)
{
	int counter = 0;
	Node<T> *current = this->head;

	while(current != nullptr)
	{
		if(counter == index)
			return current->data;	
		counter++;
		current = current->pNext;
	}
	return current->data;
}

template <typename T>
void List<T>::pop_front()
{
	Node<T> *temp = head;
	head = head->pNext;
	delete temp;
	_size--;
}

template <typename T>
void List<T>::clear()
{
	while(_size)
		pop_front();
}

template <typename T>
void List<T>::push_front(T data)
{
	head = new Node<T>(data, head);
	_size++;	
}

template <typename T>
void List<T>::insert(T data, int index)
{
	if(index == 0)
		push_front(data);
	else {
		Node<T> *previous = this->head;
	
		for(int i = 0; i < index - 1; i++)
			previous = previous->pNext;
		
		Node<T> *newNode = new Node<T>(data, previous->pNext);
	
		previous->pNext = newNode;
	
		_size++;
	}
}

template<typename T>
void List<T>::removeAt(int index)
{
	if(index == 0)
		pop_front();
	else {
		Node<T> *previous = this->head;
	
		for(int i = 0; i < index - 1; i++)
			previous = previous->pNext;
		
		Node<T> *toDelete = previous->pNext;
	
		previous->pNext = toDelete->pNext;

		delete toDelete;
	
		_size--;
	}
}

template<typename T>
void List<T>::pop_back()
{
	removeAt(_size - 1);
}

