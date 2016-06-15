#include "Consumer.h"
#include "Buffer.h"
#include <iostream>
#include <thread>
#include <mutex>
std::mutex m2;

Consumer::Consumer(Buffer buf)
{
	std::thread t1(&Consumer::consume, this, buf);
	std::cout << '\n';
	t1.detach();
}


void Consumer::consume(Buffer buf) {
	while (true) {

		std::this_thread::sleep_for(std::chrono::milliseconds(500));
		int abc;
		m2.lock();
		abc = buf.pop();
		if (abc >= 0) {
			std::cout << "the output is: ";
			std::cout << abc << '\n';
		
		}
		m2.unlock();
	}

}

Consumer::~Consumer()
{
}
