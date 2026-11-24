# Setup (Mac, about 30 minutes, once)

## 1. Install VS Code and its extensions

1. Download VS Code from https://code.visualstudio.com and move it to Applications.
2. Open VS Code, go to Extensions (`Cmd+Shift+X`) and install:
   - **Python** (by Microsoft)
   - **Jupyter** (by Microsoft)

## 2. Check Git

In the Terminal:

```bash
git --version
```

If macOS asks to install the command line tools, accept and run the command again.

Then tell Git who you are (once):

```bash
git config --global user.name "Rafael Fagundes"
git config --global user.email "your-github-email@example.com"
```

## 3. Clone the repo

```bash
mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/rs-fagundes/data-practice.git
cd data-practice
```

## 4. Create the Python environment

A virtual environment (`.venv`) keeps the packages of this project apart from the rest of your Mac.

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Tested with Python 3.14. Run `source .venv/bin/activate` again every time you open a new Terminal for this project.

## 5. Open the project in VS Code

```bash
code .
```

If `code` is not found: in VS Code press `Cmd+Shift+P`, run **Shell Command: Install 'code' command in PATH**, and try again.

## 6. Test it

1. Open `training/week-01/day-01.ipynb`.
2. Top right, click **Select Kernel** and choose `.venv`.
3. Run the first cell, then in a new cell run:

```python
con.sql("SELECT COUNT(*) AS orders FROM orders").df()
```

You should see `99441`.

## 7. Every day: commit and push

```bash
git add .
git commit -m "Week 1 day 1"
git push
```

The first `git push` asks you to sign in to GitHub. VS Code opens the browser for it. You can also use the **Source Control** tab (`Ctrl+Shift+G`) instead of the Terminal.

Notebooks save their outputs. Clear them before you commit (top bar: **Clear All Outputs**) to keep the diffs small.
