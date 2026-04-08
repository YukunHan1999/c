#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <fcntl.h>

int shared_counter = 0; // 共享资源

void* thread_func(void* arg) {
    // 异步性：线程执行的时机由内核调度，不受主线程直接控制
    usleep(100000);
    // 共享性: 多个线程访问同一个全局变量
    shared_counter++;
    printf("线程执行中, Counter = %d\n", shared_counter);
    return NULL;
}

int main() {
    pthread_t t1, t2;

    // 并发性: 通过创建线程，让多个执行流在宏观上同时推进
    pthread_create(&t1, NULL, thread_func, NULL);
    pthread_create(&t2, NULL, thread_func, NULL);
    
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    // 持久性：将内存中的数据写入磁盘，即使程序结束，数据依然存在
    int fd = open("persist.txt", O_WRONLY | O_CREAT | O_APPEND, 644);
    dprintf(fd, "最终计数结果: %d\n", shared_counter);
    close(fd);

    printf("主程序结束，结束已持久化.\n");
    return 0;
}
