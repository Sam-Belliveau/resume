#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Real-Time Sound Localization System",
  tech: ("Embedded C", "RP2040"),
  dates: "01/2025 — 05/2025",
  link: "https://github.com/Sam-Belliveau/Audio-Triangulation",
  bullets: (
    bullet(
      line[Built an under-\$20 acoustic camera on a Raspberry Pi Pico sampling three mics at 50 kHz via ping-pong DMA.],
    ),
    bullet(
      line[Interleaved a light comb-filter event detector with a heavier cross-correlation engine for TDOA estimates.],
    ),
  ),
)
