#import "../../lib/lib.typ": project, bullet, line

// Three-person team (with E. Reiss and S. Shen); Sam co-designed the kernels.
// Numbers from the team's report: 17.81 ms attention kernel, 277 MACs/byte.
#let entry = project(
  title: "SmolVLA: FPGA Accelerator for Vision-Language-Action Models",
  tech: ("HLS", "C++ / Python"),
  dates: "08/2025 — 12/2025",
  bullets: (
    bullet(
      line[In a team of three, designed a spatial dataflow accelerator for SmolVLA's vision encoder on an Alveo U280.],
    ),
    bullet(
      line[Pipelined a streaming softmax so the QKV projection overlaps attention, bringing the kernel to 17.8 ms.],
    ),
  ),
)
