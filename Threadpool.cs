using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApplication3
{
    class Program
    {
        static String line;
        static Parser pars;
        public static void Main(string[] args)
        {
            try
            {
                using (StreamReader sr = new StreamReader("C:\\Users\\Admin\\Desktop\\expressions.txt")) {
                line = sr.ReadLine();
                ThreadPool.SetMinThreads(3, 3);
                ThreadPool.SetMaxThreads(3, 3);
                while (!sr.EndOfStream) { 
                    ThreadPool.QueueUserWorkItem(new WaitCallback(read), line);
                    line = sr.ReadLine();
                }
                }
            }
            catch (Exception e)
            {
                e.Message.ToString();
            }
            Console.WriteLine("Main thread exits.");
            Console.ReadLine();
            }

        private static void Parser(object obj)
        {
            throw new NotImplementedException();
        }

        public static void read(Object stateInfo)
        {
            string lineToRead = (string)stateInfo;
          // Open the text file using a stream reader.
            stateInfo.ToString();
            try{
                    // Read the stream to a string, and write the string to the console.  
                    Console.WriteLine("\n" + Thread.CurrentThread.ToString() + ": " + line);
                    pars.parseExpression(line);    
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.ReadLine();
            }
        }
    }
}
