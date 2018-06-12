#include <stdio.h>  
#include <pthread.h>  
#include <unistd.h>  
  
pthread_mutex_t counter_lock;   //互斥锁  
pthread_cond_t counter_nonzero; //条件变量  
int counter = 0;  
int estatus = -1;  
  
void *decrement_counter(void *argv);  
void *increment_counter(void *argv);  
  
//******* 主函数 *******//  
int main(int argc, char **argv)  
{  
    printf("counter: %d/n", counter);  
    pthread_t thd1, thd2;  
    int ret;  
  
    //初始化  
    pthread_mutex_init(&counter_lock, NULL);  
    pthread_cond_init(&counter_nonzero, NULL);  
      
    ret = pthread_create(&thd1, NULL, decrement_counter, NULL); //创建线程1  
    if(ret){  
        perror("del:/n");  
        return 1;  
    }  
  
    ret = pthread_create(&thd2, NULL, increment_counter, NULL); //创建线程2  
    if(ret){  
        perror("inc: /n");  
        return 1;  
    }  
  
    int counter = 0;  
    while(counter != 10){  
        printf("counter(main): %d/n", counter); //主线程  
        sleep(1);  
        counter++;  
    }  
  
    pthread_exit(0);  
      
    return 0;  
}  
  
void *decrement_counter(void *argv)  
{  
    printf("counter(decrement): %d/n", counter);  
    pthread_mutex_lock(&counter_lock);  
    while(counter == 0)  
        pthread_cond_wait(&counter_nonzero, &counter_lock); //进入阻塞(wait)，等待激活(signal)  
      
    printf("counter--(before): %d/n", counter);      
    counter--; //等待signal激活后再执行  
    printf("counter--(after): %d/n", counter);      
    pthread_mutex_unlock(&counter_lock);   
  
    return &estatus;  
}  
  
void *increment_counter(void *argv)  
{  
    printf("counter(increment): %d/n", counter);  
    pthread_mutex_lock(&counter_lock);  
    if(counter == 0)  
        pthread_cond_signal(&counter_nonzero); //激活(signal)阻塞(wait)的线程(先执行完signal线程，然后再执行wait线程)  
  
    printf("counter++(before): %d/n", counter);      
    counter++;   
    printf("counter++(after): %d/n", counter);      
    pthread_mutex_unlock(&counter_lock);  
  
    return &estatus;  
}  