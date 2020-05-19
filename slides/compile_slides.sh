#!/bin/bash
# Build revealjs presentation from Markdown file using Pandoc
# Revealjs configuration found at https://github.com/hakimel/reveal.js#configuration

FILENAME="cryptography_20200511"

pandoc -t revealjs -s -o ${FILENAME}.html ${FILENAME}.md --slide-level 2 -V revealjs-url=./reveal.js -V theme=robolung -V slideNumber=true -V hash=true -V history=true -V margin=0.1 -V preloadIframes=true -V controlsTutorial=false --mathjax -V controls=false

# Insert custom html that creates the borders in the used theme
sed -ie '/^<body>/a <div class="line top"></div>\n<div class="line bottom"></div>\n<div class="line left"></div>\n<div class="line right"></div>' ${FILENAME}.html

# HACK: sed produces an unnecessary backup copy and I couldn't figure out how to disable it..
rm ${FILENAME}.htmle

# Generate pdf from latex beamer (Unfortunately can't handle emojis')
# pandoc -t beamer ${FILENAME}.md -o beamer.pdf --pdf-engine=xelatex
