#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "UCI Chess Engine",
  tech: ("Rust", "Minimax", "Alpha-Beta Pruning", "Opponent Modeling"),
  dates: "06/2023 — Present",
  link: "https://github.com/Sam-Belliveau/flying-dutchman",
  bullets: (
    bullet(
      line[Built a Rust UCI chess engine on alpha-beta search with iterative deepening, then added opponent modeling:],
      line[on the opponent's turns it searches only the moves a shallow search rates highly, as a human would.],
    ),
    bullet(
      line[Ran it as a Lichess bot, then used Maia's human-move networks inside lc0 to search for traps humans fall into.],
    ),
  ),
)
