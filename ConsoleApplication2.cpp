// ConsoleApplication2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <queue>
#include "Buffer.h"
#include <iostream>
#include "Consumer.h"
#include "Producer.h"
#include <thread>
#include <time.h>
#include <mutex>
std::mutex mutex;
int main(int argc, char* argv[])
{
	std::mutex * m;
	m = &mutex;
	srand(time(NULL));
	int name;
	
	Buffer buf(atoi(argv[1]));
	
	for (int j = 0; j < atoi(argv[2]); j++)
	{
		Consumer cons(buf);
	}
	for (int i = 0; i < atoi(argv[3]); i++)
	{
		Producer prod(buf, i);
	}


	std::cin >> name;


    return 0;
}

