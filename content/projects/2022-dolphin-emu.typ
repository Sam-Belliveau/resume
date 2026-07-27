#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Dolphin Emulator",
  tech: ("C++", "GLSL", "JIT Recompilation"),
  dates: "Sept 2022 — Present",
  bullets: (
    bullet(
      line[Improved low-end hardware performance by dynamically scaling the emulated video interrupt's frequency.],
    ),
    bullet(
      line[Wrote six GPU-accelerated resolution-scaling algorithms in GLSL to sharpen output across diverse displays.],
    ),
  ),
)
