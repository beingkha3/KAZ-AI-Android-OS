# Mobile Linux Setup

A complete setup for running Linux desktop environments on Android devices via Termux. Includes Termux configuration, custom fonts, and integration with various Linux tools.

## Contents

- **APKs**: Termux, Termux-API, Termux-Styling, Termux-X11
- **Fonts**: OpenDyslexic, Terminus, DepartureMono, Gohu
- **Termux Config**: Colors, font, and properties in `.termux/`
- **Submodules**:
  - `orailnoor-CloudBot-Termux` - Cloud bot for Termux
  - `termux-linux-setup` - Linux environment setup scripts
  - `termux-llm` - LLM integration for Termux

## Quick Start

1. Install the Termux APK from this repo or [F-Droid](https://f-droid.org/en/packages/com.termux/)
2. Install Termux-X11 APK for desktop display
3. Copy the `.bashrc` to your Termux home directory
4. Run `proot-distro login ubuntu` to access Linux

## Requirements

- Android 7.0+
- Termux (from F-Droid, not Play Store)
- Termux-X11

## License

See individual submodules for their respective licenses.