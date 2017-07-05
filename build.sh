#!/bin/bash
pandoc python.md --smart --self-contained --highlight-style=haddock --toc --css github.css --to html5 -o python.html
