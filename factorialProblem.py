'''
Created on May 29, 2016

@author: KuKKi
'''

from factorialSolution import factorialSolution
from divisibleProblem import divisibleProblem
class factorialProblem(divisibleProblem):
    '''
    classdocs
    '''
    factorial_solution=factorialSolution()
    def __init__(self):
        '''
        Constructor
        '''
        
    def setit(self,fac):
        self.fac=fac
        self.facresult=1
        self.directlysolvable=False
        divisibleProblem.computeSolution(self)
    def checksolvability(self):
        if(self.fac==1 or self.fac==0):
            self.directlysolvable=True
            self.factorial_solution.setit(self.facresult)            
    def divide(self):
        self.facresult=self.facresult*self.fac
        self.fac=self.fac-1
        
