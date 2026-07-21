#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "Bijective LLM Arithmetic Coder",
  tech: ("Python", "Information Theory", "Cryptography"),
  dates: "02/2026 — 06/2026",
  bullets: (
    bullet(
      line[Wrote an exact-integer arithmetic coder that uses a large language model's next-token distribution as its probability],
      line[model, quantizing floating-point logits into deterministic integer counts so the encoder and decoder agree bit-for-bit.],
    ),
    bullet(
      line[Made the coder fully bijective on bits — every possible bit string round-trips exactly — so ChaCha20-encrypted payloads],
      line[decode to fluent cover text under any decryption key, and validated the bijection with test suites run on real models.],
    ),
  ),
)
