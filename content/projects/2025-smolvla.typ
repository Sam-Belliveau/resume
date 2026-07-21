#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "SmolVLA: FPGA Accelerator for Vision-Language-Action Models",
  tech: ("High-Level Synthesis", "C++ / Python"),
  dates: "08/2025 — 12/2025",
  bullets: (
    bullet(
      line[Designed a spatial dataflow architecture on a Xilinx Alveo U280 FPGA to accelerate the vision encoder of the SmolVLA model.],
    ),
    bullet(
      line[Built a streaming-softmax pipeline that overlaps QKV projection with attention-score math, hitting about 20 ms at 277 MAC/byte.],
    ),
  ),
)
