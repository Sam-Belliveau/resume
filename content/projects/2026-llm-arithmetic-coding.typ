#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Bijective LLM Arithmetic Coder",
  tech: ("Python", "Information Theory", "Cryptography"),
  dates: "02/2026 — 06/2026",
  bullets: (
    bullet(
      line[Wrote an exact-integer arithmetic coder that uses an LLM's next-token distribution as its probability model,],
      line[quantizing floating-point logits into deterministic integer counts so the encoder and decoder agree bit-for-bit.],
    ),
    bullet(
      line[Made it a bijection between bit strings and text, so a ChaCha20 ciphertext decodes to fluent text under any key.],
    ),
  ),
)
