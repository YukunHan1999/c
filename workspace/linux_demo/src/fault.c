#include<stdio.h>

int main() {
    printf("程序开始运行，准备访问非法内存...\n");

    // 尝试向null指针写入数据
    int *ptr = NULL;
    *ptr = 1024;

    printf("这段文字永远不会被打印\n");
    return 0;
}
