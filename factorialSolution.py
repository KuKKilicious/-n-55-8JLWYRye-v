'''
Created on May 29, 2016

@author: KuKKi
'''
from Solution import Solution
class factorialSolution(Solution):
    '''
    classdocs
    '''
    

    def __init__(self):
        '''
        Constructor
        '''
    def setit(self, facresult):
        if(facresult>0):
            self.facresult=facresult
        else:
            print("ERROR!")
    def getit(self):
        return self.facresult
