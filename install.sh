#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BED_BIN="$DIR/bed"

chmod +x "$BED_BIN"

# Optional symlink into /usr/local/bin for global terminal access
if [ -d "/usr/local/bin" ] && [ -w "/usr/local/bin" ]; then
    ln -sf "$BED_BIN" "/usr/local/bin/bed"
    echo "✓ Linked bed to /usr/local/bin/bed"
elif [ -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
    ln -sf "$BED_BIN" "$HOME/bin/bed"
    echo "✓ Linked bed to $HOME/bin/bed"
fi

# Run the native installer
"$BED_BIN" --install