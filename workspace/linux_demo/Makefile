CC=gcc
CFLAGS = -Wall -Iinclude -lpthread
SRC_DIR = src
BIN_DIR = bin

# 获取所有的 .c 文件，并定义输出文件名
SRCS = $(wildcard $(SRC_DIR)/*.c)
BINS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%, $(SRCS))

all: $(BIN_DIR) $(BINS)

# 创建bin 目录
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# 编译规则
$(BIN_DIR)/%: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(BIN_DIR) *.txt

.PHONY: all clean
