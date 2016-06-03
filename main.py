'''
Created on May 29, 2016

@author: KuKKi
'''
from sys import argv
from factorialProblem import factorialProblem
from factorialSolution import factorialSolution
from ListProblem import ListProblem
from ListSolution import ListSolution
if __name__ == '__main__':
    pass   
 
print(argv)
if(argv.__len__()<=1):
    print("Invalid number of arguments")
    print("Please input numbers separated by spaces")
elif(argv.__len__()==2):
    try:
        #do factorial problem solving
        if(int(argv[1])>=0):
            print("Doing factorial problem solving..")
            factorial_problem=factorialProblem()
            factorial_problem.setit(int(argv[1]))
            print("Result of %d! is: %d" % (int(argv[1]), factorialSolution.getit(factorial_problem)))
            
        else:
            "Please input non-negative integer"
    except(ValueError):
        print("Please input integers-only.")
        
else:
    print("Doing list problem solving..")
    searchVar=int(argv[1])
    #print (searchVar)
    ListToSearch=list()
    try:
        for entries in range(2,argv.__len__()):
            ListToSearch.append(int(argv[entries]))
        ListToSearch.sort(key=None, reverse=False)
        #print(ListToSearch)
        list_problem=ListProblem()
        list_problem.setit(searchVar, ListToSearch)
        
        
        print("Found number %d in List" % searchVar)
    except(ValueError):
        print("Please input integers-only.")
    except(Exception): 
        print("Number not in the list.")
        
    
    
