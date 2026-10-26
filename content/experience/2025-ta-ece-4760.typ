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
      line[One Fall 2025 group extended our acoustic camera from the course to 3D localization with four microphones.],
    ),
    bullet(
      line[Improved the course's documentation of the microcontroller's pin configurations and lab equipment.],
    ),
  ),
)
