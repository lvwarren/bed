#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "=== 1. Validating Bed Python Syntax ==="
python3 -m py_compile bed
echo "✓ Python syntax OK."

echo "=== 2. Checking Executable Permissions ==="
chmod +x bed install.sh sync_repo.bash
echo "✓ Permissions verified."

echo "=== 3. Testing Local Installation ==="
./bed --install

echo "=== 4. Git Synchronization ==="

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "Initializing new Git repository..."
    git init -b main
fi

# Stage all files
git add -A

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo "No local changes to commit."
else
    # Prompt for commit message or use timestamp default
    if [ -n "$1" ]; then
        MSG="$1"
    else
        read -r -p "Enter commit message (or press enter for default): " USER_MSG
        if [ -z "$USER_MSG" ]; then
            MSG="Update Bed - $(date '+%Y-%m-%d %H:%M:%S')"
        else
            MSG="$USER_MSG"
        fi
    fi
    git commit -m "$MSG"
    echo "✓ Committed changes: '$MSG'"
fi

# Ensure remote is set
if ! git remote get-url origin > /dev/null 2>&1; then
    if command -v gh > /dev/null 2>&1; then
        echo "GitHub CLI detected. Creating remote repository..."
        gh repo create bed --public --source=. --remote=origin --push || true
    else
        read -r -p "Enter GitHub Remote URL (e.g., git@github.com:user/bed.git): " REMOTE_URL
        if [ -n "$REMOTE_URL" ]; then
            git remote add origin "$REMOTE_URL"
        fi
    fi
fi

# Push to upstream
CURRENT_BRANCH="$(git branch --show-current)"
if [ -z "$CURRENT_BRANCH" ]; then
    CURRENT_BRANCH="main"
fi

if git remote get-url origin > /dev/null 2>&1; then
    echo "Pushing to origin/$CURRENT_BRANCH..."
    git push -u origin "$CURRENT_BRANCH"
    echo "✓ Repository successfully synchronized with GitHub."
else
    echo "! Warning: No remote 'origin' configured. Changes committed locally."
fi
