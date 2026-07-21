#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "UCI Chess Engine",
  tech: ("Rust", "Minimax", "Alpha-Beta Pruning", "Opponent Modeling"),
  dates: "June 2023 — Present",
  link: "https://github.com/Sam-Belliveau/flying-dutchman",
  bullets: (
    bullet(
      line[Built a UCI chess engine in Rust around alpha-beta search with iterative deepening, then extended it with opponent],
      line[modeling: opponent nodes consider only the moves a shallow search says look immediately strong, mimicking human play.],
    ),
    bullet(
      line[Fielded the engine as a Lichess bot, and later ran trap-seeking searches in lc0 driven by Maia's human-likeness networks.],
    ),
  ),
)
