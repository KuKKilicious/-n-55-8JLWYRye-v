'''
Created on May 29, 2016

@author: KuKKi
'''
from abc import ABCMeta, abstractmethod
from Solution import Solution
class Problem(object):
    '''
    classdocs
    '''
    __metaclass__=ABCMeta
    s=Solution()
    def __init__(self, params):
        '''
        Constructor
        '''
        
