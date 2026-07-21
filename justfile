# Local builds for the Typst résumé. CI runs the same `typst` invocations.
# `just` on its own lists the recipes.

fontdir := "fonts"
variants := "swe robotics research"

default:
    @just --list

# Live-reload a variant's draft (colour-coded fit feedback). e.g. `just watch robotics`
watch variant:
    typst watch --root . --font-path {{fontdir}} --input draft=true \
        variants/{{variant}}.typ out/{{variant}}-draft.pdf

# Render a variant's draft to PNG, for visual line tuning. e.g. `just png swe` or `just png swe 150`
png variant ppi="300":
    typst compile --root . --font-path {{fontdir}} --input draft=true --ppi {{ppi}} \
        variants/{{variant}}.typ out/{{variant}}-draft.png

# Machine-readable fit report: every line's fill ratio + the page density, as XML.
# The text-based alternative to reading the draft PNG. e.g. `just fit swe`
fit variant:
    @typst query --root . --font-path {{fontdir}} --input draft=true \
        variants/{{variant}}.typ "<fit>" --field value | python3 scripts/fit-report.py {{variant}}

# Build one variant's final (clean) PDF. `--pdf-standard a-2a` emits a tagged,
# archival PDF/A-2a — the accessible conformance level: it validates the logical
# structure tree (from the real heading() elements) and document language, not just
# visual fidelity. Typst tags by default; this pins and certifies the standard.
build variant:
    typst compile --root . --font-path {{fontdir}} --input draft=false --pdf-standard a-2a \
        variants/{{variant}}.typ out/Sam-Belliveau-{{variant}}.pdf

# Extract a plain-text (ATS / copy-paste) companion of a variant from its final PDF.
# Requires poppler's `pdftotext`. e.g. `just txt research`
txt variant: (build variant)
    pdftotext -nopgbrk out/Sam-Belliveau-{{variant}}.pdf out/Sam-Belliveau-{{variant}}.txt

# Build every variant's final PDF (+ .txt if pdftotext is present) into out/.
all:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p out
    for v in {{variants}}; do
        typst compile --root . --font-path {{fontdir}} --input draft=false --pdf-standard a-2a \
            variants/$v.typ out/Sam-Belliveau-$v.pdf
        if command -v pdftotext >/dev/null 2>&1; then
            pdftotext -nopgbrk out/Sam-Belliveau-$v.pdf out/Sam-Belliveau-$v.txt
        fi
    done

# Confirm typst can see the bundled font family.
font-check:
    typst fonts --font-path {{fontdir}} | grep -i "source sans"

clean:
    rm -rf out
