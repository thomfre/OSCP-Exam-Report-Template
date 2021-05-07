#!/bin/bash

OSID="XXXXX"
EXAM_REPORT="OSCP-OS-$OSID-Exam-Report.pdf"
LAB_REPORT="OSCP-OS-$OSID-Lab-Report.pdf"
ZIP_PACKAGE="OSCP-OS-$OSID-Exam-Report.7z"

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'
RESET='\033[0m'

echo -e "${BLUE}[*]${RESET} Starting report generation and packaging for ${OSID}"

./generate-report.sh lab-report $LAB_REPORT

./generate-report.sh exam-report $EXAM_REPORT

echo -e "${BLUE}[*]${RESET} Creating 7z package..."
7z a $ZIP_PACKAGE $EXAM_REPORT $LAB_REPORT
md5sum $ZIP_PACKAGE > md5sum.txt
cat ./md5sum.txt
