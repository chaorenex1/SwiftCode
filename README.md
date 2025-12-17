# Code AI Assistant - Tauri Desktop Application

A complete desktop application with integrated code editor, AI chat assistant, CLI output, and terminal functionality based on the specifications in `tauri-ai-app.md`.

## Complete Feature Implementation

### ✅ Editor Main Interface
```
┌─────────────────────────────────────────────────────────────┐
│ 菜单栏 (File Edit View Tools Help)                          │
├──────────────┬──────────────────────────────────────────────┤
│              │                                              │
│              │              编辑器区域                      │
│              │              (可编辑文件内容)                │
│  目录导航    │                                              │
│  (左侧)      │                                              │
│              ├──────────────────────────────────────────────┤
│              │              底部 Tab 区域                   │
│              │   ┌──────┬──────┬──────┬──────┐             │
│              │   │聊天  │输出  │终端  │...   │             │
│              │   └──────┴──────┴──────┴──────┘             │
│              │                                              │
└──────────────┴──────────────────────────────────────────────┘
```

### ✅ Directory Navigation (Left Sidebar)
- Tree structure file system display
- Right-click menu: New file/folder, Rename, Delete, Copy path, Open in terminal, Refresh
- Drag-drop file/folder support
- File search filtering

### ✅ Editor Area (Right Side)
- Monaco Editor with syntax highlighting (multiple languages)
- Code folding support
- Find/replace functionality
- Multi-cursor editing
- Keyboard shortcuts: Ctrl+S (save current), Ctrl+Shift+S (save all)
- Bottom-right action buttons: 💾 Save current, 💾💾 Save all

### ✅ Bottom Tab Area

#### Tab 1: Chat Interface
- **Association button**: Link files from directory navigation
- **Multi-line text input**: Markdown preview support
- **Action buttons**: Clear, Send
- **Bottom toolbar**: Model selection dropdown, Code CLI selection dropdown

#### Tab 2: Output Interface
- Real-time CLI log display with timestamp
- Search box with filter functionality
- Control buttons: Clear, Pause/Resume
- Scrollable log history

#### Tab 3: Terminal Interface
- Embedded xterm.js system terminal
- Multiple tab terminal support
- Standard terminal operations
- Copy/paste support
- Font size adjustment

### ✅ Settings Interface
- **Workspace switching**: Dropdown select, Switch, New, Delete
- **Application data directory**: Current path display, Browse, Reset to default
- **CLI tool paths**: Node.js, Python, Git paths with browse/validate
- **Environment variables table**: Add/edit/delete, mask secrets
- **Model management table**: Name/endpoint/key add/edit/delete, encrypt keys
- **Code CLI management table**: Name/path/params add/edit/delete/validate
- **Action buttons**: Save, Cancel, Reset to defaults

## Tech Stack

### Frontend
- Vue 3 + TypeScript + Vite
- Tailwind CSS for styling
- Monaco Editor for code editing
- xterm.js for terminal
- Element Plus UI components
- Pinia for state management

### Backend
- Tauri v2
- Rust with Tokio async runtime
- SQLite database with SeaORM
- Tracing for structured logging

## Project Structure

```
code-ai-assistant/
├── frontend/                    # Vue 3 + TypeScript frontend
│   ├── src/
│   │   ├── components/         # Vue components
│   │   ├── pages/             # Page components
│   │   ├── stores/            # Pinia stores
│   │   ├── services/          # API and Tauri services
│   │   ├── utils/             # Utility functions
│   │   └── styles/            # CSS styles
│   └── package.json
├── src-tauri/                  # Rust backend
│   ├── src/
│   │   ├── core/              # Core application logic
│   │   ├── database/          # Database models and repositories
│   │   ├── services/          # Business logic services
│   │   ├── tauri/             # Tauri IPC commands and events
│   │   └── utils/             # Utility functions
│   └── Cargo.toml
└── package.json               # Root package.json
```

## Getting Started

### Prerequisites

- Node.js 18+ and pnpm
- Rust and Cargo (install from https://rustup.rs/)
- Tauri CLI: `pnpm add -D @tauri-apps/cli`

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd code-ai-assistant
   ```

2. Install dependencies:
   ```bash
   pnpm install
   ```

3. Install Rust dependencies:
   ```bash
   cd src-tauri
   cargo fetch
   cd ..
   ```

### Development

Run the application in development mode:
```bash
pnpm tauri:dev
```

### Building

Build the application for production:
```bash
pnpm tauri:build
```

## Configuration

### Environment Variables

Create a `.env` file in the root directory:
```env
# AI API Keys (optional)
OPENAI_API_KEY=your_openai_api_key
ANTHROPIC_API_KEY=your_anthropic_api_key
```

### Application Settings

The application settings can be configured through the Settings UI:
- Workspace management
- CLI tool paths
- Environment variables
- AI model configurations
- Code CLI configurations

## Features in Detail

### Code Editor
- Monaco Editor integration
- Syntax highlighting for multiple languages
- Code folding and multi-cursor editing
- Find/replace functionality
- File association and management

### AI Chat Assistant
- Multiple AI model support (Claude, GPT, Gemini)
- File context association
- Markdown preview in chat
- Conversation history
- Model switching

### CLI Output
- Real-time log streaming
- Search and filter capabilities
- Log level filtering (INFO, DEBUG, ERROR)
- Pause/resume functionality
- Clear logs option

### Terminal
- Multiple terminal tabs
- xterm.js integration
- Copy/paste support
- Font size adjustment
- Command history

### File Explorer
- Tree view navigation
- File/folder operations (create, rename, delete)
- Drag and drop support
- Search functionality
- Context menu actions

## Development Guidelines

### Frontend
- Use TypeScript for type safety
- Follow Vue 3 Composition API patterns
- Use Pinia for state management
- Implement responsive design with Tailwind CSS
- Write unit tests for components and services

### Backend
- Follow Rust best practices
- Use async/await with Tokio runtime
- Implement proper error handling with anyhow/thiserror
- Use structured logging with tracing
- Write unit and integration tests

## Automated Release Builds with GitHub Actions

This project includes a GitHub Actions workflow for automated multi-platform builds and releases. The workflow is triggered when a version tag is pushed (e.g., `v1.0.0`).

### Workflow Features

1. **Multi-Platform Builds**: Builds for Windows, macOS, and Linux simultaneously
2. **Automatic Release Creation**: Creates a GitHub release with the tag
3. **Changelog Generation**: Automatically generates changelog from git commits
4. **Artifact Upload**: Uploads built binaries to the GitHub release
5. **Parallel Building**: Uses GitHub Actions matrix strategy for efficient builds

### Supported Platforms

- **Windows**: x86_64-pc-windows-msvc (.exe, .msi)
- **macOS**: x86_64-apple-darwin and aarch64-apple-darwin (.dmg, .app)
- **Linux**: x86_64-unknown-linux-gnu (.deb, .AppImage, .tar.gz)

### How to Use

1. **Tag a Release**:
   ```bash
   # Create and push a version tag
   git tag -a v1.0.0 -m "Release v1.0.0"
   git push origin v1.0.0
   ```

2. **Workflow Triggers**: The workflow automatically runs on tag push

3. **Check Results**: Go to the GitHub repository's Actions tab to monitor the build

4. **Download Releases**: Find built binaries in the GitHub Releases section

### Required GitHub Secrets

For code signing, configure these secrets in your GitHub repository settings:

| Secret Name | Description |
|-------------|-------------|
| `TAURI_PRIVATE_KEY` | Tauri private key for code signing |
| `TAURI_KEY_PASSWORD` | Password for the private key |

To generate a Tauri private key:
```bash
pnpm tauri signer generate --ci
```

### Workflow Configuration

The workflow file is located at `.github/workflows/release.yml` and includes:

- **Version Extraction**: Automatically extracts version from git tag
- **Dependency Caching**: Caches pnpm and Rust dependencies for faster builds
- **Cross-Platform Setup**: Installs platform-specific build dependencies
- **Release Management**: Creates and updates GitHub releases
- **Changelog Generation**: Generates changelog between tags

### Manual Testing

To test the workflow locally before pushing tags, you can use the GitHub CLI:

```bash
# Dry run of the build process
pnpm tauri build
```

### Troubleshooting

1. **Build Failures on Linux**: Ensure all system dependencies are installed (see workflow file)
2. **Code Signing Errors**: Verify `TAURI_PRIVATE_KEY` and `TAURI_KEY_PASSWORD` secrets are correctly set
3. **Missing Artifacts**: Check the build logs for compilation errors
