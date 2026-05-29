# Local builds for the Typst résumé. CI runs the same `typst` invocations.
# `just` on its own lists the recipes.

fontdir := "fonts"
variants := "swe robotics research"

default:
    @just --list

# Live-reload a variant's draft (colour-coded fit feedback). e.g. `just watch robotics`
watch variant="swe":
    typst watch --root . --font-path {{fontdir}} --input draft=true \
        variants/{{variant}}.typ out/{{variant}}-draft.pdf

# Render a variant's draft to PNG, for visual line tuning. e.g. `just png swe 150`
png variant="swe" ppi="150":
    typst compile --root . --font-path {{fontdir}} --input draft=true --ppi {{ppi}} \
        variants/{{variant}}.typ out/{{variant}}-draft.png

# Build one variant's final (clean) PDF.
build variant="swe":
    typst compile --root . --font-path {{fontdir}} --input draft=false \
        variants/{{variant}}.typ out/Sam-Belliveau-{{variant}}.pdf

# Build every variant's final PDF into out/.
all:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p out
    for v in {{variants}}; do
        typst compile --root . --font-path {{fontdir}} --input draft=false \
            variants/$v.typ out/Sam-Belliveau-$v.pdf
    done

# Confirm typst can see the bundled font family.
font-check:
    typst fonts --font-path {{fontdir}} | grep -i "source sans"

clean:
    rm -rf out
