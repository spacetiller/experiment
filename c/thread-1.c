#include<stdio.h>  
#include<pthread.h>  
#include<string.h>  
#include<sys/types.h>  
#include<unistd.h>  
pthread_t main_tid;  
void print_ids(const char *str)  
{  
    pid_t pid;      //进程id  
    pthread_t tid;  //线程id  
    pid = getpid();       //获取当前进程id  
    tid = pthread_self(); //获取当前线程id  
    printf("%s pid: %u tid: %u (0x%x)/n",  
                str,  
                (unsigned int)pid,  
                (unsigned int)tid,  
                (unsigned int)tid);  
}  
void *func(void *arg)  
{  
    print_ids("new  thread:");  
    return ((void *)0);  
}  
int main()  
{  
    int err;  
    err = pthread_create(&main_tid, NULL, func, NULL); //创建线程  
    if(err != 0){  
        printf("create thread error: %s/n",strerror(err));  
        return 1;  
    }  
    printf("main thread: pid: %u tid: %u (0x%x)/n",   
                (unsigned int)getpid(),  
                (unsigned int)pthread_self(),  
                (unsigned int)pthread_self());  
    print_ids("main thread:");  
    sleep(1);  
    return 0;  
}  