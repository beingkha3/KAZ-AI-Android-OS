# KAZ-AI-Android-OS

Turn an Android phone into a portable, energy-efficient, AI-first Linux workspace using Termux, Proot-Distro, OpenCode, Ollama, and optional UI/helper modules.

The goal is simple: give an average Android user an agentic layer on their phone without needing a laptop, root access, or expensive hardware.

## What You Can Build With This

Use this repository to choose one or more setup paths:

| Path | Best For | Runs In | Notes |
| --- | --- | --- | --- |
| OpenCode + Ubuntu | AI coding assistant, automation, Linux developer tools | Proot-Distro Ubuntu | Recommended main setup |
| Ollama | Local AI models directly on the phone | Termux | Works best on 64-bit devices with enough RAM |
| orailnoor modules | Termux UI/helpers and extra workflows | Termux | Read each module's own README |
| Termux-X11 | GUI/Linux desktop workflows | Termux + Proot | Optional, only needed for graphical apps |

You can install all paths and use whichever one fits the task.

## Important Notes

- Do not install Termux from the Google Play Store. That version is outdated.
- Use the Termux APK from this repo or install Termux from F-Droid.
- Keep this repository in `/sdcard/termux/KAZ-AI-Android-OS` so it is easy to find from both Android and Termux.
- This repo has two shell configs: `.bashrc` for Termux and `proot/.bashrc` for Ubuntu/Proot.
- OpenCode should be installed inside Proot-Distro Ubuntu for the best Linux compatibility.
- Ollama can run directly in Termux. It does not use an APK.
- Local AI models can use a lot of RAM, storage, and battery. Start with small models.
- No root access is required.

## Step 1: Create Your Phone Workspace

Before doing the Linux setup, create one easy-to-remember folder on your Android storage:

```text
/sdcard/termux
```

You can create it from your Android file manager:

1. Open your phone's file manager.
2. Go to internal storage.
3. Create a folder named `termux`.
4. Download or extract this repository into that folder.

The final folder should look like this:

```text
/sdcard/termux/KAZ-AI-Android-OS
```

This makes the files easy to find later from both Android and Termux.

If you are comfortable using Git, you can skip the manual ZIP download and clone the repo from inside Termux in Step 5. The Git method is best because it also handles submodules and large APK files correctly.

## Step 2: Install Android Apps

Install these APKs from this repository:

| APK | Required? | Purpose |
| --- | --- | --- |
| `Termux.apk` | Yes | Main terminal app |
| `Termux-API.apk` | Recommended | Lets Termux access Android features |
| `Termux-X11.apk` | Optional | Needed for graphical Linux apps/desktops |
| `Termux-Styling.apk` | Optional | Extra styling/theme support |

After installing Termux, open it once.

## Step 3: Connect Termux To Phone Storage

Run this first so Termux can access `/sdcard/termux`:

```bash
termux-setup-storage
```

Android will ask for storage permission. Allow it.

Check that the folder is visible from Termux:

```bash
ls /sdcard/termux
```

## Step 4: Prepare Termux

Run these commands in Termux:

```bash
pkg update && pkg upgrade -y
pkg install -y git git-lfs proot-distro eza starship termux-api
```

Check that Termux is working:

```bash
termux-info
```

## Step 5: Download Or Open This Repository

If you already downloaded and extracted the repo manually, go to it:

```bash
cd /sdcard/termux/KAZ-AI-Android-OS
```

If the folder is not there yet, clone it directly into `/sdcard/termux`:

```bash
cd /sdcard/termux
git lfs install
git clone --recurse-submodules https://github.com/beingkha3/KAZ-AI-Android-OS.git
cd KAZ-AI-Android-OS
```

If submodules are missing, run:

```bash
git submodule update --init --recursive
```

## Step 6: Move KAZ Termux Config Into Termux Home

This repo includes a useful Termux `.bashrc`, `.termux` config, and fonts. Copy them into the Termux home area:

```bash
cp .bashrc ~/.bashrc
mkdir -p ~/.termux
cp -r .termux/* ~/.termux/
mkdir -p ~/fonts
cp -r fonts/* ~/fonts/
termux-reload-settings
source ~/.bashrc
```

Your config now lives in Termux home, while the full repo stays easy to access at:

```text
/sdcard/termux/KAZ-AI-Android-OS
```

Available Termux shortcuts:

| Shortcut | What It Does |
| --- | --- |
| `phone` | Go to `/sdcard/` |
| `cls` | Clear the terminal |
| `linux` | Login to Ubuntu with `proot-distro login ubuntu` |
| `ls` | Uses `eza` with icons and colors |
| `ll` | Detailed file list |
| `la` | Show hidden files |

## Path A: Install OpenCode In Ubuntu

Choose this path if you want the main KAZ experience: an AI assistant that can help you code, configure tools, and operate your phone through terminal commands.

### A1. Install Ubuntu

Run this in Termux:

```bash
proot-distro install ubuntu
```

Verify it installed:

```bash
proot-distro list
```

### A2. Enter Ubuntu

Use `--termux-home` so Ubuntu can access your Termux home folder. The `/sdcard/termux` folder should also remain easy to reach:

```bash
proot-distro login ubuntu
```

Inside Ubuntu, go back into the repo folder:

```bash
cd /sdcard/termux/KAZ-AI-Android-OS
```

### A3. Install OpenCode

Run this inside Ubuntu:

```bash
apt update && apt install -y curl git ca-certificates build-essential eza
curl -sS https://starship.rs/install.sh | sh -s -- -y
curl -fsSL https://opencode.ai/install | bash
```

### A4. Apply The Proot Linux Shell Setup

The Proot Linux config lives at `proot/.bashrc`. This is different from the Termux `.bashrc` used earlier.

If you keep a working Proot config at `/sdcard/termux/.bashrc`, this repo stores that same idea as `proot/.bashrc` so it does not overwrite the Termux config.

Copy it into Ubuntu's home directory:

```bash
cp proot/.bashrc ~/.bashrc
```

Before starting OpenCode, load it:

```bash
source ~/.bashrc
```

Then start OpenCode:

```bash
opencode
```

Verify OpenCode is available:

```bash
opencode --help
```

Useful Proot Linux shortcuts:

| Shortcut | What It Does |
| --- | --- |
| `portal` | Go to `/` and start OpenCode |
| `cls` | Clear the terminal |
| `ls` | Uses `eza` with icons and colors |
| `ll` | Detailed file list |
| `la` | Show hidden files |

Example prompt to try inside OpenCode:

```text
Explain this phone setup and help me install Python.
```

## Path B: Run Ollama In Termux

Choose this path if you want local AI models running directly on Android through Termux.

Ollama does not have an APK here. Install it from Termux packages:

```bash
pkg update
pkg install -y ollama
```

Start the Ollama server:

```bash
ollama serve
```

Open a second Termux session and run a small model first:

```bash
ollama run qwen2.5:0.5b
```

If your phone has more RAM and storage, try:

```bash
ollama run llama3.2:1b
```

Verify Ollama is installed:

```bash
ollama --version
```

If `pkg install ollama` fails, your device may be unsupported. Ollama in Termux is available for supported 64-bit architectures and may not work on older 32-bit phones.

## Path C: Use The orailnoor Modules

Choose this path if you want Termux UI/helper workflows and extra modules.

The modules are included as Git submodules:

```text
orailnoor-CloudBot-Termux/
termux-linux-setup/
termux-llm/
```

Each module has its own README and usage instructions. Start by opening the module folder and reading its guide:

```bash
cd orailnoor-CloudBot-Termux
ls
```

You can use these modules from Termux, then still enter Ubuntu later with:

```bash
linux
```

## Path D: Use Termux-X11 For GUI Apps

Choose this path only if you want graphical Linux apps or a desktop-style experience.

Install `Termux-X11.apk`, then follow the GUI instructions from the relevant setup module. Termux-X11 is optional for OpenCode and Ollama because both can run in the terminal.

## Recommended Beginner Flow

If you are not sure what to choose, follow this order:

1. Create `/sdcard/termux` and put this repo there.
2. Install Termux and connect storage access.
3. Prepare Termux and copy the KAZ Termux config into Termux home.
4. Install Ubuntu with Path A.
5. Install OpenCode inside Ubuntu.
6. Copy `proot/.bashrc` into Ubuntu and run `source ~/.bashrc`.
7. Use OpenCode as your main AI interface.
8. Add Ollama later if you want local models.
9. Add Termux-X11 later if you want GUI apps.

## Common Problems

| Problem | Fix |
| --- | --- |
| `pkg` commands fail | Run `pkg update` and check internet connection |
| `starship: command not found` | Run `pkg install starship` in Termux |
| `eza: command not found` | Run `pkg install eza` in Termux |
| `opencode: command not found` | In Ubuntu, run `source ~/.bashrc`, then restart the terminal or reinstall OpenCode inside Ubuntu |
| Ubuntu cannot see repo files | Login with `proot-distro login ubuntu`, then use `cd /sdcard/termux/KAZ-AI-Android-OS` |
| Ollama model is too slow | Use a smaller model like `qwen2.5:0.5b` |
| Phone gets hot | Stop unused servers and avoid large local models |

## Battery And Storage Tips

- Use small AI models first.
- Stop `ollama serve` when you are done.
- Avoid running multiple heavy tools at the same time.
- Use `termux-wake-lock` only when you need long background tasks.
- Keep at least a few GB of free storage for Ubuntu, packages, and AI models.

## Project Structure

```text
/sdcard/termux/KAZ-AI-Android-OS/
|-- .bashrc                    # Termux shell shortcuts and prompt setup
|-- proot/.bashrc              # Ubuntu/Proot shell setup for OpenCode
|-- .termux/                   # Termux colors, font, and properties
|-- fonts/                     # Custom fonts
|-- orailnoor-CloudBot-Termux/ # Submodule
|-- termux-linux-setup/        # Submodule
|-- termux-llm/                # Submodule
|-- PRootDistro-README.md      # Reference docs for Proot-Distro
|-- Termux.apk
|-- Termux-API.apk
|-- Termux-Styling.apk
|-- Termux-X11.apk
`-- README.md
```

## Glossary

- Termux: A Linux-like terminal environment for Android.
- Proot-Distro: A tool that installs Linux distributions like Ubuntu inside Termux without root.
- OpenCode: An AI coding and terminal assistant used as the main agentic interface.
- Ollama: A tool for running local AI language models.
- Termux-X11: A display server that makes GUI apps possible on Android.

## License

See individual components and submodules for their respective licenses.
