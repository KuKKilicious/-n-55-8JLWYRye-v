'''
Created on May 29, 2016

@author: KuKKi
'''
from ListSolution import ListSolution
from divisibleProblem import divisibleProblem
class ListProblem(divisibleProblem):
    '''
    classdocs
    '''
    list=list()
    searchVar=0
    left=0

    def __init__(self):
        '''
        Constructor
        '''
    
    def setit(self, searchVar,listts):
        self.list=listts
        self.searchVar=searchVar
        self.right=listts.__len__()
        self.right=self.right-1
        self.currentnumber=None
        self.index=int((self.left+self.right)/2)
        self.directlysolvable=False
        divisibleProblem.computeSolution(self)
    def checksolvability(self):
        if(self.searchVar==self.currentnumber):
            self.directlysolvable=True
            ListSolution().setit(self.index)
        if(self.left>self.right):
            raise Exception("search not successful")
    def divide(self):
        self.index=int((self.left+self.right)/2)
        if(self.list[self.index]<self.searchVar):
            self.left=self.index+1
        elif(self.list[self.index]>self.searchVar):
            self.right=self.index-1
        self.currentnumber=self.list[self.index]
