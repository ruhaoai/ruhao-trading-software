#!/bin/bash
# 如昊交易软件 - 按需构建脚本
# 用法: ./build-on-demand.sh <github_token>

TOKEN=$1
REPO="ruhaoai/ruhao-trading-software"
LOCAL_PATH="/root/.openclaw/workspace/trading-app-tauri"

echo "🚀 开始按需构建流程..."

# 1. 检查本地代码
cd $LOCAL_PATH
if [ ! -f "src/index.html" ]; then
    echo "❌ 本地代码不存在"
    exit 1
fi

# 2. 推送到GitHub
echo "📤 推送代码到GitHub..."
git remote remove origin 2>/dev/null
git remote add origin https://${TOKEN}@github.com/${REPO}.git
git push -u origin master:main --force

if [ $? -ne 0 ]; then
    echo "❌ 推送失败"
    exit 1
fi

echo "✅ 代码已推送，GitHub Actions自动构建中..."
echo "⏳ 预计5-10分钟完成"
echo ""
echo "📋 构建进度查看: https://github.com/${REPO}/actions"
echo ""
echo "⚠️  构建完成后，请运行: ./cleanup-after-build.sh ${TOKEN}"
