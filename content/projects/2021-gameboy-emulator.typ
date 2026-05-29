#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "GameBoy Emulator",
  tech: ("Rust", "Z80 Assembly", "Hardware Emulation"),
  dates: "Aug 2021 — Dec 2021",
  bullets: (
    bullet(
      line[Implemented the GameBoy's entire Z80 CPU instruction set using only publicly available hardware documentation.],
    ),
    bullet(
      line[Built a rudimentary pixel-processing unit (PPU) that renders the console's sprites and background tiles to the screen.],
    ),
  ),
)
