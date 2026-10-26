#import "../../lib/lib.typ": project, bullet, line

// Verified against the dolphin-emu/dolphin PR list (17 merged as of 10/2026).
#let entry = project(
  title: "Dolphin Emulator",
  tech: ("C++", "Audio DSP", "GLSL"),
  dates: "Sept 2022 — Present",
  link: "https://github.com/dolphin-emu/dolphin/pulls?q=author%3ASam-Belliveau",
  bullets: (
    bullet(
      line[Wrote a granular-synthesis audio system that keeps sound smooth on low-end phones when emulation slows.],
    ),
    bullet(
      line[Merged 17 pull requests, several featured in progress reports, including VI Skip and HDR output on Metal.],
    ),
  ),
)
