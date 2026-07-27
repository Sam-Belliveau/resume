#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "Cornell University",
  title: "Teaching Assistant — ECE 4760: Microcontrollers",
  location: "Ithaca, NY",
  dates: "01/2025 — Present",
  bullets: (
    bullet(
      line[Graded weekly lab assignments, giving students detailed feedback on their source code and written reports.],
    ),
    bullet(
      line[Helped lab groups debug their hardware and software, guiding them through the weekly experiments.],
    ),
    bullet(
      line[Documented pin configurations and specifications for lab equipment to streamline student workflow.],
    ),
  ),
)
