'''
Created on May 29, 2016

@author: KuKKi
'''
import abc
from Problem import Problem
class divisibleProblem(Problem):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
    def computeSolution(self):
        while True :
            self.checksolvability()
            if(self.directlysolvable):
                break
            self.divide()
    @abc.abstractmethod
    def checksolvability(self):
        return
    @abc.abstractmethod
    def divide(self):
        return
