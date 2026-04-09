# 1. 重建历史

```bash
# 1. 创建一个孤立的临时分支（该分支没有任何历史记录）
git checkout --orphan temp_branch
# 2. 将当前所有文件加入暂存区
git add -A
# 3. 提交这些文件作为新的起点
git commit -m "feat: initial reboot"
# 4. 强制覆盖本地的 main 分支并删除临时分支
git branch -D main
git branch -m main
# 5. 强制推送到远程仓库
git push -f origin main
```
