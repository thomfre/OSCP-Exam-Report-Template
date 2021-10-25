# OSCP-Exam-Report-Template

[![GitHub Issues](https://img.shields.io/github/issues/thomfre/OSCP-Exam-Report-Template)](https://github.com/thomfre/OSCP-Exam-Report-Template/issues)
[![Forks](https://img.shields.io/github/forks/thomfre/OSCP-Exam-Report-Template)](https://github.com/thomfre/OSCP-Exam-Report-Template/network/members)
[![GitHub Stars](https://img.shields.io/github/stars/thomfre/OSCP-Exam-Report-Template)](https://github.com/thomfre/OSCP-Exam-Report-Template/stargazers)
[![License](https://img.shields.io/github/license/thomfre/OSCP-Exam-Report-Template?v=2)](https://github.com/thomfre/OSCP-Exam-Report-Template/blob/master/LICENSE)

This is my OSCP exam notes template, based on the fine work by noraj in his [OSCP-Exam-Report-Template-Markdown](https://github.com/noraj/OSCP-Exam-Report-Template-Markdown) ([LICENSE](https://github.com/noraj/OSCP-Exam-Report-Template-Markdown/blob/master/LICENSE))

This allow fast and efficient note writing during both the labs and the exam.

Instead of one huge report file, this template is based on several smaller markdown files, which are stitched together using MarkdownPP before generating the final report with Pandoc.

The report text is the [whoisflynn improved version](https://github.com/whoisflynn/OSCP-Exam-Report-Template) of the official [PWK Example Report](https://www.offensive-security.com/pwk-online/PWK-Example-Report-v1.pdf).

## Requirements

- [MarkdownPP](https://github.com/jreese/markdown-pp)
- [Pandoc](https://pandoc.org/installing.html)
- LaTeX (eg. [TeX Live](http://www.tug.org/texlive/)) in order to get `pdflatex` or `xelatex`
- [Eisvogel Pandoc LaTeX PDF Template](https://github.com/Wandmalfarbe/pandoc-latex-template#installation)

## Usage

1. Start by making a [new private repository from this template](https://github.com/thomfre/OSCP-Exam-Report-Template/generate). **Make sure you make it private**
2. Edit **generate-package.sh** and add your OS-ID to `OSID=""`.
3. Run **install-tools.sh** to install necessary tools and libraries (tested on ParrotOS), edit first if you don't want to install all of LaTeX.
4. Edit the report.mdpp files and add your own information.
5. Then simply write your report in **markdown**.
6. Run **generate-package.sh** to generate report PDFs and report package.

### Exercises and targets

Add exercises to the _Lab/Exercises_ directory, save as _.md_ files. Prefix the file with the chapter number, to ensure that the exercises will be included in the correct order.

Add targets in _Lab/Targets_ and _Exam/Targets_, save as _.md_ files.

## Adjust to your needs

You can change the code syntax highlight theme by modifying [`--highlight-style`](https://pandoc.org/MANUAL.html#option--highlight-style) in **generate-report.sh**.

### Color sets

Well rendering color sets you can use in the template YAML:

| titlepage-color          | titlepage-text-color | titlepage-rule-color |
| ------------------------ | -------------------- | -------------------- |
| `DC143C` (Crimson)       | `FFFFFF` (White)     | `FFFFFF` (White)     |
| `00FF7F` (SpringGreen)   | `006400` DarkGreen   | `000000` (Black)     |
| `1E90FF` (DodgerBlue)    | `FFFAFA` (Snow)      | `FFFAFA` (Snow)      |
| `483D8B` (DarkSlateBlue) | `FFFAFA` (Snow)      | `FFFAFA` (Snow)      |
| `FFD700` (Gold)          | `000000` (Black)     | `000000` (Black)     |
| `FFEFD5` (PapayaWhip)    | `000000` (Black)     | `000000` (Black)     |
| `FF8C00` (DarkOrange)    | `000000` (Black)     | `000000` (Black)     |
| `FFEF96` (no name)       | `50394C` (no name)   | `50394C` (no name)   |

## VS Code

VS Code is a very good editor, and it is also a very good Markdown editor! The following extensions will make it even better (better for more than just Markdown):

- Github Markdown Preview - [bierner.github-markdown-preview](https://marketplace.visualstudio.com/items?itemName=bierner.github-markdown-preview)
- markdownlint - [davidanson.vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- Markdown Paste - [telesoho.vscode-markdown-paste-image](https://marketplace.visualstudio.com/items?itemName=telesoho.vscode-markdown-paste-image)
- Markdown Navigate - [jrieken.md-navigate](https://marketplace.visualstudio.com/items?itemName=jrieken.md-navigate)
- Markdown All in One - [yzhang.markdown-all-in-one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- Word Count - [ms-vscode.wordcount](https://marketplace.visualstudio.com/items?itemName=ms-vscode.wordcount)
- Markdown PDF - [yzane.markdown-pdf](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)
- Code Spell Checker - [streetsidesoftware.code-spell-checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- GitLens — Git supercharged - [eamodio.gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- PowerShell - [ms-vscode.PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- Python - [ms-python.python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- Ruby - [rebornix.Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)
- C/C++ - [vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- vscode-icons - [vscode-icons-team.vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- Polacode - [pnp.polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- vscode-pdf - [tomoki1207.pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)
- hexdump for VSCode - [slevesque.vscode-hexdump](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-hexdump)

### Fonts

To make it even better, install Fira Code and Noto Color Emoji:

- FiraCode - `sudo apt install fonts-firacode`
- Noto Color Emoji - `sudo apt install fonts-noto-color-emoji`

### VSCode settings.json

```json
{
  "telemetry.enableTelemetry": false,
  "telemetry.enableCrashReporter": false,
  "editor.formatOnSave": true,
  "workbench.iconTheme": "vscode-icons",
  "editor.fontFamily": "Fira Code,Noto Color Emoji",
  "editor.fontSize": 14,
  "editor.fontLigatures": true,
  "markdown-pdf.executablePath": "/opt/google/chrome/chrome",
  "editor.codeActionsOnSave": {
    "source.fixAll.markdownlint": true
  }
}
```

## Known issues

MarkdownPP has [a bug that will break include statements inside C-code blocks](https://github.com/thomfre/OSCP-Exam-Report-Template/issues/6). This bug has been fixed in this fork: https://github.com/miguelangelnieto/markdown-pp

## Credits

### Based on  

noraj OSCP-Exam-Report-Template-Markdown (([LICENSE](https://github.com/noraj/OSCP-Exam-Report-Template-Markdown/blob/master/LICENSE))): <https://github.com/noraj/OSCP-Exam-Report-Template-Markdown>

### Inspired by

JohnHammond oscp-notetaking (UNLICENSED): <https://github.com/JohnHammond/oscp-notetaking>

### Report Template

whoisflynn improved template v3.2 (UNLICENSED): <https://github.com/whoisflynn/OSCP-Exam-Report-Template>

### Pandoc Template

Eisvogel ([LICENSE](https://github.com/Wandmalfarbe/pandoc-latex-template/blob/master/LICENSE)): <https://github.com/Wandmalfarbe/pandoc-latex-template>
