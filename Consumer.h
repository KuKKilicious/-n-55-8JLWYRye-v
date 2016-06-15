#pragma once
#include "Buffer.h"
class Consumer
{
public:
	
	Consumer(Buffer);
	~Consumer();
	void consume(Buffer);
};

