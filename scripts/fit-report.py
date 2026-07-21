#!/usr/bin/env python3
"""Turn `typst query ... "<fit>" --field value` JSON into a compact XML fit report.

Usage: typst query ... | python3 scripts/fit-report.py <variant>
"""
import json
import sys
from xml.sax.saxutils import escape, quoteattr


def attr(name, value):
    return f" {name}={quoteattr(str(value))}"


variant = sys.argv[1] if len(sys.argv) > 1 else "?"
records = json.load(sys.stdin)

page = next((r for r in records if r.get("kind") == "page"), {})
lines = [r for r in records if r.get("kind") == "line"]
flagged = sum(1 for r in lines if r["status"] != "ok")
em = page.get("font_size", 10.0)  # body font size in pt, for em-relative gaps

lo, hi = page.get("line_band", ("?", "?"))
print(f"<fit-report{attr('variant', variant)}{attr('flagged', flagged)}>")
print(f"  <!-- fill = natural width / column width; ok band is [{lo}, {hi}]. -->")
print("  <!-- short: stretched, add words. long: squeezed, tighten or move a clause. -->")
if page:
    print(
        f"  <page{attr('status', page['status'])}{attr('free', page['free'])}"
        f"{attr('ok-band', list(page['band']))}/>"
    )
    # Resolved vertical gaps: how much page height each gap kind actually got.
    # `each` is in em (multiples of the body font size); airy pages show big gaps.
    gaps = page.get("gaps", {})
    if gaps:
        print("  <spacing> <!-- each = average resolved gap, in em -->")
        for kind, g in gaps.items():
            each = g["total"] / g["count"] / em
            print(
                f"    <gap{attr('kind', kind)}{attr('count', g['count'])}"
                f"{attr('weight', round(g['weight'], 2))}{attr('each', f'{each:.2f}em')}/>"
            )
        print("  </spacing>")
for r in lines:
    print(
        f"  <line{attr('status', r['status'])}{attr('fill', r['fill'])}>"
        f"{escape(r['text'].strip())}</line>"
    )
print("</fit-report>")
