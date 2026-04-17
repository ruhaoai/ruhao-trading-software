#!/bin/bash
# 构建完成后清理脚本 - 删除GitHub仓库
# 用法: ./cleanup-after-build.sh <github_token>

TOKEN=$1
REPO="ruhaoai/ruhao-trading-software"

echo "🧹 开始清理流程..."

# 1. 下载构建产物（可选）
echo "📥 请先手动下载EXE文件:"
echo "   https://github.com/${REPO}/actions"
echo ""
read -p "确认已下载EXE？(y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "⏸️ 清理中止，请下载后再运行"
    exit 0
fi

# 2. 删除GitHub仓库
echo "🗑️ 删除GitHub仓库..."
curl -X DELETE -H "Authorization: token ${TOKEN}" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/${REPO}

if [ $? -eq 0 ]; then
    echo "✅ 仓库已删除，代码不再公开"
else
    echo "❌ 删除失败，请手动删除: https://github.com/${REPO}/settings"
fi

echo ""
echo "🎉 按需构建流程完成！"
echo "📁 本地代码保留在: /root/.openclaw/workspace/trading-app-tauri/"
