#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "GameBoy Emulator",
  tech: ("Rust", "Sharp LR35902", "Hardware Emulation"),
  dates: "05/2020 — 06/2020",
  link: "https://github.com/Sam-Belliveau/TheSamBoy",
  bullets: (
    bullet(
      line[Mapped every opcode of the GameBoy's Z80-like CPU and implemented its loads, jumps, and 8-bit math.],
    ),
    bullet(
      line[Added a basic graphics unit, joypad input, interrupts, a timer, and a memory bus with cartridge support.],
    ),
  ),
)
