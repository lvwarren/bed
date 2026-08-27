# Bed (Browser Editor)

> A zero-bloat, lightning-fast text and bookmark editor running inside Google Chrome.

**Bed** turns your browser into a local desktop editor. Double-click any `.link`, `.txt`, or `.md` file to immediately open a minimalist, dark-mode editing session. Modify content, rename extensions on the fly, jump out to live URLs, and hit `Cmd+S` to write in-place directly to disk.

When you close the browser tab, the background server terminates automatically.

---

## ⚡ The Desktop Bookmark Workflow

Modern browsers make it easy to drag links (from Twitter/X, GitHub, research papers, or articles) directly onto your desktop. `Bed` makes those links immediately editable, annotatable, and launchable:

```text
[ Browser / Twitter / Web ]
           │
           │  (Drag link to Desktop)
           ▼
    [ myArticle.link ] ──( Double Click )──▶ [ Chrome Bed Editor ]
                                                   │
               ┌───────────────────────────────────┴───────────────────────────────────┐
               ▼                                                                       ▼
   [ Edit Notes & URLs ]                                                   [ Instant Navigation ]
   Type summary, context, tags.                                            Press Cmd + Enter anywhere 
   Press Cmd + S to save in-place.                                         on a line to open that URL in a tab.

```

---

## 📝 The `.link` Format

A `.link` file is a plain-text document structured with a Windows-compatible `[InternetShortcut]` header, followed by user notes, markdown, or task lists:

```ini
[InternetShortcut]
URL=https://x.com/karpathy/status/1754888066270724397

# Research Notes
- Need to reproduce this transformer training script on local cluster
- Check Section 3 for hyperparameter benchmarks
- Tag: #ml #cuda #transformers

```

`Bed` parses the `URL=` key or any bare URL on the current line for instant browser tab opening.

---

## 🚀 Key Features

* **⚡ Instant Native Launch:** Double-click any `.link`, `.txt`, `.md`, or `.ini` file in Finder.
* **💾 In-Place Disk Writes:** `Cmd+S` (or `Ctrl+S`) commits directly to your file system without file picker dialogs.
* **🌐 URL Line Navigation:** Press `Cmd+Enter` (or `Ctrl+Enter`) on any line containing a URL or domain to open it in a new tab.
* **🏷️ Dynamic Suffix & Rename:** Edit the filename/extension in the header bar and press `Enter` to rename on disk automatically.
* **🪶 Zero Dependencies:** Pure Python 3 standard library. No Electron, no Node, no NPM packages, zero bloat.
* **🔌 Self-Terminating:** Automatically monitors browser presence via WebSocket/Beacon heartbeats and exits cleanly when the tab closes.

---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
| --- | --- |
| **`Cmd + S`** / **`Ctrl + S`** | Save changes in-place directly to disk |
| **`Cmd + Enter`** / **`Ctrl + Enter`** | Open the URL found on the active line in a new tab |
| **`Tab`** | Insert 4-space indentation |
| **`Enter`** *(in filename box)* | Rename file / change extension on disk |

---

## 📦 Installation (macOS)

### 1. Clone & Install

```bash
git clone https://github.com/your-username/bed.git
cd bed
./install.sh

```

*`./install.sh` compiles a native Cocoa bundle (`Bed.app`) in `~/Applications` and registers all file handlers with macOS LaunchServices.*

---

## 🔗 Set Default Association (One-Time)

1. Right-click any `.link` (or `.txt`) file on your Desktop and select **Get Info** (`Cmd + I`).
2. Under **Open with:**, select **Bed**.
3. Click **Change All...** and confirm.

---

## 🖥️ Command Line Usage

You can also launch `bed` directly from your terminal:

```bash
bed ~/Desktop/research.link
bed notes.txt
bed config.ini

```

---

## 📄 License

MIT License. Free and open source.
