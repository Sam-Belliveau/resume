#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "UCI Chess Engine",
  tech: ("Rust", "Minimax", "Alpha-Beta Pruning"),
  dates: "June 2023 — July 2023",
  bullets: (
    bullet(
      line[Built a high-performance UCI-compliant chess engine in Rust reaching an estimated 2700 Elo (grandmaster level).],
    ),
    bullet(
      line[Optimized search efficiency with alpha-beta pruning and iterative deepening to significantly boost engine strength.],
    ),
  ),
)
