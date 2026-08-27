# Bed (Browser Editor)

> A zero-bloat, instant-launch text and bookmark editor running inside your default web browser.
> 
> 
> **Platform Support:** macOS Only (Apple Silicon & Intel)
> 
> 

**Bed** turns your web browser into an ultra-fast local scratchpad and desktop bookmark manager. Double-click any `.link`, `.txt`, `.md`, or `.ini` file in Finder to immediately launch a dark-mode editing session. Modify content, rename files or suffixes on the fly, jump directly to active URLs, and hit `Cmd+S` to commit changes in-place to disk.

When you close the browser tab, the lightweight background process terminates automatically.

---

## ⚡ The Desktop Bookmark Workflow

Modern browsers make it easy to drag links (from Twitter/X, GitHub, research papers, or articles) directly onto your desktop. `Bed` turns those raw links into editable, annotatable, and launchable workspace cards:

```text
[ Browser / Twitter / Web ]
           │
           │  (Drag link to Desktop)
           ▼
    [ myArticle.link ] ──( Double Click )──▶ [ Chrome / Safari Bed Editor ]
                                                   │
               ┌───────────────────────────────────┴───────────────────────────────────┐
               ▼                                                                       ▼
   [ Edit Notes & Annotations ]                                            [ Instant Navigation ]
   Add context, summaries, or tags.                                        Press Cmd + Enter anywhere 
   Press Cmd + S to save in-place.                                         on a line to open that URL in a tab.

```

---

## 📝 The `.link` Format

A `.link` file is a plain-text document formatted with a standard Windows-compatible `[InternetShortcut]` header, followed by Markdown notes, task items, or research logs:

```ini
[InternetShortcut]
URL=https://x.com/karpathy/status/1754888066270724397

# Research Notes
- Need to reproduce this transformer training script on local cluster
- Check Section 3 for hyperparameter benchmarks
- Tag: #ml #cuda #transformers

```

`Bed` inspects the active cursor line and instantly launches either the `URL=` target or any bare web link found on that line.

---

## 🚀 Key Features

* **⚡ Instant Native Launch:** Double-click `.link`, `.txt`, `.md`, or `.ini` files directly in Finder.


* **💾 In-Place Disk Writes:** `Cmd+S` saves directly back to the source file with zero file picker prompts.


* **🌐 URL Line Navigation:** Press `Cmd+Enter` on any line containing a URL or domain to open it in a new browser tab.


* **🏷️ Dynamic Suffix & Rename:** Edit the filename or extension in the top bar and press `Enter` to rename the file on disk instantly.


* **🪶 Zero Dependencies:** Built strictly on the Python 3 standard library and a native Objective-C launcher. No Electron, Node.js, or NPM packages.


* **🔌 Clean Self-Termination:** Background listener tracks browser heartbeats and exits memory as soon as the tab closes.



---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
| --- | --- |
| **`Cmd + S`** | Save changes in-place directly to disk

 |
| **`Cmd + Enter`** | Open the URL found on the active line in a new tab

 |
| **`Tab`** | Insert clean 4-space indentation

 |
| **`Enter`** *(in filename header)* | Commit file rename / change extension on disk

 |

---

## 📦 Installation & Updating (macOS Only)

### Initial Install

```bash
git clone https://github.com/lvwarren/bed.git
cd bed
./install.sh

```

`./install.sh` compiles the native Cocoa bundle (`Bed.app`) in `~/Applications`, ad-hoc signs it, and registers document UTIs with macOS LaunchServices.

### Updating an Existing Installation

Whenever you pull the latest updates from the repository, re-register the native application bundle by running:

```bash
git pull
bed --install

```

*(or run `./install.sh` from the repo root).*

---

## 🔗 Set Default File Association (One-Time Setup)

To configure macOS Finder to open all `.link` files in `Bed` on double-click:

1. Right-click any `.link` (or `.txt`) file on your Desktop or in Finder and choose **Get Info** (`Cmd + I`).


2. Expand the **Open with:** section and choose **Bed**.


3. Click **Change All...** and confirm.



---

## 🖥️ Command Line Usage

`Bed` can also be invoked directly from the terminal:

```bash
bed ~/Desktop/worldMonitor.link
bed notes.txt
bed config.ini
bed --install

```

---

## 📄 License

MIT License. Free and open source.
