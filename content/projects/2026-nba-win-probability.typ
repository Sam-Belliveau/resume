#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "NBA In-Game Win-Probability Model",
  tech: ("Python", "PyTorch"),
  dates: "02/2026",
  bullets: (
    bullet(
      line[Trained a from-scratch causal Transformer over raw NBA play-by-play event streams, fusing six embedding channels],
      line[to predict live win probabilities and complete player-scoring probability distributions rather than single-point estimates.],
    ),
    bullet(
      line[Embedded the game clock as high-resolution Kaiser-windowed Fourier features — sin/cos banks with amplitudes shaped],
      line[to suppress spectral leakage — fused with the other streams through a learned projection into the model dimension.],
    ),
  ),
)
