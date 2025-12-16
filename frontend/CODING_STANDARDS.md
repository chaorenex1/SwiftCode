# 代码格式化与质量检查

本项目使用 ESLint、Prettier 和 Stylelint 来确保代码质量和一致性。

## 可用脚本

在 `package.json` 中定义了以下脚本：

### 代码检查

- `npm run lint` - 检查 JavaScript/TypeScript/Vue 文件
- `npm run lint:fix` - 自动修复 JavaScript/TypeScript/Vue 文件问题
- `npm run stylelint` - 检查 CSS/SCSS/Vue 样式
- `npm run stylelint:fix` - 自动修复 CSS/SCSS/Vue 样式问题
- `npm run format:check` - 检查代码格式
- `npm run format` - 自动格式化代码

### 组合命令

- `npm run lint:all` - 运行所有检查
- `npm run lint:fix:all` - 自动修复所有问题

## 配置说明

### ESLint 配置 (`.eslintrc.js`)

- 使用 Vue 3 推荐规则
- 使用 TypeScript 推荐规则
- 集成 Prettier 避免冲突
- 自定义规则针对项目需求

### Prettier 配置 (`.prettierrc.js`)

- 100 字符行宽限制
- 2 空格缩进
- 使用单引号
- 行尾分号
- ES5 末尾逗号

### Stylelint 配置 (`.stylelintrc.js`)

- 支持 Tailwind CSS
- 属性按字母顺序排序
- 集成 Prettier 避免冲突

### EditorConfig (`.editorconfig`)

- 统一跨编辑器设置
- UTF-8 编码
- LF 行尾
- 2 空格缩进

## 开发环境设置

### VSCode 推荐扩展

已创建 `.vscode/extensions.json` 文件，包含推荐扩展：

- Vue Volar (Vue 3 支持)
- ESLint
- Stylelint
- Prettier
- Tailwind CSS IntelliSense

### VSCode 自动格式化

已配置 `.vscode/settings.json`：

- 保存时自动格式化
- 保存时自动修复 ESLint 和 Stylelint 问题
- 设置默认格式化工具为 Prettier

## Git 提交前检查

使用 `lint-staged` 在提交前自动格式化暂存文件：

- JavaScript/TypeScript 文件：ESLint + Prettier
- Vue 文件：ESLint + Prettier + Stylelint
- CSS/SCSS 文件：Stylelint + Prettier
- JSON/Markdown 文件：Prettier

## 常见问题

### 1. 如何忽略某些文件？

- ESLint: 使用 `.eslintignore`
- Prettier: 使用 `.prettierignore`
- Stylelint: 在配置中设置 `ignoreFiles`

### 2. 如何自定义规则？

- 修改 `.eslintrc.js` 中的 `rules` 部分
- 修改 `.prettierrc.js` 中的配置
- 修改 `.stylelintrc.js` 中的 `rules` 部分

### 3. 如何禁用某些文件的检查？

在文件顶部添加注释：

```javascript
/* eslint-disable */
// 或针对特定规则
/* eslint-disable no-console */
```

### 4. 如何添加新的文件类型？

更新相应的配置文件：

- ESLint: 修改 `extends` 和 `plugins`
- Prettier: 修改文件关联
- Stylelint: 修改 `extends` 和 `plugins`

## 最佳实践

1. **提交前运行检查**

   ```bash
   npm run lint:all
   ```

2. **使用 VSCode 自动格式化**
   确保安装了推荐扩展并启用保存时格式化

3. **定期更新依赖**

   ```bash
   pnpm update
   ```

4. **保持配置一致**
   团队所有成员使用相同的编辑器和扩展配置
