#include "Buffer.h"
#include <queue>
#include <iostream>
#include <mutex>


std::mutex m3;
std::queue<int> buffer;
int capacity;
Buffer::Buffer(int maximumSize)
{
	capacity = maximumSize;
	std::cout << "max:Size = ";
	std::cout << capacity << '\n';



}

bool Buffer::push(int abc) {
	if (!isFull()) {

		m3.lock();
		buffer.push(abc);
		std::cout << "the queue contains: ";
		std::cout << abc<<  '\n';
		std::cout << "the size of Buffer is: ";
		std::cout << buffer.size()<< '\n'; 
		m3.unlock();
		return true;
	}
	else {
		std::cout << "Buffer full" << '\n';
		return false;
	}
}


bool Buffer::isEmpty() {
	return(buffer.empty());
}

bool Buffer::isFull() {
	if (buffer.size() == capacity) {
		return true;
	}
	else {
		return false;
	}
}

int Buffer::pop() {
	int test;
	m3.lock();
	if (!isEmpty()) {
		
		test = buffer.front();
		buffer.pop();
		m3.unlock();		
	return test;
	}
	else {
		m3.unlock();
		return -1;
		
	}
}



Buffer::~Buffer()
{

}
