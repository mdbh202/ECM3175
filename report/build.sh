#!/bin/bash
# Compilation script for the ECM3175 Final Report
# This script ensures that all auxiliary files and the final PDF
# are placed in the 'out/' directory to keep the project root clean,
# matching the VSCode LaTeX Workshop configuration.

mkdir -p out/chapters

echo "Compiling LaTeX document..."
pdflatex -output-directory=out -interaction=nonstopmode main.tex

echo "Generating bibliography..."
bibtex out/main

echo "Re-compiling to resolve references..."
pdflatex -output-directory=out -interaction=nonstopmode main.tex
pdflatex -output-directory=out -interaction=nonstopmode main.tex

echo "Build complete. The final PDF is located at: out/main.pdf"
