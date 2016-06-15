#include "Producer.h"
#include "Buffer.h"
#include <iostream>
#include <thread>
#include <mutex>
std::mutex m;
Producer::Producer(Buffer buf, int seed){
	std::thread t1(&Producer::produce, this, buf, seed);
	std::cout << '\n';
	t1.detach();
	
}
Producer::Producer() {

}

void Producer::produce(Buffer buf, int seed) {
	bool isDone = false;
	std::srand(seed * 42);
	while (!isDone) {
		std::this_thread::sleep_for(std::chrono::milliseconds(500));
		m.lock();
		buf.push(rand());
		
		m.unlock();
	}

}

Producer::~Producer()
{
}
