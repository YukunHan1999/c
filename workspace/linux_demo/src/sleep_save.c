#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int main() {
    const char *msg = "Hello, Linux System Programming!\n";
    const char *filename = "output.txt";

    printf("进程准备进入休眠状态(5秒)...\n");
    sleep(5); // 进程从运行态进入阻塞态
    printf("%s",msg);


    // 打开文件：只写模式 | 若不存在则创建 | 若存在则清空
    int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        perror("打开文件失败");
        return 1;
    }

    write(fd, msg, strlen(msg));
    close(fd);

    printf("内容已成功写入%s\n", filename);
    return 0;
}

