#!/bin/bash
cd docs
mkdir -p pdf
for filename in *.md; do   echo $filename;   pandoc $filename -f markdown -t latex --pdf-engine=xelatex -o ./pdf/${filename}.pdf; done
