# 技术栈清单

## 概述
本文档详细记录Code AI Assistant项目使用的所有技术、工具和依赖项，包括版本信息和用途说明。

## 编程语言

### 主要语言
| 语言 | 版本 | 使用场景 | 说明 |
|------|------|----------|------|
| TypeScript | ~5.9.3 | 前端开发 | 提供类型安全，使用Vue 3 Composition API |
| Rust | 最新稳定版 | 后端开发 | Tauri框架要求，提供高性能系统级操作 |
| JavaScript (ES2020+) | 运行时 | 前端运行时 | Vue 3和现代浏览器支持 |

### 配置文件语言
| 语言 | 使用场景 | 配置文件示例 |
|------|----------|--------------|
| JSON | 配置和数据交换 | `package.json`, `tauri.conf.json` |
| TOML | Rust配置 | `Cargo.toml` |
| YAML | 锁定文件 | `pnpm-lock.yaml` |
| Markdown | 文档 | `README.md`, 本文档 |
| CSS/SCSS | 样式 | Tailwind CSS配置 |

## 核心框架与库

### 前端框架与库

#### UI框架
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| Vue 3 | ^3.5.24 | 前端框架 | 现代响应式框架，Composition API |
| Element Plus | ^2.8.0 | UI组件库 | 丰富的组件，良好的Vue 3集成 |
| Tailwind CSS | ^4.1.18 | CSS框架 | 实用优先，快速样式开发 |

#### 编辑器与终端
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| Monaco Editor | ^0.50.0 | 代码编辑器 | VS Code编辑器核心，功能强大 |
| @xterm/xterm | ^5.5.0 | 终端模拟器 | 标准终端实现，功能完整 |
| @xterm/addon-fit | ^0.10.0 | 终端适配插件 | 自动调整终端大小 |
| @xterm/addon-web-links | ^0.10.0 | 终端链接插件 | 支持终端中的可点击链接 |

#### 状态管理与路由
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| Pinia | ^3.0.0 | 状态管理 | Vue官方推荐，轻量易用 |
| Vue Router | ^4.0.0 | 路由管理 | Vue官方路由解决方案 |

#### 工具库
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| lodash-es | ^4.17.0 | 实用函数库 | 提供常用工具函数 |
| dayjs | ^1.11.0 | 日期处理 | 轻量级替代moment.js |
| marked | ^14.0.0 | Markdown解析 | 聊天消息Markdown渲染 |

### 后端框架与库

#### Tauri核心
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| tauri | ^2.0.0 | 桌面应用框架 | 跨平台，安全，性能好 |
| tauri-build | ^2.0.0 | 构建工具 | Tauri应用构建支持 |

#### 异步与网络
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| tokio | ^1.0 | 异步运行时 | Rust异步标准，性能优异 |
| reqwest | ^0.12 | HTTP客户端 | 简单易用的HTTP客户端 |
| hyper | ^1.0 | HTTP实现 | reqwest依赖，高性能HTTP |

#### 数据库与ORM
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| sea-orm | ^0.12 | ORM框架 | 异步ORM，支持SQLite |
| sqlx | ^0.7 | SQL工具包 | 类型安全SQL查询 |
| sqlite | 系统级 | 数据库 | 嵌入式，零配置 |

#### 序列化与配置
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| serde | ^1.0 | 序列化框架 | Rust序列化标准 |
| serde_json | ^1.0 | JSON序列化 | JSON格式支持 |
| config | ^0.13 | 配置管理 | 多格式配置支持 |
| toml | ^0.8 | TOML解析 | 配置文件解析 |

#### 错误处理
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| anyhow | ^1.0 | 错误处理 | 简单错误处理 |
| thiserror | ^1.0 | 错误定义 | 自定义错误类型 |

#### 日志与监控
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| tracing | ^0.1 | 结构化日志 | 现代化日志框架 |
| tracing-subscriber | ^0.3 | 日志订阅 | tracing日志输出 |

### Tauri插件
| 名称 | 版本 | 用途 | 引入原因 |
|------|------|------|----------|
| tauri-plugin-log | ^2.0.0 | 日志插件 | 前端日志收集 |
| tauri-plugin-store | ^2.0.0 | 本地存储 | 键值存储 |
| tauri-plugin-updater | ^2.0.0 | 应用更新 | 自动更新支持 |
| tauri-plugin-single-instance | ^2.0.0 | 单实例 | 防止多开 |
| tauri-plugin-deep-link | ^2.0.0 | 深度链接 | 协议链接支持 |
| tauri-plugin-shell | ^2.0.0 | Shell命令 | 执行系统命令 |
| tauri-plugin-fs | ^2.0.0 | 文件系统 | 文件操作 |
| tauri-plugin-process | ^2.0.0 | 进程管理 | 进程控制 |
| tauri-plugin-dialog | ^2.0.0 | 对话框 | 系统对话框 |
| tauri-plugin-global-shortcut | ^2.0.0 | 全局快捷键 | 快捷键支持 |
| tauri-plugin-notification | ^2.0.0 | 通知 | 系统通知 |

## 开发工具

### 构建工具
| 工具 | 版本 | 用途 | 说明 |
|------|------|------|------|
| Vite | ^7.3.0 | 前端构建工具 | 快速开发，ES模块 |
| vue-tsc | ^3.1.4 | TypeScript编译 | Vue TypeScript支持 |
| Cargo | 最新 | Rust构建工具 | Rust包管理和构建 |
| @tauri-apps/cli | ^2.0.0 | Tauri CLI | Tauri应用开发工具 |

### 包管理器
| 工具 | 版本 | 用途 | 说明 |
|------|------|------|------|
| pnpm | 最新 | Node.js包管理器 | 快速，磁盘空间高效 |
| Cargo | 最新 | Rust包管理器 | Rust生态标准 |

### 代码质量工具

#### 代码检查
| 工具 | 版本 | 用途 | 配置 |
|------|------|------|------|
| ESLint | ^8.57.0 | JavaScript/TS检查 | `.eslintrc.cjs` |
| @typescript-eslint/eslint-plugin | ^8.50.0 | TypeScript规则 | TypeScript专用规则 |
| @typescript-eslint/parser | ^8.50.0 | TypeScript解析 | 解析TypeScript代码 |
| eslint-plugin-vue | ^10.6.2 | Vue.js规则 | Vue 3专用规则 |
| eslint-plugin-prettier | ^5.5.4 | Prettier集成 | ESLint集成Prettier |
| eslint-config-prettier | ^10.1.8 | 禁用冲突规则 | 防止规则冲突 |

#### 代码格式化
| 工具 | 版本 | 用途 | 配置 |
|------|------|------|------|
| Prettier | ^3.7.4 | 代码格式化 | `.prettierrc.cjs` |
| 规则配置 | - | 格式化规则 | 100字符行宽，2空格缩进，单引号 |

#### CSS代码检查
| 工具 | 版本 | 用途 | 配置 |
|------|------|------|------|
| Stylelint | ^16.26.1 | CSS代码检查 | `.stylelintrc.cjs` |
| stylelint-config-standard | ^39.0.1 | 标准规则 | 基础CSS规则 |
| stylelint-config-tailwindcss | ^1.0.0 | Tailwind规则 | Tailwind CSS支持 |
| stylelint-config-prettier | ^9.0.5 | Prettier集成 | 防止规则冲突 |
| stylelint-order | ^7.0.0 | 属性排序 | CSS属性顺序检查 |

#### Git钩子
| 工具 | 版本 | 用途 | 配置 |
|------|------|------|------|
| lint-staged | ^16.2.7 | Git提交检查 | `.lintstagedrc.js` |
| 配置规则 | - | 提交前检查 | 运行ESLint, Prettier, Stylelint |

### 测试工具
| 工具 | 状态 | 用途 | 说明 |
|------|------|------|------|
| Vitest | 计划中 | 单元测试 | Vite生态测试框架 |
| Testing Library | 计划中 | 组件测试 | Vue组件测试 |
| Rust测试框架 | 内置 | Rust单元测试 | Cargo内置测试支持 |

## 基础设施

### 版本控制
| 工具 | 用途 | 工作流 |
|------|------|--------|
| Git | 版本控制 | 基于GitFlow简化版 |
| GitHub/GitLab | 代码托管 | 远程仓库托管 |
| 分支策略 | 开发流程 | main分支 + 功能分支 |

### 持续集成/持续部署 (CI/CD)
| 工具 | 状态 | 用途 | 说明 |
|------|------|------|------|
| GitHub Actions | 计划中 | 自动化构建 | 跨平台构建 |
| Tauri Action | 计划中 | Tauri构建 | 专门Tauri构建 |
| 自动更新 | 已配置 | 应用更新 | 通过Tauri更新器 |

### 容器化
| 工具 | 状态 | 用途 | 说明 |
|------|------|------|------|
| Docker | 计划中 | 开发环境 | 一致性开发环境 |
| 容器镜像 | 计划中 | 构建环境 | 跨平台构建环境 |

### 云服务
| 服务 | 状态 | 用途 | 说明 |
|------|------|------|------|
| 对象存储 | 计划中 | 更新文件托管 | 应用更新文件 |
| CDN | 计划中 | 静态资源 | 加速资源加载 |

## 开发环境配置

### IDE/编辑器配置
| 配置项 | 文件位置 | 内容说明 |
|--------|----------|----------|
| VSCode设置 | `.vscode/settings.json` | 编辑器统一设置 |
| VSCode扩展推荐 | `.vscode/extensions.json` | 推荐扩展列表 |
| 编辑器配置 | `.editorconfig` | 跨编辑器统一格式 |

### 开发脚本
| 脚本命令 | 用途 | 执行内容 |
|----------|------|----------|
| `pnpm dev` | 启动开发服务器 | Vite开发模式 |
| `pnpm build` | 构建前端 | Vite生产构建 |
| `pnpm preview` | 预览构建结果 | 本地预览生产版本 |
| `pnpm tauri:dev` | Tauri开发模式 | 启动Tauri开发 |
| `pnpm tauri:build` | Tauri构建 | 构建桌面应用 |
| `pnpm lint` | 代码检查 | ESLint检查 |
| `pnpm lint:fix` | 自动修复 | ESLint自动修复 |
| `pnpm format` | 代码格式化 | Prettier格式化 |
| `pnpm format:check` | 格式化检查 | 检查格式化问题 |
| `pnpm stylelint` | CSS检查 | Stylelint检查 |
| `pnpm stylelint:fix` | CSS修复 | Stylelint自动修复 |
| `pnpm lint:all` | 全面检查 | 运行所有检查 |
| `pnpm lint:fix:all` | 全面修复 | 运行所有修复 |

## 运行时环境

### 系统要求
| 平台 | 最低要求 | 推荐配置 |
|------|----------|----------|
| Windows | Windows 10+ | Windows 11 |
| macOS | macOS 11+ | macOS 14+ |
| Linux | 主流发行版 | Ubuntu 22.04+ |

### 运行时依赖
| 依赖 | 用途 | 说明 |
|------|------|------|
| WebView2 | Windows渲染 | Windows系统组件 |
| WebKitGTK | Linux渲染 | Linux系统组件 |
| SQLite | 数据库 | 嵌入式数据库 |

## 安全配置

### 应用安全
| 配置项 | 文件位置 | 安全措施 |
|--------|----------|----------|
| CSP策略 | `tauri.conf.json` | 内容安全策略 |
| 权限配置 | `tauri.conf.json` | 最小权限原则 |
| 能力文件 | `capabilities/` | 权限白名单 |

### 代码安全
| 工具 | 用途 | 说明 |
|------|------|------|
| Cargo-audit | Rust依赖审计 | 安全漏洞检查 |
| npm audit | Node.js依赖审计 | 安全漏洞检查 |
| 依赖锁定 | `Cargo.lock`, `pnpm-lock.yaml` | 可重复构建 |

## 技术决策总结

### 技术选型理由
1. **Tauri选择理由**: 相比Electron更轻量，安全性更好，Rust后端性能更高
2. **Vue 3选择理由**: 渐进式框架，Composition API更灵活，生态成熟
3. **TypeScript选择理由**: 类型安全，大型项目维护性更好
4. **Rust选择理由**: 内存安全，高性能，适合系统级编程
5. **SQLite选择理由**: 嵌入式，零配置，适合桌面应用

### 架构优势
1. **前后端分离**: 清晰的责任边界
2. **类型安全**: 前后端统一类型系统
3. **异步架构**: 充分利用多核性能
4. **模块化设计**: 便于维护和扩展

---
*文档生成时间: 2025-12-17*
*基于Code AI Assistant项目技术栈分析*