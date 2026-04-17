# KAZ-AI-Android-OS

Transform your Android device into an AI-first Linux environment using Termux and OpenCode (or Ollama). Choose your setup:

- **Option 1**: Full Linux + OpenCode via Proot-Distro
- **Option 2**: Ollama AI models in Termux (no Linux setup)
- **Option 3**: Lightweight UI via orailnoor modules

## Features

- [Ubuntu via PRoot](
- [OpenCode Integration](
- [LLM Tools (Ollama/Langchain)](

## How to Get Started

### Option 1: Full Linux + AI (Proot + OpenCode)

1. Install APKs: `Termux.apk`, `Termux-X11.apk`
2. Run:
```bash
pkg install proot-distro && proot-distro install ubuntu
source ~/.bashrc && opencode
```
3. Control your phone with voice commands!

### Option 2: Ollama in Termux (No Linux Setup)

1. Install `Termux.apk`
2. Create Linux environment:
```bash
proot-distro install ubuntu
llama install && ollama serve &
```
3. Run `ollama run llama2` in Termux

### Option 3: Lightweight UI

Install `orailnoor-CloudBot-Termux` APK and use its interface.

## Requirements

- Android 7.0+
- Termux (F-Droid)
- Internet for APK/pkg downloads

## Project Structure

```
KAZ-AI-Android-OS/
├── .bashrc
├── .termux/
├── fonts/
├── termux-xxx/
├── submodules/
└── README.md
```

## License

MIT License

## What is KAZ-AI-Android-OS?

KAZ-AI-Android-OS turns your boring Android phone into a powerful Linux workstation with an AI-driven interface. Built on proot-distro with Ubuntu, it uses **OpenCode** as the main control interface - allowing you to interact with your phone using natural language and AI assistance.

## Features

- **Ubuntu via PRoot** - Full Linux environment on Android (no root required)
- **OpenCode Integration** - AI-powered CLI assistant for natural language phone control
- **Termux-X11** - Desktop-class display with GUI support
- **Custom Fonts** - OpenDyslexic, Terminus, and more for accessibility
- **Pre-configured Shell** - Starship prompt, custom aliases, and optimized .bashrc
- **Modular Design** - Includes CloudBot and LLM tools for扩展功能

## Quick Start

### 1. Install Termux & Dependencies

Install these APKs from this repository:
- `Termux.apk` - Base terminal
- `Termux-X11.apk` - Display server for GUI
- `Termux-API.apk` - Android APIs access
- `Termux-Styling.apk` - Theme support

### 2. Setup PRoot Distro

```bash
# Install proot-distro
pkg install proot-distro

# Install Ubuntu
proot-distro install ubuntu

# Login to Ubuntu
proot-distro login ubuntu
```

### 3. Install OpenCode

```bash
# Inside Ubuntu (proot-distro login ubuntu)

# Install dependencies
apt update && apt install -y curl git

# Install OpenCode
curl -sSL https://opencode.ai/install.sh | bash

# Load shell configuration
source ~/.bashrc

# Start OpenCode
opencode
```

## Usage

Once OpenCode is installed, you can control your phone using natural language:

```
You: Install python and create a hello world script
OpenCode: [executes commands]
```

## Requirements

- Android 7.0+
- Termux (from F-Droid, not Play Store)
- Termux-X11
- Internet connection for package downloads

## Project Structure

```
KAZ-AI-Android-OS/
├── .bashrc              # Shell configuration
├── .termux/             # Termux settings (colors, font, properties)
├── fonts/               # Custom fonts
├── termux-linux-setup/  # Linux environment setup (submodule)
├── termux-llm/          # LLM integration tools (submodule)
└── orailnoor-CloudBot-Termux/  # Cloud bot module (submodule)
```

## License

MIT License - See individual components for their respective licenses.