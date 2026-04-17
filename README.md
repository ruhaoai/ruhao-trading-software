# 如昊AI交易软件 - Tauri构建指南

## 方案C：Tauri构建（专业级，小体积）

Tauri是一个Rust编写的框架，可以将Web应用打包成超小体积的桌面EXE（通常<5MB）。

---

## 快速开始（Windows电脑）

### 步骤1：安装依赖（一次性）

1. **安装Rust**（https://rustup.rs/）
   - 下载 `rustup-init.exe`
   - 运行并选择默认安装
   - 重启CMD

2. **安装Node.js**（https://nodejs.org）
   - 下载 LTS版本
   - 一路下一步安装

3. **安装Tauri CLI**
   ```cmd
   cargo install tauri-cli
   ```

### 步骤2：获取源代码

1. 下载构建包：
   ```
   cos://xiaohei-memory-1410269208/如昊AI交易软件/交易软件v1.0-Tauri构建包/trading-app-tauri-v1.0.zip
   ```

2. 解压到任意目录，例如：
   ```
   C:\ruhao-trading-app\
   ```

### 步骤3：构建EXE（一条命令）

```cmd
cd C:\ruhao-trading-app
# 开发模式预览
cargo tauri dev

# 构建发布版EXE
cargo tauri build
```

构建完成后，在 `src-tauri/target/release/` 目录找到：
- `如昊AI交易软件.exe` - 主程序（约3-5MB）
- `如昊AI交易软件.msi` - 安装包（可选）

---

## 目录结构

```
trading-app-tauri/
├── src/                    # 前端源代码
│   ├── index.html         # 主界面
│   ├── main.js            # 前端逻辑
│   └── styles.css         # 样式文件
├── src-tauri/             # Tauri配置
│   ├── Cargo.toml         # Rust配置
│   ├── tauri.conf.json    # Tauri配置
│   ├── src/main.rs        # Rust入口
│   └── icons/             # 应用图标
├── package.json           # Node配置
└── README.md              # 本文件
```

---

## Tauri优势

| 特性 | Tauri | Electron |
|------|-------|----------|
| **体积** | 3-5MB | 100MB+ |
| **内存占用** | 低 | 高 |
| **启动速度** | 快 | 慢 |
| **安全性** | 高 | 中 |
| **原生API** | 完整 | 有限 |

---

## 配置说明

### tauri.conf.json 关键配置

```json
{
  "build": {
    "beforeBuildCommand": "",
    "beforeDevCommand": "",
    "devPath": "../src",
    "distDir": "../src"
  },
  "tauri": {
    "allowlist": {
      "all": false,
      "window": {
        "all": true
      }
    },
    "windows": [
      {
        "title": "如昊AI交易软件",
        "width": 1280,
        "height": 800,
        "minWidth": 1024,
        "minHeight": 600,
        "resizable": true,
        "fullscreen": false
      }
    ]
  }
}
```

---

## 自定义选项

### 修改窗口标题
编辑 `src-tauri/tauri.conf.json`：
```json
"windows": [{
  "title": "您想要的标题",
  ...
}]
```

### 修改应用图标
替换 `src-tauri/icons/` 目录下的图标文件：
- `icon.ico` - Windows图标
- `icon.png` - 512x512 PNG图标

### 添加原生功能
在 `src-tauri/src/main.rs` 中添加Rust代码实现原生功能。

---

## 常见问题

### Q1: 构建失败，提示缺少工具链
A: 安装Visual Studio Build Tools：
```cmd
rustup default stable-msvc
```

### Q2: 图标不显示
A: 确保图标格式正确：
- .ico文件用于Windows
- .png文件（512x512）用于其他平台

### Q3: 如何更新应用
A: Tauri支持自动更新，配置 `updater` 字段即可。

---

## 发布流程

1. **本地测试**
   ```cmd
   cargo tauri dev
   ```

2. **构建发布版**
   ```cmd
   cargo tauri build
   ```

3. **获取安装包**
   - 在 `src-tauri/target/release/bundle/` 目录
   - 包含 `.exe` 和 `.msi` 文件

4. **分发应用**
   - 直接分享 `.exe` 文件
   - 或使用 `.msi` 安装程序

---

## 技术支持

- Tauri官网: https://tauri.app
- 中文文档: https://tauri.app/zh-cn/
- GitHub: https://github.com/tauri-apps/tauri

---

**版本**: v1.0.0  
**构建日期**: 2026-04-17  
**框架**: Tauri v1.5+
