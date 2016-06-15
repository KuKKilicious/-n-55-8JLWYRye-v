// ConsoleApplication1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>
#include <thread>
#include <mutex>
#include <vector>
#include <chrono>

std::mutex m;
std::vector<std::string> vec;
bool t1Done, t2Done;
void putTextintoVec(std::string filename/*, std::fstream& destFile*/) {
	bool imDone;
	imDone = false;
	std::fstream myFile;
	std::string line;
	
	myFile.open(filename);
	while (imDone == false) {
		

		if (myFile.is_open()) {
			if(std::getline(myFile, line)) {
				
					m.lock();
					vec.insert(vec.end(),line);
					m.unlock();
				
			}
			else imDone = true;
			

		}
		else  std::cout << "Unable to open file"; 
		
	}
	myFile.close();
	/*if (t1Done == false && t2Done == false) {
		t1Done = true;
	}
	else if (t1Done && t2Done == false ) {
		t2Done = true;
	}*/
}	

void getTextEndingInVec(std::string ending, std::vector<std::string> vec) {
	
	std::string line;
	int count;
	count = 0;
	for (int i = 0; i < vec.size(); i++)
	{
		if (vec.at(i).length() >= ending.length() && !(vec.at(i).compare(vec.at(i).length() - ending.length(), ending.length(), ending))) {	
			count++;
			
		}
	}
	std::cout << count;


}
int main()
{
	
	
	std::thread	t1(putTextintoVec, "mails1.txt");
	std::thread t2(putTextintoVec, "mails2.txt");
	//t1Done = false;
	//t2Done = false;

	if (t2.joinable())
	{
		t2.join();
	}
	if (t1.joinable())
	{
		t1.join();
	}
	/*while (t1Done == false && t2Done==false) {

	}*/
	std::thread t3(getTextEndingInVec, ".edu", vec);
	if (t3.joinable())
	{
		t3.join();

	}
//	for (auto i = vec.begin(); i != vec.end(); ++i)
//		std::cout << *i << '\n';
			
	int name = 123;
	std::cin >> name;
    return 0;
}	

