#!/bin/bash

pip3 install MarkdownPP
apt install -y pandoc texlive-full
cp eisvogel.tex /usr/share/pandoc/data/templates/eisvogel.latex