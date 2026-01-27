# LaTeX Resume Makefile
# Builds all .tex files in the root directory to PDFs

# Find all .tex files in root (excluding component-test)
SOURCES := $(wildcard Sam-Belliveau-*.tex)
PDFS := $(SOURCES:.tex=.pdf)

# Build directory for auxiliary files
BUILD_DIR := .tex_build

# LaTeX compiler settings
LATEX := pdflatex
LATEXFLAGS := -interaction=nonstopmode -output-directory=$(BUILD_DIR)

.PHONY: all clean

# Default target: build all PDFs
all: $(PDFS)

# Pattern rule: build PDF from .tex
%.pdf: %.tex $(BUILD_DIR)
	$(LATEX) $(LATEXFLAGS) $<
	$(LATEX) $(LATEXFLAGS) $<
	mv $(BUILD_DIR)/$@ .

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean auxiliary files
clean:
	rm -rf $(BUILD_DIR)

# Clean everything including PDFs
cleanall: clean
	rm -f $(PDFS)
