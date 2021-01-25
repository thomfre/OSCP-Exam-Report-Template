#!/bin/bash

TEMPLATE_PATH=$1.mdpp
PREPROCESSED_PATH=$1.md
OUTPUT_PATH=$2

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RESET='\033[0m'

if [ $1 = "lab-report" ]; then
    echo -e "${BLUE}[*]${RESET} Preparing lab report for generation"

    for n in Lab/Targets/*.md; do printf '!INCLUDE "%s"\n\\newpage\n\n' "$n"; done > Lab/Parts/03-hosts.mdpp
    for n in Lab/Appendices/*.md; do printf '!INCLUDE "%s", 1\n\n' "$n"; done > Lab/Parts/04-appendices.mdpp
    for n in Lab/Exercises/*.md; do printf '!INCLUDE "%s"\n\\newpage\n\n' "$n"; done > Lab/Parts/05-exercises.mdpp

    echo -e "${BLUE}[*]${RESET} Stitching together targets, appendices and exercises"
    markdown-pp Lab/Parts/03-hosts.mdpp -o Lab/Parts/03-hosts.md 1>/dev/null
    markdown-pp Lab/Parts/04-appendices.mdpp -o Lab/Parts/04-appendices.md 1>/dev/null
    markdown-pp Lab/Parts/05-exercises.mdpp -o Lab/Parts/05-exercises.md 1>/dev/null
    
    echo -e "${BLUE}[*]${RESET} Correcting relative image URLs"
    sed -i -E 's/\!\[\]\(/![](Lab\/Targets\//g' Lab/Parts/03-hosts.md 1>/dev/null
    sed -i -E 's/\!\[\]\(/![](Lab\/Appendices\//g' Lab/Parts/04-appendices.md 1>/dev/null
    sed -i -E 's/\!\[\]\(/![](Lab\/Exercises\//g' Lab/Parts/05-exercises.md 1>/dev/null
else
    echo -e "${BLUE}[*]${RESET} Preparing exam report for generation"
    for n in Exam/Targets/*.md; do printf '!INCLUDE "%s"\n\\newpage\n\n' "$n"; done > Exam/Parts/03-hosts.mdpp
    for n in Exam/Appendices/*.md; do printf '!INCLUDE "%s", 1\n\n' "$n"; done > Exam/Parts/04-appendices.mdpp

    echo -e "${BLUE}[*]${RESET} Stitching together targets and appendices"
    markdown-pp Exam/Parts/03-hosts.mdpp -o Exam/Parts/03-hosts.md 1>/dev/null
    markdown-pp Exam/Parts/04-appendices.mdpp -o Exam/Parts/04-appendices.md 1>/dev/null

    echo -e "${BLUE}[*]${RESET} Correcting relative image URLs"
    sed -i -E 's/\!\[\]\(/![](Exam\/Targets\//g' Exam/Parts/03-hosts.md 1>/dev/null
    sed -i -E 's/\!\[\]\(/![](Exam\/Appendices\//g' Exam/Parts/04-appendices.md 1>/dev/null
fi

echo -e "${BLUE}[*]${RESET} Generating report"
markdown-pp $TEMPLATE_PATH -o $PREPROCESSED_PATH 1>/dev/null

#Pandoc doesn't support syntax highlighting for cmd, so we need to replace it with bash
sed -i -E 's/```cmd/```bash/g' $PREPROCESSED_PATH 1>/dev/null

echo -e "${BLUE}[*]${RESET} Creating PDF"
pandoc $PREPROCESSED_PATH \
-o $OUTPUT_PATH \
-V block-headings \
-V urlcolor=blue \
--from markdown \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style tango \
--syntax-definition=text.xml \
