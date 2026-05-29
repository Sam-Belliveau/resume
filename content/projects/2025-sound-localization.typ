#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Real-Time Sound Localization System",
  tech: ("Embedded C", "RP2040"),
  dates: "01/2025 — 05/2025",
  link: "https://github.com/Sam-Belliveau/Audio-Triangulation",
  bullets: (
    bullet(
      line[Architected an under-\$20 acoustic camera on a Raspberry Pi Pico that samples three microphones at 50 kHz through a],
      line[custom ping-pong DMA buffer strategy that guarantees deterministic, drop-free capture of the incoming audio streams.],
    ),
    bullet(
      line[Interleaved a lightweight comb-filter event detector with a heavier cross-correlation engine for accurate TDOA estimation.],
    ),
  ),
)
