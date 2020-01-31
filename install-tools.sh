#!/bin/bash

pip3 install MarkdownPP
apt install -y pandoc texlive-full
wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex -O /usr/share/pandoc/data/templates/eisvogel.latex
