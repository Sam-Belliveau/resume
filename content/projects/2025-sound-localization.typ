#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Real-Time Sound Localization System",
  tech: ("Embedded C", "RP2040"),
  dates: "01/2025 — 05/2025",
  link: "https://github.com/Sam-Belliveau/Audio-Triangulation",
  bullets: (
    bullet(
      line[Led a team of three building a \$20 acoustic camera: a Raspberry Pi Pico samples three mics at 50 kHz via DMA.],
    ),
    bullet(
      line[An energy-based detector picks out sound events; cross-correlation turns their time delays into a direction.],
    ),
  ),
)
