#import "../../lib/lib.typ": project, bullet, line

#let entry = project(
  title: "SmolVLA: FPGA Accelerator for Vision-Language-Action Models",
  tech: ("HLS", "C++ / Python"),
  dates: "08/2025 — 12/2025",
  bullets: (
    bullet(
      line[Designed a spatial dataflow architecture on a Xilinx Alveo U280 FPGA accelerating SmolVLA's vision encoder.],
    ),
    bullet(
      line[Pipelined streaming softmax to overlap QKV projection with attention math — about 20 ms at 277 MAC/byte.],
    ),
  ),
)
