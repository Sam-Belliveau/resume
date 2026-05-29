#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Dolphin Emulator",
  tech: ("C++", "GLSL", "JIT Recompilation"),
  dates: "Sept 2022 — Present",
  bullets: (
    bullet(
      line[Optimized emulation performance on low-end hardware by dynamically scaling the video-interrupt signal frequency.],
    ),
    bullet(
      line[Implemented six GPU-accelerated GLSL resolution-scaling algorithms to sharpen image fidelity across diverse displays.],
    ),
  ),
)
