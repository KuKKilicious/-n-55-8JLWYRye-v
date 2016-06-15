#pragma once

class Buffer
{
public:
	
	Buffer(int);
	bool push(int);
	int pop();
	bool isFull();
	bool isEmpty();
	~Buffer();
	//std::queue<Type> buffer;


};
