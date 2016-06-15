#pragma once
#include "Buffer.h"
class Producer
{
public:
	Producer();
	Producer(Buffer, int);
	void produce(Buffer, int);
	~Producer();
};

