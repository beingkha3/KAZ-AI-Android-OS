# KAZ-AI-Android-OS

Transform your Android device into an AI-first Linux environment using Termux. Choose your setup:

- **Option 1**: Full Linux + OpenCode via Proot-Distro
- **Option 2**: Ollama AI models in Termux (no full Linux setup)
- **Option 3**: Lightweight UI via orailnoor modules

---

## Option 1: Full Linux + AI (Proot + OpenCode)

This gives you full Ubuntu environment with OpenCode as your AI assistant.

### 1. Install APKs

Install these from this repository:
- `Termux.apk` - Base terminal
- `Termux-X11.apk` - Display server for GUI apps

### 2. Setup Proot-Distro & Ubuntu

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
# Inside Ubuntu

# Install dependencies
apt update && apt install -y curl git

# Install OpenCode
curl -sSL https://opencode.ai/install.sh | bash

# Load shell configuration
source ~/.bashrc

# Start OpenCode
opencode
```

Now control your phone with natural language commands!

---

## Option 2: Ollama in Termux

Run AI language models directly in Termux without full Linux setup.

### 1. Install Termux

Install `Termux.apk` from this repository or [F-Droid](https://f-droid.org).

### 2. Install Proot-Distro

```bash
pkg update && pkg install proot-distro
```

### 3. Create Ubuntu Environment

```bash
proot-distro install ubuntu
proot-distro login ubuntu
```

### 4. Install Ollama

```bash
# Inside Ubuntu

# Update and install dependencies
apt update && apt install -y wget curl unzip

# Download Ollama for ARM64
wget https://ollama.com/download/ollama-linux-arm64

# Install Ollama
mv ollama-linux-arm64 /usr/local/bin/ollama
chmod +x /usr/local/bin/ollama

# Start Ollama server
ollama serve &

# Pull a model (e.g., llama2)
ollama pull llama2
```

### 5. Run Ollama

```bash
ollama run llama2
```

---

## Option 3: Lightweight UI (orailnoor Modules)

For a simple graphical interface, use the orailnoor modules included as submodules.

See `orailnoor-CloudBot-Termux/` directory for usage instructions.

---

## Requirements

- Android 7.0+
- Termux (from F-Droid, not Google Play Store)
- Termux-X11 (for GUI support)
- Internet connection for package downloads

---

## Project Structure

```
KAZ-AI-Android-OS/
├── .bashrc                    # Shell configuration
├── .termux/                   # Termux settings (colors, fonts, properties)
├── fonts/                     # Custom fonts (OpenDyslexic, Terminus, etc.)
├── termux-linux-setup/        # Linux environment setup (submodule)
├── termux-llm/                # LLM integration tools (submodule)
├── orailnoor-CloudBot-Termux/ # Cloud bot module (submodule)
└── README.md
```

---

## License

MIT License - See individual components for their respective licenses.