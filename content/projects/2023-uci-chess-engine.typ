#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "UCI Chess Engine",
  tech: ("Rust", "Minimax", "Alpha-Beta Pruning", "Opponent Modeling"),
  dates: "06/2023 — Present",
  link: "https://github.com/Sam-Belliveau/flying-dutchman",
  bullets: (
    bullet(
      line[Built a UCI chess engine in Rust around alpha-beta search with iterative deepening, then added opponent],
      line[modeling: opponent nodes consider only moves a shallow search says look strong, mimicking human play.],
    ),
    bullet(
      line[Fielded it as a Lichess bot, then ran trap-seeking searches in lc0 driven by Maia's human-likeness networks.],
    ),
  ),
)
