using System;
namespace zydd
{
    class Program
    {
        //独立任务最优调度函数，参数为两组任务和任务个数，最优时间和顺序结果。
        static void DlrwZydd(int[] a, int[] b, int n, int[] least, string[] result)
        {
            //首先给一个大值。
            for (int i = 0; i < n; i++)
            {
                least[i] = 99;
            }

            //若任务只有一台机器完成，求得两个时间。
            int aSum = 0, bSum = 0;
            for (int i = 0; i < n; i++)
            {
                aSum += a[i];
                bSum += b[i];
            }
            //小值加1作为数组的列数，减少存储空间。
            int Sum = 1 + Math.Min(aSum, bSum);

            //创建四个行数列数相同的数组，timeA存储机器A可能用的时间，timeB存储对应机器B用的时间，
            //timeMax记录两者共需的时间，即较大的那个；who则标识完成该任务的机器是A还是B。
            int[,] timeA = new int[n, Sum];
            int[,] timeB = new int[n, Sum];
            int[,] timeMax = new int[n, Sum];
            char[,] who = new char[n, Sum];
            char[] tempRlt = new char[n];//tempRlt记录机器完成任务的机器顺序，并逐一赋值给result


            //先计算第1个任务相关值，记录在四个数组的第0行。
            for (int i = 0; i <= a[0]; i++)
            {
                timeA[0, i] = i;
                if (i < a[0])
                {
                    timeB[0, i] = b[0];
                    who[0, i] = 'b';
                }
                else
                {
                    timeB[0, i] = 0;
                    who[0, i] = 'a';
                }
                timeMax[0, i] = Math.Max(timeA[0, i], timeB[0, i]);
            }

            //尽管像下面一样，直接比较即可得出完成第1项任务的最优时间，但由于使用动态规划，计算上述值是必需的。
            if (a[0] <= b[0])
            {
                least[0] = a[0];
                tempRlt[0] = 'a';
            }
            else
            {
                least[0] = b[0];
                tempRlt[0] = 'b';
            }
            result[0] = new String(tempRlt);         

            //计算第2个至第n个任务，分别记录在四个数组相应行。
            for (int k = 1; k < n; k++)
            {

                //tempSum记录完成前k项任务机器A最多需要的时间，即全部由A完成需要的时间，亦即机器A所有可能的取值范围。
                int tempSum = 0;
                for (int temp = 0; temp <= k; temp++)
                {
                    tempSum += a[temp];
                }
                //计算出所有可能的点对(timeA,timeB)，并取值timeMax。
                for (int i = 0; i <= tempSum; i++)
                {
                    //机器A在完成前k项任务时所花费的时间为i。
                    timeA[k, i] = i;

                    //i即timeA[k, i]，若机器A完成前k项任务的时间 小于 它完成第k项的时间，可能吗？不可能，所以第k项任务肯定由机器B做。
                    if (i < a[k])
                    {
                        timeB[k, i] = timeB[k - 1, i] + b[k];
                        who[k, i] = 'b';
                    }
                    //按照前述动态规划方式的思想，确定机器A在花费i时间时，机器B花费的最优时间。
                    else
                    {
                        if ((timeB[k - 1, i] + b[k]) <= timeB[k - 1, i - a[k]])
                        {
                            timeB[k, i] = timeB[k - 1, i] + b[k];
                            who[k, i] = 'b';
                        }
                        else
                        {
                            timeB[k, i] = timeB[k - 1, i - a[k]];
                            who[k, i] = 'a';
                        }
                    }
                    //两台机器花费时间较大的那个为总花费时间。
                    timeMax[k, i] = Math.Max(timeA[k, i], timeB[k, i]);
                }

                //处理数组tempSum后面的值。机器A时间全部设为最大，此时机器B则无需花费时间。
                for (int i = tempSum + 1; i < aSum; i++)
                {
                    timeA[k, i] = tempSum;
                    timeB[k, i] = 0;
                }

                //完成第k项任务后，在timeMax所有可能值中，选取最小值即最优值。
                int flag = 0;//记录最优值所在的位置i值，同时也是机器A所花费的时间。
                for (int i = 0; i <= tempSum; i++)
                {
                    if (timeMax[k, i] > 0 && timeMax[k, i] < least[k])
                    {
                        least[k] = timeMax[k, i];
                        flag = i;
                    }
                }

                //用来回溯所用机器的顺序，需要注意的是机器A所花费的时间和数组的下标一样，因此可用做标记。
                //最后一项任务的回溯路径已在示意图中标出，便于理解。
                tempRlt[k] = who[k, flag];
                for (int i = k; i > 0 && flag > 0; i--)
                {
                    //如果是机器A完成第i项任务，则机器A花费的时间减去a[i]就是完成前i-1项任务的时间。
                    //同时在who中可以确定前一项任务的机器，因为机器A花费的时间可用做位置标记。
                    if (tempRlt[i] == 'a')
                    {
                        flag -= a[i];
                        tempRlt[i - 1] = who[i - 1, flag];

                    }
                    if (tempRlt[i] == 'b')
                    {
                        tempRlt[i - 1] = who[i - 1, flag];
                    }
                }

                result[k] = new String(tempRlt);
            }    
        }

        static void Main(string[] args)
        {
            const int N = 6;
            int[] a = new int[N] { 2, 5, 7, 10, 5, 2 };
            int[] b = new int[N] { 3, 8, 4, 11, 3, 4 };
            int[] least = new int[N];   //记录完成任务的最优时间
            string[] result = new string[N];    //记录完成任务机器的顺序

            DlrwZydd(a, b, N, least, result);
            Console.WriteLine();
            for (int i = 0; i < N; i++)
            {
                Console.WriteLine(" 按要求完成前{0}项任务的机器顺序为：" + result[i] + " 时间为：{1}" ,i+1,least[i]);
            }
        }
    }
}
