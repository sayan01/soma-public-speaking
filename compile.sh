#!/bin/bash

# Script to compile the LaTeX presentation to PDF using XeLaTeX
# Running XeLaTeX three times to ensure all references, TOC, and links are properly resolved

echo "Starting compilation of the presentation..."

# Run xelatex first time - creates initial PDF and auxiliary files
echo "First run of XeLaTeX..."
xelatex -interaction=nonstopmode public_speaking_presentation.tex

# Run xelatex second time - resolves references
echo "Second run of XeLaTeX..."
xelatex -interaction=nonstopmode public_speaking_presentation.tex

# Run xelatex third time - finalizes all cross-references and links
echo "Third run of XeLaTeX..."
xelatex -interaction=nonstopmode public_speaking_presentation.tex

# Check if compilation was successful
if [ -f "public_speaking_presentation.pdf" ]; then
    echo "Compilation successful! The PDF is ready: public_speaking_presentation.pdf"
    # On macOS, open the PDF
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Opening the PDF with the default viewer..."
        open public_speaking_presentation.pdf
    fi
else
    echo "Compilation failed. Please check the log files for errors."
fi

# Clean up auxiliary files
echo "Cleaning up auxiliary files..."
rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.synctex.gz
echo "Cleanup complete."