#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "GameBoy Emulator",
  tech: ("Rust", "Z80 Assembly", "Hardware Emulation"),
  dates: "Aug 2021 — Dec 2021",
  bullets: (
    bullet(
      line[Implemented the GameBoy's entire Z80 instruction set in Rust from publicly available hardware documentation alone.],
    ),
    bullet(
      line[Built a rudimentary pixel-processing unit (PPU) that draws the console's sprites and background tiles onto the screen.],
    ),
  ),
)
