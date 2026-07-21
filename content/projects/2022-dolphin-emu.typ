#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Dolphin Emulator",
  tech: ("C++", "GLSL", "JIT Recompilation"),
  dates: "Sept 2022 — Present",
  bullets: (
    bullet(
      line[Improved performance on low-end hardware by dynamically scaling the frequency of the emulated video interrupt.],
    ),
    bullet(
      line[Wrote six GPU-accelerated resolution-scaling algorithms in GLSL to sharpen the emulator's output across diverse displays.],
    ),
  ),
)
