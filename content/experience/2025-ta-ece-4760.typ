#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University",
  title: "Teaching Assistant — ECE 4760: Microcontrollers",
  location: "Ithaca, NY",
  dates: "08/2025 — 12/2025",
  bullets: (
    bullet(
      line[Graded weekly labs and helped lab groups debug their hardware and software in each week's experiment.],
    ),
    bullet(
      line[One group extended my team's acoustic camera to 3D with four mics; I explained its design and helped debug.],
    ),
    bullet(
      line[Improved the course's documentation of the microcontroller's pin configurations and lab equipment.],
    ),
  ),
)
