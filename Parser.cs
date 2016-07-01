
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Parser
{
    class Parser
    {
        private Boolean isDigit(Char number)
        {
            return (number.Equals('0') || number.Equals('1') || number.Equals('2') || number.Equals('3') || number.Equals('4')
                || number.Equals('5') || number.Equals('6') || number.Equals('7') || number.Equals('8') || number.Equals('9'));
        }

        private Boolean isConstant(string constant)
        {
            Boolean constantCorrect = true;
            for (int i = 0; i < constant.Length; i++)
            {
                if (!this.isDigit(constant[i]))
                {
                    constantCorrect = false;
                }
            }
            return constantCorrect;
        }

        private Boolean isVariable(Char variable)
        {
            return (variable.Equals('x') || variable.Equals('y') || variable.Equals('z'));
        }

        private Boolean isFactor(string factor)
        {
            Boolean factorCorrect = false;
            if (factor.Length == 1)
            {
                return (this.isVariable(factor[0]) || this.isDigit(factor[0]));
            }
            int bracketOpen = 0;
            int bracketClosed = 0;
            if (factor.Length > 1)
            {

                for (int i = 0; i < factor.Length; i++)
                {
                    if (factor[i] == '(')
                    {
                        bracketOpen++;
                        //test
                        Console.WriteLine("bracketOpen " + bracketOpen);
                    }
                    if (factor[i] == ')')
                    {
                        bracketClosed++;
                        //test
                        Console.WriteLine("bracketClosed " + bracketClosed);
                    }
                }
                if (bracketOpen == bracketClosed)
                {
                    factorCorrect = true;
                }
                if (bracketClosed == 0 && bracketOpen == 0)
                {
                    for (int k = 0; k < factor.Length; k++)
                    {
                        if (!this.isVariable(factor[k]))
                        {
                            factorCorrect = false;
                        }
                    }
                }
            }
            return factorCorrect;
        }

        private Boolean isTerm(string term)
        {
            String sub;
            int check = 0;
            Boolean termCorrect = true;
            Boolean operatorFound = false;
            for (int i = 0; i < term.Length; i++)
            {
                if (term[i] == '*' || term[i] == '/')
                {

                     operatorFound = true;
                     sub = term.Substring(check, i);
                     check = i + 1;
                     if (!this.isFactor(sub))
                     {
                         termCorrect = false;
                     }

                    int j = i;
                    while (i < term.Length - 2)
                    {
                        if (term[i + 1] == '*' || term[i + 1] == '/')
                        {
                            termCorrect = false;
                        }
                        j++;
                    }


                }

            }

            if (!operatorFound)
            {
                termCorrect = this.isFactor(term);
            }

            return termCorrect;
        }

        public Boolean isExpression(string expression)
        {
            String sub;
            int check = 0;
            Boolean termsCorrect = true;
            Boolean operatorsFound = false;
            for (int i = 0; i < expression.Length; i++)
            {
                if (expression[i] == '+' || expression[i] == '-')
                {
                    operatorsFound = true;
                    sub = expression.Substring(check, i);
                    check = i + 1;
                    if (!this.isTerm(sub))
                    {
                        termsCorrect = false;
                    }
                }

            }
            if (!operatorsFound)
            {
                termsCorrect = this.isTerm(expression);
            }
            return termsCorrect;
        }
        // public  void parse(Queue<String> s, Parser p, int stelle)
        // {
        //     Console.WriteLine(p.isExpression(s.ElementAt(stelle)));
        // }
    }
}
